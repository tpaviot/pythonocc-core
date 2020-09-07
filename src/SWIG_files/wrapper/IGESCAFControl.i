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
%define IGESCAFCONTROLDOCSTRING
"IGESCAFControl module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_igescafcontrol.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


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
%import TDF.i

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

/***********************
* class IGESCAFControl *
***********************/
%rename(igescafcontrol) IGESCAFControl;
class IGESCAFControl {
	public:
		/****************** DecodeColor ******************/
		/**** md5 signature: 412697bd8d78fc5979403a70aef21561 ****/
		%feature("compactdefaultargs") DecodeColor;
		%feature("autodoc", "Provides a tool for writing iges file converts iges color index to cascade color.

Parameters
----------
col: int

Returns
-------
Quantity_Color
") DecodeColor;
		static Quantity_Color DecodeColor(const Standard_Integer col);

		/****************** EncodeColor ******************/
		/**** md5 signature: b104ced61ad034521f1117876167864c ****/
		%feature("compactdefaultargs") EncodeColor;
		%feature("autodoc", "Tries to convert cascade color to iges color index if no corresponding color defined in iges, returns 0.

Parameters
----------
col: Quantity_Color

Returns
-------
int
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
		/****************** IGESCAFControl_Reader ******************/
		/**** md5 signature: 247dc9b3de494ba90e36e7db39edee6b ****/
		%feature("compactdefaultargs") IGESCAFControl_Reader;
		%feature("autodoc", "Creates a reader with an empty iges model and sets colormode, layermode and namemode to standard_true.

Returns
-------
None
") IGESCAFControl_Reader;
		 IGESCAFControl_Reader();

		/****************** IGESCAFControl_Reader ******************/
		/**** md5 signature: ed2325657273ea5f907b2a7d8ba9ffcc ****/
		%feature("compactdefaultargs") IGESCAFControl_Reader;
		%feature("autodoc", "Creates a reader tool and attaches it to an already existing session clears the session if it was not yet set for iges.

Parameters
----------
theWS: XSControl_WorkSession
FromScratch: bool,optional
	default value is Standard_True

Returns
-------
None
") IGESCAFControl_Reader;
		 IGESCAFControl_Reader(const opencascade::handle<XSControl_WorkSession> & theWS, const Standard_Boolean FromScratch = Standard_True);

		/****************** GetColorMode ******************/
		/**** md5 signature: cddb885e605f1794a5a6486023f65736 ****/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetColorMode;
		Standard_Boolean GetColorMode();

		/****************** GetLayerMode ******************/
		/**** md5 signature: b6b1458608d2429d13e63a07c0b392d8 ****/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetLayerMode;
		Standard_Boolean GetLayerMode();

		/****************** GetNameMode ******************/
		/**** md5 signature: 1097f532a68b4625a0108cddc8366238 ****/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetNameMode;
		Standard_Boolean GetNameMode();

		/****************** Perform ******************/
		/**** md5 signature: e652c0b0d38310751ab441ba20ba5559 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
theFileName: TCollection_AsciiString
theDoc: TDocStd_Document

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const TCollection_AsciiString & theFileName, opencascade::handle<TDocStd_Document> & theDoc);

		/****************** Perform ******************/
		/**** md5 signature: f1911b5cd7700c430c137adb78fb01e5 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Translate iges file given by filename into the document return true if succeeded, and false in case of fail.

Parameters
----------
theFileName: char *
theDoc: TDocStd_Document

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const char * theFileName, opencascade::handle<TDocStd_Document> & theDoc);

		/****************** SetColorMode ******************/
		/**** md5 signature: 7026741e7d147d7065572beb98babc6e ****/
		%feature("compactdefaultargs") SetColorMode;
		%feature("autodoc", "Set colormode for indicate read colors or not.

Parameters
----------
theMode: bool

Returns
-------
None
") SetColorMode;
		void SetColorMode(const Standard_Boolean theMode);

		/****************** SetLayerMode ******************/
		/**** md5 signature: 81f87cc05a87da11feacb0420dc37c4b ****/
		%feature("compactdefaultargs") SetLayerMode;
		%feature("autodoc", "Set layermode for indicate read layers or not.

Parameters
----------
theMode: bool

Returns
-------
None
") SetLayerMode;
		void SetLayerMode(const Standard_Boolean theMode);

		/****************** SetNameMode ******************/
		/**** md5 signature: a69a0615cbbe8af82773337e918a7087 ****/
		%feature("compactdefaultargs") SetNameMode;
		%feature("autodoc", "Set namemode for indicate read name or not.

Parameters
----------
theMode: bool

Returns
-------
None
") SetNameMode;
		void SetNameMode(const Standard_Boolean theMode);

		/****************** Transfer ******************/
		/**** md5 signature: a06080571a225caecfed6f5fe067f54e ****/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Translates currently loaded iges file into the document returns true if succeeded, and false in case of fail.

Parameters
----------
theDoc: TDocStd_Document

Returns
-------
bool
") Transfer;
		Standard_Boolean Transfer(opencascade::handle<TDocStd_Document> & theDoc);

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
		/****************** IGESCAFControl_Writer ******************/
		/**** md5 signature: 34a554f8fe0d098b53da598d84fdc271 ****/
		%feature("compactdefaultargs") IGESCAFControl_Writer;
		%feature("autodoc", "Creates a writer with an empty iges model and sets colormode, layermode and namemode to standard_true.

Returns
-------
None
") IGESCAFControl_Writer;
		 IGESCAFControl_Writer();

		/****************** IGESCAFControl_Writer ******************/
		/**** md5 signature: 185eb49db43948a75dc15c0c48b3f1bc ****/
		%feature("compactdefaultargs") IGESCAFControl_Writer;
		%feature("autodoc", "Creates a reader tool and attaches it to an already existing session clears the session if it was not yet set for iges.

Parameters
----------
WS: XSControl_WorkSession
scratch: bool,optional
	default value is Standard_True

Returns
-------
None
") IGESCAFControl_Writer;
		 IGESCAFControl_Writer(const opencascade::handle<XSControl_WorkSession> & WS, const Standard_Boolean scratch = Standard_True);

		/****************** GetColorMode ******************/
		/**** md5 signature: 010da6a8a0e8a61fdb607fd6faba2b56 ****/
		%feature("compactdefaultargs") GetColorMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetColorMode;
		Standard_Boolean GetColorMode();

		/****************** GetLayerMode ******************/
		/**** md5 signature: d677385c303e067613f92bc738509727 ****/
		%feature("compactdefaultargs") GetLayerMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetLayerMode;
		Standard_Boolean GetLayerMode();

		/****************** GetNameMode ******************/
		/**** md5 signature: 2dd32a893d6f5f4666ac3752ace2d12f ****/
		%feature("compactdefaultargs") GetNameMode;
		%feature("autodoc", "No available documentation.

Returns
-------
bool
") GetNameMode;
		Standard_Boolean GetNameMode();

		/****************** Perform ******************/
		/**** md5 signature: 568905c89cd5500b59795a9f3620e181 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "No available documentation.

Parameters
----------
doc: TDocStd_Document
filename: TCollection_AsciiString

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const opencascade::handle<TDocStd_Document> & doc, const TCollection_AsciiString & filename);

		/****************** Perform ******************/
		/**** md5 signature: 9c7d09eb0ac5c8058bfcbfedd53d6de8 ****/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "Transfers a document and writes it to a iges file returns true if translation is ok.

Parameters
----------
doc: TDocStd_Document
filename: char *

Returns
-------
bool
") Perform;
		Standard_Boolean Perform(const opencascade::handle<TDocStd_Document> & doc, const char * filename);

		/****************** SetColorMode ******************/
		/**** md5 signature: e8d41838c31a9460a1c83d84b1f572a1 ****/
		%feature("compactdefaultargs") SetColorMode;
		%feature("autodoc", "Set colormode for indicate write colors or not.

Parameters
----------
colormode: bool

Returns
-------
None
") SetColorMode;
		void SetColorMode(const Standard_Boolean colormode);

		/****************** SetLayerMode ******************/
		/**** md5 signature: 3ec21c8de4b114a83bb0b34cb3b98662 ****/
		%feature("compactdefaultargs") SetLayerMode;
		%feature("autodoc", "Set layermode for indicate write layers or not.

Parameters
----------
layermode: bool

Returns
-------
None
") SetLayerMode;
		void SetLayerMode(const Standard_Boolean layermode);

		/****************** SetNameMode ******************/
		/**** md5 signature: 43ccb5d3fb024d8191f251ee74d0f6ba ****/
		%feature("compactdefaultargs") SetNameMode;
		%feature("autodoc", "Set namemode for indicate write name or not.

Parameters
----------
namemode: bool

Returns
-------
None
") SetNameMode;
		void SetNameMode(const Standard_Boolean namemode);

		/****************** Transfer ******************/
		/**** md5 signature: 260eb88cdd9088aa238875d4d270b0fc ****/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Transfers a document to a iges model returns true if translation is ok.

Parameters
----------
doc: TDocStd_Document

Returns
-------
bool
") Transfer;
		Standard_Boolean Transfer(const opencascade::handle<TDocStd_Document> & doc);

		/****************** Transfer ******************/
		/**** md5 signature: 9ecf8faf2a261a881dd417671de6767b ****/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Transfers labels to a iges model returns true if translation is ok.

Parameters
----------
labels: TDF_LabelSequence

Returns
-------
bool
") Transfer;
		Standard_Boolean Transfer(const TDF_LabelSequence & labels);

		/****************** Transfer ******************/
		/**** md5 signature: 903b4ad659f349ae87f519f18a64e6bc ****/
		%feature("compactdefaultargs") Transfer;
		%feature("autodoc", "Transfers label to a iges model returns true if translation is ok.

Parameters
----------
label: TDF_Label

Returns
-------
bool
") Transfer;
		Standard_Boolean Transfer(const TDF_Label & label);

};


%extend IGESCAFControl_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
