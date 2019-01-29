/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)


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
%define BINDRIVERSDOCSTRING
"No docstring provided."
%enddef
%module (package="OCC.Core", docstring=BINDRIVERSDOCSTRING) BinDrivers

#pragma SWIG nowarn=504,325,503,520,350,351,383,389,394,395, 404

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


%include BinDrivers_headers.i

/* templates */
/* end templates declaration */


/* typedefs */
/* end typedefs declaration */

/* public enums */
enum BinDrivers_Marker {
	BinDrivers_ENDATTRLIST = - 1,
	BinDrivers_ENDLABEL = - 2,
};

/* end public enums declaration */

%wrap_handle(BinDrivers_DocumentRetrievalDriver)
%wrap_handle(BinDrivers_DocumentStorageDriver)

%rename(bindrivers) BinDrivers;
%nodefaultctor BinDrivers;
class BinDrivers {
	public:
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	* Creates the table of drivers of types supported

	:param MsgDrv:
	:type MsgDrv: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		static Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & MsgDrv);
		%feature("compactdefaultargs") DefineFormat;
		%feature("autodoc", "	* Defines format 'BinOcaf' and registers its read and write drivers in the specified application

	:param theApp:
	:type theApp: Handle_TDocStd_Application &
	:rtype: void
") DefineFormat;
		static void DefineFormat (const Handle_TDocStd_Application & theApp);
		%feature("compactdefaultargs") Factory;
		%feature("autodoc", "	:param theGUID:
	:type theGUID: Standard_GUID &
	:rtype: Handle_Standard_Transient
") Factory;
		Handle_Standard_Transient Factory (const Standard_GUID & theGUID);
		%feature("compactdefaultargs") StorageVersion;
		%feature("autodoc", "	* returns '1'

	:rtype: TCollection_AsciiString
") StorageVersion;
		static TCollection_AsciiString StorageVersion ();
};


%extend BinDrivers {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinDrivers_DocumentRetrievalDriver;
class BinDrivers_DocumentRetrievalDriver : public BinLDrivers_DocumentRetrievalDriver {
	public:
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") BinDrivers_DocumentRetrievalDriver;
		%feature("autodoc", "	* Constructor

	:rtype: None
") BinDrivers_DocumentRetrievalDriver;
		 BinDrivers_DocumentRetrievalDriver ();
		%feature("compactdefaultargs") CheckShapeSection;
		%feature("autodoc", "	:param thePos:
	:type thePos: Storage_Position &
	:param theIS:
	:type theIS: Standard_IStream &
	:rtype: void
") CheckShapeSection;
		virtual void CheckShapeSection (const Storage_Position & thePos,Standard_IStream & theIS);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the NamedShape driver

	:rtype: void
") Clear;
		virtual void Clear ();
		%feature("compactdefaultargs") PropagateDocumentVersion;
		%feature("autodoc", "	:param theVersion:
	:type theVersion: int
	:rtype: void
") PropagateDocumentVersion;
		virtual void PropagateDocumentVersion (const Standard_Integer theVersion);
		%feature("compactdefaultargs") ReadShapeSection;
		%feature("autodoc", "	:param theSection:
	:type theSection: BinLDrivers_DocumentSection &
	:param theIS:
	:type theIS: Standard_IStream &
	:param isMess: default value is Standard_False
	:type isMess: bool
	:rtype: void
") ReadShapeSection;
		virtual void ReadShapeSection (BinLDrivers_DocumentSection & theSection,Standard_IStream & theIS,const Standard_Boolean isMess = Standard_False);
};


%make_alias(BinDrivers_DocumentRetrievalDriver)

%extend BinDrivers_DocumentRetrievalDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BinDrivers_DocumentStorageDriver;
class BinDrivers_DocumentStorageDriver : public BinLDrivers_DocumentStorageDriver {
	public:
		%feature("compactdefaultargs") AttributeDrivers;
		%feature("autodoc", "	:param theMsgDriver:
	:type theMsgDriver: Handle_CDM_MessageDriver &
	:rtype: Handle_BinMDF_ADriverTable
") AttributeDrivers;
		virtual Handle_BinMDF_ADriverTable AttributeDrivers (const Handle_CDM_MessageDriver & theMsgDriver);
		%feature("compactdefaultargs") BinDrivers_DocumentStorageDriver;
		%feature("autodoc", "	* Constructor

	:rtype: None
") BinDrivers_DocumentStorageDriver;
		 BinDrivers_DocumentStorageDriver ();
		%feature("compactdefaultargs") IsWithTriangles;
		%feature("autodoc", "	* Return true if shape should be stored with triangles.

	:rtype: bool
") IsWithTriangles;
		Standard_Boolean IsWithTriangles ();
		%feature("compactdefaultargs") SetWithTriangles;
		%feature("autodoc", "	* Set if triangulation should be stored or not.

	:param theMessageDriver:
	:type theMessageDriver: Handle_CDM_MessageDriver &
	:param theWithTriangulation:
	:type theWithTriangulation: bool
	:rtype: None
") SetWithTriangles;
		void SetWithTriangles (const Handle_CDM_MessageDriver & theMessageDriver,const Standard_Boolean theWithTriangulation);
		%feature("compactdefaultargs") WriteShapeSection;
		%feature("autodoc", "	* implements the procedure of writing a shape section to file

	:param theDocSection:
	:type theDocSection: BinLDrivers_DocumentSection &
	:param theOS:
	:type theOS: Standard_OStream &
	:rtype: void
") WriteShapeSection;
		virtual void WriteShapeSection (BinLDrivers_DocumentSection & theDocSection,Standard_OStream & theOS);
};


%make_alias(BinDrivers_DocumentStorageDriver)

%extend BinDrivers_DocumentStorageDriver {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
