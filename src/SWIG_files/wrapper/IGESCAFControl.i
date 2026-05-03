/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_igescafcontrol.html"
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
		/****** md5 signature: 5edecb464971cf53c455413682565ec3 ******/
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
		static Quantity_Color DecodeColor(const int col);

		/****** IGESCAFControl::EncodeColor ******/
		/****** md5 signature: f1c669bc7188cef6206805fa9638aed5 ******/
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
		static int EncodeColor(const Quantity_Color & col);

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
Creates a reader with an empty IGES model and sets ColorMode, LayerMode and NameMode to true.
") IGESCAFControl_Reader;
		 IGESCAFControl_Reader();

		/****** IGESCAFControl_Reader::IGESCAFControl_Reader ******/
		/****** md5 signature: bc2f1dabc58d5098260896e692846567 ******/
		%feature("compactdefaultargs") IGESCAFControl_Reader;
		%feature("autodoc", "
Parameters
----------
theWS: XSControl_WorkSession
FromScratch: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a reader tool and attaches it to an already existing Session Clears the session if it was not yet set for IGES.
") IGESCAFControl_Reader;
		 IGESCAFControl_Reader(const opencascade::handle<XSControl_WorkSession> & theWS, const bool FromScratch = true);

		/****** IGESCAFControl_Reader::GetColorMode ******/
		/****** md5 signature: 4d12dea091429eeedb4bf6c71b34f3d6 ******/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetColorMode;
		bool GetColorMode();

		/****** IGESCAFControl_Reader::GetLayerMode ******/
		/****** md5 signature: 58ee64d1f619e943de13f451cbd310a0 ******/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetLayerMode;
		bool GetLayerMode();

		/****** IGESCAFControl_Reader::GetNameMode ******/
		/****** md5 signature: bf2db5529449086fe5e7b5607565732f ******/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetNameMode;
		bool GetNameMode();

		/****** IGESCAFControl_Reader::Perform ******/
		/****** md5 signature: a3d981542b3775ff1cc248c10a5516e9 ******/
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
		bool Perform(TCollection_AsciiString theFileName, const opencascade::handle<TDocStd_Document> & theDoc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Reader::Perform ******/
		/****** md5 signature: 12d0af42c9ecaa1e1f52ccb4520f91ac ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theFileName: char *
theDoc: TDocStd_Document
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Translate IGES file given by filename into the document Return True if succeeded, and False in case of fail.
") Perform;
		bool Perform(const char * const theFileName, const opencascade::handle<TDocStd_Document> & theDoc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Reader::SetColorMode ******/
		/****** md5 signature: eeb930c65d2dcf67f906702c018c6056 ******/
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
		void SetColorMode(const bool theMode);

		/****** IGESCAFControl_Reader::SetLayerMode ******/
		/****** md5 signature: 807a22208fd801302e3a4900edff07ad ******/
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
		void SetLayerMode(const bool theMode);

		/****** IGESCAFControl_Reader::SetNameMode ******/
		/****** md5 signature: 1ccad2641d989eaf13e2d3e1a6bbe9cf ******/
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
		void SetNameMode(const bool theMode);

		/****** IGESCAFControl_Reader::Transfer ******/
		/****** md5 signature: 8fa3cacbcd7ccc0af4ebf341db653113 ******/
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
		bool Transfer(const opencascade::handle<TDocStd_Document> & theDoc, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
Creates a writer with an empty IGES model and sets ColorMode, LayerMode and NameMode to true.
") IGESCAFControl_Writer;
		 IGESCAFControl_Writer();

		/****** IGESCAFControl_Writer::IGESCAFControl_Writer ******/
		/****** md5 signature: 209a0903767655fc7024db384114c752 ******/
		%feature("compactdefaultargs") IGESCAFControl_Writer;
		%feature("autodoc", "
Parameters
----------
WS: XSControl_WorkSession
scratch: bool (optional, default to true)

Return
-------
None

Description
-----------
Creates a reader tool and attaches it to an already existing Session Clears the session if it was not yet set for IGES.
") IGESCAFControl_Writer;
		 IGESCAFControl_Writer(const opencascade::handle<XSControl_WorkSession> & WS, const bool scratch = true);

		/****** IGESCAFControl_Writer::IGESCAFControl_Writer ******/
		/****** md5 signature: 38c9f5924cb504bc0228de6a476eecb0 ******/
		%feature("compactdefaultargs") IGESCAFControl_Writer;
		%feature("autodoc", "
Parameters
----------
theWS: XSControl_WorkSession
theUnit: char *

Return
-------
None

Description
-----------
Creates a reader tool and attaches it to an already existing Session Clears the session if it was not yet set for IGES Sets target Unit for the writing process.
") IGESCAFControl_Writer;
		 IGESCAFControl_Writer(const opencascade::handle<XSControl_WorkSession> & theWS, const char * const theUnit);

		/****** IGESCAFControl_Writer::GetColorMode ******/
		/****** md5 signature: 47aafb243dc0cf537a98e98687d6f205 ******/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetColorMode;
		bool GetColorMode();

		/****** IGESCAFControl_Writer::GetLayerMode ******/
		/****** md5 signature: 1f81bf4f7295796afc74e524a82c2b3b ******/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetLayerMode;
		bool GetLayerMode();

		/****** IGESCAFControl_Writer::GetNameMode ******/
		/****** md5 signature: 6f8d1c342487171700ccc3fdc91f526b ******/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") GetNameMode;
		bool GetNameMode();

		/****** IGESCAFControl_Writer::Perform ******/
		/****** md5 signature: 6c0731e4db61e5276e511b169b9728fc ******/
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
		bool Perform(const opencascade::handle<TDocStd_Document> & doc, TCollection_AsciiString filename, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Writer::Perform ******/
		/****** md5 signature: 3b775fa7cc639f21d8961a503778246b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
doc: TDocStd_Document
filename: char *
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers a document and writes it to a IGES file Returns True if translation is OK.
") Perform;
		bool Perform(const opencascade::handle<TDocStd_Document> & doc, const char * const filename, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Writer::SetColorMode ******/
		/****** md5 signature: 30e8b787409ddb6f7d8546dbc2ad7253 ******/
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
		void SetColorMode(const bool colormode);

		/****** IGESCAFControl_Writer::SetLayerMode ******/
		/****** md5 signature: 92c9452fe5fa66a3bfc6885c311f49b8 ******/
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
		void SetLayerMode(const bool layermode);

		/****** IGESCAFControl_Writer::SetNameMode ******/
		/****** md5 signature: 1d94dc8e2546e21d290b9e471b582cde ******/
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
		void SetNameMode(const bool namemode);

		/****** IGESCAFControl_Writer::Transfer ******/
		/****** md5 signature: 5ab794241ab47932ed6daf0a674a15e3 ******/
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
		bool Transfer(const opencascade::handle<TDocStd_Document> & doc, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Writer::Transfer ******/
		/****** md5 signature: 538e8cd33d4db90deaa9ebaf11adab73 ******/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "
Parameters
----------
labels: NCollection_Sequence<TDF_Label>
theProgress: Message_ProgressRange (optional, default to Message_ProgressRange())

Return
-------
bool

Description
-----------
Transfers labels to a IGES model Returns True if translation is OK.
") Transfer;
		bool Transfer(const NCollection_Sequence<TDF_Label> & labels, const Message_ProgressRange & theProgress = Message_ProgressRange());

		/****** IGESCAFControl_Writer::Transfer ******/
		/****** md5 signature: ca7b47ce1b5e362004eefb01c34a9039 ******/
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
		bool Transfer(const TDF_Label & label, const Message_ProgressRange & theProgress = Message_ProgressRange());

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
