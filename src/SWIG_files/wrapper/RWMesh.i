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

/*
This file was automatically generated using the pythonocc_generator, see
https://github.com/tpaviot/pythonocc-generator.

This file is platform independant, but was generated under the following
conditions:

- operating system : debian Linux 4.15.0-66-generic
- occt version targeted : 7.4.0
*/

%define RWMESHDOCSTRING
"RWMesh module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_RWMesh.html"
%enddef
%module (package="OCC.Core", docstring=RWMESHDOCSTRING) RWMesh

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


%include RWMesh_headers.i

/* public enums */
enum RWMesh_CoordinateSystem {
	RWMesh_CoordinateSystem_Undefined = - 1,
	RWMesh_CoordinateSystem_posYfwd_posZup = 0,
	RWMesh_CoordinateSystem_negZfwd_posYup = 1,
	RWMesh_CoordinateSystem_Blender = RWMesh_CoordinateSystem_posYfwd_posZup,
	RWMesh_CoordinateSystem_glTF = RWMesh_CoordinateSystem_negZfwd_posYup,
	RWMesh_CoordinateSystem_Zup = RWMesh_CoordinateSystem_Blender,
	RWMesh_CoordinateSystem_Yup = RWMesh_CoordinateSystem_glTF,
};

enum RWMesh_CafReaderStatusEx {
	RWMesh_CafReaderStatusEx_NONE = 0,
	RWMesh_CafReaderStatusEx_Partial = 1,
};

/* end public enums declaration */

/* handles */
%wrap_handle(RWMesh_CafReader)
/* end handles declaration */

/* templates */
%template(RWMesh_NodeAttributeMap) NCollection_DataMap <TopoDS_Shape , RWMesh_NodeAttributes , TopTools_ShapeMapHasher>;
/* end templates declaration */

/* typedefs */
typedef NCollection_DataMap <TopoDS_Shape , RWMesh_NodeAttributes , TopTools_ShapeMapHasher> RWMesh_NodeAttributeMap;
/* end typedefs declaration */

%nodefaultctor RWMesh_CafReader;
class RWMesh_CafReader : public Standard_Transient {
	public:
		%feature("compactdefaultargs") CoordinateSystemConverter;
		%feature("autodoc", "	* Return coordinate system converter.

	:rtype: RWMesh_CoordinateSystemConverter
") CoordinateSystemConverter;
		const RWMesh_CoordinateSystemConverter & CoordinateSystemConverter ();
		%feature("compactdefaultargs") Document;
		%feature("autodoc", "	* Return target document.

	:rtype: opencascade::handle<TDocStd_Document>
") Document;
		const opencascade::handle<TDocStd_Document> & Document ();
		%feature("compactdefaultargs") ExternalFiles;
		%feature("autodoc", "	* Return the list of complementary files - external references (textures, data, etc.).

	:rtype: NCollection_IndexedMap<TCollection_AsciiString>
") ExternalFiles;
		const NCollection_IndexedMap<TCollection_AsciiString> & ExternalFiles ();
		%feature("compactdefaultargs") ExtraStatus;
		%feature("autodoc", "	* Return extended status flags. @sa RWMesh_CafReaderStatusEx enumeration.

	:rtype: int
") ExtraStatus;
		Standard_Integer ExtraStatus ();
		%feature("compactdefaultargs") FileCoordinateSystem;
		%feature("autodoc", "	* Return file origin coordinate system; can be UNDEFINED, which means no conversion will be done.

	:rtype: gp_Ax3
") FileCoordinateSystem;
		const gp_Ax3  FileCoordinateSystem ();
		%feature("compactdefaultargs") FileLengthUnit;
		%feature("autodoc", "	* Return the length unit to convert from while reading the file, defined as scale factor for m (meters). Can be undefined (-1.0) if file format is unitless.

	:rtype: float
") FileLengthUnit;
		Standard_Real FileLengthUnit ();
		%feature("compactdefaultargs") HasFileCoordinateSystem;
		%feature("autodoc", "	* Return True if file origin coordinate system has been defined.

	:rtype: bool
") HasFileCoordinateSystem;
		Standard_Boolean HasFileCoordinateSystem ();
		%feature("compactdefaultargs") HasSystemCoordinateSystem;
		%feature("autodoc", "	* Return True if system coordinate system has been defined; False by default.

	:rtype: bool
") HasSystemCoordinateSystem;
		Standard_Boolean HasSystemCoordinateSystem ();
		%feature("compactdefaultargs") MemoryLimitMiB;
		%feature("autodoc", "	* Return memory usage limit in MiB, -1 by default which means no limit.

	:rtype: int
") MemoryLimitMiB;
		Standard_Integer MemoryLimitMiB ();
		%feature("compactdefaultargs") Metadata;
		%feature("autodoc", "	* Return metadata map.

	:rtype: TColStd_IndexedDataMapOfStringString
") Metadata;
		const TColStd_IndexedDataMapOfStringString & Metadata ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Read the data from specified file. The Document instance should be set beforehand.

	:param theFile:
	:type theFile: TCollection_AsciiString &
	:param theProgress:
	:type theProgress: opencascade::handle<Message_ProgressIndicator> &
	:rtype: bool
") Perform;
		bool Perform (const TCollection_AsciiString & theFile,const opencascade::handle<Message_ProgressIndicator> & theProgress);
		%feature("compactdefaultargs") ProbeHeader;
		%feature("autodoc", "	* Read the header data from specified file without reading entire model. The main purpose is collecting metadata and external references - for copying model into a new location, for example. Can be NOT implemented (unsupported by format / reader).

	:param theFile:
	:type theFile: TCollection_AsciiString &
	:param theProgress: default value is opencascade::handle<Message_ProgressIndicator>()
	:type theProgress: opencascade::handle<Message_ProgressIndicator> &
	:rtype: bool
") ProbeHeader;
		Standard_Boolean ProbeHeader (const TCollection_AsciiString & theFile,const opencascade::handle<Message_ProgressIndicator> & theProgress = opencascade::handle<Message_ProgressIndicator>());
		%feature("compactdefaultargs") RootPrefix;
		%feature("autodoc", "	* Return prefix for generating root labels names.

	:rtype: TCollection_AsciiString
") RootPrefix;
		const TCollection_AsciiString & RootPrefix ();
		%feature("compactdefaultargs") SetCoordinateSystemConverter;
		%feature("autodoc", "	* Set coordinate system converter.

	:param theConverter:
	:type theConverter: RWMesh_CoordinateSystemConverter &
	:rtype: None
") SetCoordinateSystemConverter;
		void SetCoordinateSystemConverter (const RWMesh_CoordinateSystemConverter & theConverter);
		%feature("compactdefaultargs") SetDocument;
		%feature("autodoc", "	* Set target document.

	:param theDoc:
	:type theDoc: opencascade::handle<TDocStd_Document> &
	:rtype: None
") SetDocument;
		void SetDocument (const opencascade::handle<TDocStd_Document> & theDoc);
		%feature("compactdefaultargs") SetFileCoordinateSystem;
		%feature("autodoc", "	* Set (override) file origin coordinate system to perform conversion during read.

	:param theCS:
	:type theCS: gp_Ax3
	:rtype: None
") SetFileCoordinateSystem;
		void SetFileCoordinateSystem (const gp_Ax3 & theCS);
		%feature("compactdefaultargs") SetFileCoordinateSystem;
		%feature("autodoc", "	* Set (override) file origin coordinate system to perform conversion during read.

	:param theCS:
	:type theCS: RWMesh_CoordinateSystem
	:rtype: None
") SetFileCoordinateSystem;
		void SetFileCoordinateSystem (RWMesh_CoordinateSystem theCS);
		%feature("compactdefaultargs") SetFileLengthUnit;
		%feature("autodoc", "	* Set (override) file length units to convert from while reading the file, defined as scale factor for m (meters).

	:param theUnits:
	:type theUnits: float
	:rtype: None
") SetFileLengthUnit;
		void SetFileLengthUnit (Standard_Real theUnits);
		%feature("compactdefaultargs") SetFillIncompleteDocument;
		%feature("autodoc", "	* Set flag allowing partially read file content to be put into the XDE document.

	:param theToFillIncomplete:
	:type theToFillIncomplete: bool
	:rtype: None
") SetFillIncompleteDocument;
		void SetFillIncompleteDocument (Standard_Boolean theToFillIncomplete);
		%feature("compactdefaultargs") SetMemoryLimitMiB;
		%feature("autodoc", "	* Set memory usage limit in MiB; can be ignored by reader implementation!

	:param theLimitMiB:
	:type theLimitMiB: int
	:rtype: None
") SetMemoryLimitMiB;
		void SetMemoryLimitMiB (Standard_Integer theLimitMiB);
		%feature("compactdefaultargs") SetRootPrefix;
		%feature("autodoc", "	* Set prefix for generating root labels names

	:param theRootPrefix:
	:type theRootPrefix: TCollection_AsciiString &
	:rtype: None
") SetRootPrefix;
		void SetRootPrefix (const TCollection_AsciiString & theRootPrefix);
		%feature("compactdefaultargs") SetSystemCoordinateSystem;
		%feature("autodoc", "	* Set system origin coordinate system to perform conversion into during read.

	:param theCS:
	:type theCS: gp_Ax3
	:rtype: None
") SetSystemCoordinateSystem;
		void SetSystemCoordinateSystem (const gp_Ax3 & theCS);
		%feature("compactdefaultargs") SetSystemCoordinateSystem;
		%feature("autodoc", "	* Set system origin coordinate system to perform conversion into during read.

	:param theCS:
	:type theCS: RWMesh_CoordinateSystem
	:rtype: None
") SetSystemCoordinateSystem;
		void SetSystemCoordinateSystem (RWMesh_CoordinateSystem theCS);
		%feature("compactdefaultargs") SetSystemLengthUnit;
		%feature("autodoc", "	* Set system length units to convert into while reading the file, defined as scale factor for m (meters).

	:param theUnits:
	:type theUnits: float
	:rtype: None
") SetSystemLengthUnit;
		void SetSystemLengthUnit (Standard_Real theUnits);
		%feature("compactdefaultargs") SingleShape;
		%feature("autodoc", "	* Return result as a single shape.

	:rtype: TopoDS_Shape
") SingleShape;
		TopoDS_Shape SingleShape ();
		%feature("compactdefaultargs") SystemCoordinateSystem;
		%feature("autodoc", "	* Return system coordinate system; UNDEFINED by default, which means that no conversion will be done.

	:rtype: gp_Ax3
") SystemCoordinateSystem;
		const gp_Ax3  SystemCoordinateSystem ();
		%feature("compactdefaultargs") SystemLengthUnit;
		%feature("autodoc", "	* Return the length unit to convert into while reading the file, defined as scale factor for m (meters); -1.0 by default, which means that NO conversion will be applied.

	:rtype: float
") SystemLengthUnit;
		Standard_Real SystemLengthUnit ();
		%feature("compactdefaultargs") ToFillIncompleteDocument;
		%feature("autodoc", "	* Flag indicating if partially read file content should be put into the XDE document, True by default. //! Partial read means unexpected end of file, critical parsing syntax errors in the middle of file, or reached memory limit indicated by performMesh() returning False. Partial read allows importing a model even in case of formal reading failure, so that it will be up to user to decide if processed data has any value. //! In case of partial read (performMesh() returns False, but there are some data that could be put into document), Perform() will return True and result flag will have failure bit set. @sa MemoryLimitMiB(), ExtraStatus().

	:rtype: bool
") ToFillIncompleteDocument;
		Standard_Boolean ToFillIncompleteDocument ();
};


%make_alias(RWMesh_CafReader)

%extend RWMesh_CafReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWMesh_CoordinateSystemConverter;
class RWMesh_CoordinateSystemConverter {
	public:
		%feature("compactdefaultargs") HasInputCoordinateSystem;
		%feature("autodoc", "	* Return True if source coordinate system has been set; False by default.

	:rtype: bool
") HasInputCoordinateSystem;
		Standard_Boolean HasInputCoordinateSystem ();
		%feature("compactdefaultargs") HasOutputCoordinateSystem;
		%feature("autodoc", "	* Return True if destination coordinate system has been set; False by default.

	:rtype: bool
") HasOutputCoordinateSystem;
		Standard_Boolean HasOutputCoordinateSystem ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialize transformation.

	:param theInputSystem:
	:type theInputSystem: gp_Ax3
	:param theInputLengthUnit:
	:type theInputLengthUnit: float
	:param theOutputSystem:
	:type theOutputSystem: gp_Ax3
	:param theOutputLengthUnit:
	:type theOutputLengthUnit: float
	:rtype: None
") Init;
		void Init (const gp_Ax3 & theInputSystem,Standard_Real theInputLengthUnit,const gp_Ax3 & theOutputSystem,Standard_Real theOutputLengthUnit);
		%feature("compactdefaultargs") InputCoordinateSystem;
		%feature("autodoc", "	* Source coordinate system; UNDEFINED by default.

	:rtype: gp_Ax3
") InputCoordinateSystem;
		const gp_Ax3  InputCoordinateSystem ();
		%feature("compactdefaultargs") InputLengthUnit;
		%feature("autodoc", "	* Return source length units, defined as scale factor to m (meters). -1.0 by default, which means that NO conversion will be applied (regardless output length unit).

	:rtype: float
") InputLengthUnit;
		Standard_Real InputLengthUnit ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Return True if there is no transformation (target and current coordinates systems are same).

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") OutputCoordinateSystem;
		%feature("autodoc", "	* Destination coordinate system; UNDEFINED by default.

	:rtype: gp_Ax3
") OutputCoordinateSystem;
		const gp_Ax3  OutputCoordinateSystem ();
		%feature("compactdefaultargs") OutputLengthUnit;
		%feature("autodoc", "	* Return destination length units, defined as scale factor to m (meters). -1.0 by default, which means that NO conversion will be applied (regardless input length unit).

	:rtype: float
") OutputLengthUnit;
		Standard_Real OutputLengthUnit ();
		%feature("compactdefaultargs") RWMesh_CoordinateSystemConverter;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") RWMesh_CoordinateSystemConverter;
		 RWMesh_CoordinateSystemConverter ();
		%feature("compactdefaultargs") SetInputCoordinateSystem;
		%feature("autodoc", "	* Set source coordinate system.

	:param theSysFrom:
	:type theSysFrom: gp_Ax3
	:rtype: None
") SetInputCoordinateSystem;
		void SetInputCoordinateSystem (const gp_Ax3 & theSysFrom);
		%feature("compactdefaultargs") SetInputCoordinateSystem;
		%feature("autodoc", "	* Set source coordinate system.

	:param theSysFrom:
	:type theSysFrom: RWMesh_CoordinateSystem
	:rtype: None
") SetInputCoordinateSystem;
		void SetInputCoordinateSystem (RWMesh_CoordinateSystem theSysFrom);
		%feature("compactdefaultargs") SetInputLengthUnit;
		%feature("autodoc", "	* Set source length units as scale factor to m (meters).

	:param theInputScale:
	:type theInputScale: float
	:rtype: None
") SetInputLengthUnit;
		void SetInputLengthUnit (Standard_Real theInputScale);
		%feature("compactdefaultargs") SetOutputCoordinateSystem;
		%feature("autodoc", "	* Set destination coordinate system.

	:param theSysTo:
	:type theSysTo: gp_Ax3
	:rtype: None
") SetOutputCoordinateSystem;
		void SetOutputCoordinateSystem (const gp_Ax3 & theSysTo);
		%feature("compactdefaultargs") SetOutputCoordinateSystem;
		%feature("autodoc", "	* Set destination coordinate system.

	:param theSysTo:
	:type theSysTo: RWMesh_CoordinateSystem
	:rtype: None
") SetOutputCoordinateSystem;
		void SetOutputCoordinateSystem (RWMesh_CoordinateSystem theSysTo);
		%feature("compactdefaultargs") SetOutputLengthUnit;
		%feature("autodoc", "	* Set destination length units as scale factor to m (meters).

	:param theOutputScale:
	:type theOutputScale: float
	:rtype: None
") SetOutputLengthUnit;
		void SetOutputLengthUnit (Standard_Real theOutputScale);
		%feature("compactdefaultargs") StandardCoordinateSystem;
		%feature("autodoc", "	* Return a standard coordinate system definition.

	:param theSys:
	:type theSys: RWMesh_CoordinateSystem
	:rtype: gp_Ax3
") StandardCoordinateSystem;
		static gp_Ax3 StandardCoordinateSystem (RWMesh_CoordinateSystem theSys);
		%feature("compactdefaultargs") TransformNormal;
		%feature("autodoc", "	* Transform normal (e.g. exclude translation/scale part of transformation).

	:param theNorm:
	:type theNorm: Graphic3d_Vec3 &
	:rtype: None
") TransformNormal;
		void TransformNormal (Graphic3d_Vec3 & theNorm);
		%feature("compactdefaultargs") TransformPosition;
		%feature("autodoc", "	* Transform position.

	:param thePos:
	:type thePos: gp_XYZ
	:rtype: None
") TransformPosition;
		void TransformPosition (gp_XYZ & thePos);
		%feature("compactdefaultargs") TransformTransformation;
		%feature("autodoc", "	* Transform transformation.

	:param theTrsf:
	:type theTrsf: gp_Trsf
	:rtype: None
") TransformTransformation;
		void TransformTransformation (gp_Trsf & theTrsf);
};


%extend RWMesh_CoordinateSystemConverter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor RWMesh_NodeAttributes;
class RWMesh_NodeAttributes {
	public:
		TCollection_AsciiString Name;
		TCollection_AsciiString RawName;
		XCAFPrs_Style Style;
};


%extend RWMesh_NodeAttributes {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
/* harray2 class */
/* harray2 class */
