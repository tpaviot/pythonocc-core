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
%define VRMLAPIDOCSTRING
"VrmlAPI module, see official documentation at
https://dev.opencascade.org/doc/occt-7.8.0/refman/html/package_vrmlapi.html"
%enddef
%module (package="OCC.Core", docstring=VRMLAPIDOCSTRING) VrmlAPI


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
#include<VrmlAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
#include<RWMesh_module.hxx>
#include<VrmlConverter_module.hxx>
#include<Vrml_module.hxx>
#include<Quantity_module.hxx>
#include<TDocStd_module.hxx>
#include<Message_module.hxx>
#include<Geom_module.hxx>
#include<GeomAdaptor_module.hxx>
#include<TShort_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom2dAdaptor_module.hxx>
#include<TopLoc_module.hxx>
#include<HLRAlgo_module.hxx>
#include<BRepAdaptor_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TopTools_module.hxx>
#include<Poly_module.hxx>
#include<Aspect_module.hxx>
#include<CDF_module.hxx>
#include<TDF_module.hxx>
#include<PCDM_module.hxx>
#include<Bnd_module.hxx>
#include<Graphic3d_module.hxx>
#include<Media_module.hxx>
#include<IFSelect_module.hxx>
#include<TopTools_module.hxx>
#include<MoniTool_module.hxx>
#include<Transfer_module.hxx>
#include<Interface_module.hxx>
#include<TPrsStd_module.hxx>
#include<SelectMgr_module.hxx>
#include<Select3D_module.hxx>
#include<AIS_module.hxx>
#include<XCAFPrs_module.hxx>
#include<Prs3d_module.hxx>
#include<XSControl_module.hxx>
#include<TDataStd_module.hxx>
#include<XCAFDoc_module.hxx>
#include<StdSelect_module.hxx>
#include<V3d_module.hxx>
#include<TNaming_module.hxx>
#include<TDataXtd_module.hxx>
#include<DE_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import RWMesh.i
%import VrmlConverter.i
%import Vrml.i
%import Quantity.i
%import TDocStd.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum VrmlAPI_RepresentationOfShape {
	VrmlAPI_ShadedRepresentation = 0,
	VrmlAPI_WireFrameRepresentation = 1,
	VrmlAPI_BothRepresentation = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class VrmlAPI_RepresentationOfShape(IntEnum):
	VrmlAPI_ShadedRepresentation = 0
	VrmlAPI_WireFrameRepresentation = 1
	VrmlAPI_BothRepresentation = 2
VrmlAPI_ShadedRepresentation = VrmlAPI_RepresentationOfShape.VrmlAPI_ShadedRepresentation
VrmlAPI_WireFrameRepresentation = VrmlAPI_RepresentationOfShape.VrmlAPI_WireFrameRepresentation
VrmlAPI_BothRepresentation = VrmlAPI_RepresentationOfShape.VrmlAPI_BothRepresentation
};
/* end python proxy for enums */

/* handles */
%wrap_handle(VrmlAPI_CafReader)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************
* class VrmlAPI *
****************/
%rename(vrmlapi) VrmlAPI;
class VrmlAPI {
	public:
		/****** VrmlAPI::Write ******/
		/****** md5 signature: eadf93f5a80979126b45a40f5dc9c966 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aFileName: str
aVersion: int (optional, default to 2)

Return
-------
bool

Description
-----------
With help of this class user can change parameters of writing. Converts the shape aShape to VRML format of the passed version and writes it to the file identified by aFileName using default parameters.
") Write;
		static Standard_Boolean Write(const TopoDS_Shape & aShape, Standard_CString aFileName, const Standard_Integer aVersion = 2);

};


%extend VrmlAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class VrmlAPI_CafReader *
**************************/
class VrmlAPI_CafReader : public RWMesh_CafReader {
	public:
};


%make_alias(VrmlAPI_CafReader)

%extend VrmlAPI_CafReader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class VrmlAPI_Writer *
***********************/
class VrmlAPI_Writer {
	public:
		/****** VrmlAPI_Writer::VrmlAPI_Writer ******/
		/****** md5 signature: 5eaf9bcd9756148b60fcb8334055ebfa ******/
		%feature("compactdefaultargs") VrmlAPI_Writer;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates a writer object with default parameters.
") VrmlAPI_Writer;
		 VrmlAPI_Writer();

		/****** VrmlAPI_Writer::Drawer ******/
		/****** md5 signature: 2efaaaeee5ddb6cd7ee59bcf60a558c1 ******/
		%feature("compactdefaultargs") Drawer;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_Drawer>

Description
-----------
Returns drawer object.
") Drawer;
		opencascade::handle<VrmlConverter_Drawer> Drawer();

		/****** VrmlAPI_Writer::GetFreeBoundsMaterial ******/
		/****** md5 signature: fe4c1151101cc344b252a5d73cd68d3b ******/
		%feature("compactdefaultargs") GetFreeBoundsMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") GetFreeBoundsMaterial;
		opencascade::handle<Vrml_Material> GetFreeBoundsMaterial();

		/****** VrmlAPI_Writer::GetFrontMaterial ******/
		/****** md5 signature: 23f82f7b0d60edd57a13f31bc1287eff ******/
		%feature("compactdefaultargs") GetFrontMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") GetFrontMaterial;
		opencascade::handle<Vrml_Material> GetFrontMaterial();

		/****** VrmlAPI_Writer::GetLineMaterial ******/
		/****** md5 signature: 73b4703624f0cdbc3650507273196d50 ******/
		%feature("compactdefaultargs") GetLineMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") GetLineMaterial;
		opencascade::handle<Vrml_Material> GetLineMaterial();

		/****** VrmlAPI_Writer::GetPointsMaterial ******/
		/****** md5 signature: 65596f0649f84f113f36c51fe2680899 ******/
		%feature("compactdefaultargs") GetPointsMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") GetPointsMaterial;
		opencascade::handle<Vrml_Material> GetPointsMaterial();

		/****** VrmlAPI_Writer::GetRepresentation ******/
		/****** md5 signature: e9c1ddb4c7b3b4716910fa39c202c359 ******/
		%feature("compactdefaultargs") GetRepresentation;
		%feature("autodoc", "Return
-------
VrmlAPI_RepresentationOfShape

Description
-----------
Returns the representation of the shape which is written to the VRML file. Types of representation are set through the VrmlAPI_RepresentationOfShape enumeration.
") GetRepresentation;
		VrmlAPI_RepresentationOfShape GetRepresentation();

		/****** VrmlAPI_Writer::GetUisoMaterial ******/
		/****** md5 signature: 776cfb5f2e82e8648181bdaea3cd6449 ******/
		%feature("compactdefaultargs") GetUisoMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") GetUisoMaterial;
		opencascade::handle<Vrml_Material> GetUisoMaterial();

		/****** VrmlAPI_Writer::GetUnfreeBoundsMaterial ******/
		/****** md5 signature: 5eced13a0c7ac60253e78dd919d957e7 ******/
		%feature("compactdefaultargs") GetUnfreeBoundsMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") GetUnfreeBoundsMaterial;
		opencascade::handle<Vrml_Material> GetUnfreeBoundsMaterial();

		/****** VrmlAPI_Writer::GetVisoMaterial ******/
		/****** md5 signature: f1f4363a269bce56ee0aea83a1966dfa ******/
		%feature("compactdefaultargs") GetVisoMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") GetVisoMaterial;
		opencascade::handle<Vrml_Material> GetVisoMaterial();

		/****** VrmlAPI_Writer::GetWireMaterial ******/
		/****** md5 signature: 59d162a02218be7e6b150b536beac723 ******/
		%feature("compactdefaultargs") GetWireMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") GetWireMaterial;
		opencascade::handle<Vrml_Material> GetWireMaterial();

		/****** VrmlAPI_Writer::ResetToDefaults ******/
		/****** md5 signature: 67891028b88b004fc4406bb67359856a ******/
		%feature("compactdefaultargs") ResetToDefaults;
		%feature("autodoc", "Return
-------
None

Description
-----------
Resets all parameters (representation, deflection) to their default values..
") ResetToDefaults;
		void ResetToDefaults();

		/****** VrmlAPI_Writer::SetAmbientColorToMaterial ******/
		/****** md5 signature: ff58bc5173015f1d152e07a1fce01896 ******/
		%feature("compactdefaultargs") SetAmbientColorToMaterial;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material
Color: Quantity_HArray1OfColor

Return
-------
None

Description
-----------
No available documentation.
") SetAmbientColorToMaterial;
		void SetAmbientColorToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****** VrmlAPI_Writer::SetDeflection ******/
		/****** md5 signature: 66f0952d6a5fb24175d4c477b25a2145 ******/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "
Parameters
----------
aDef: float

Return
-------
None

Description
-----------
Sets the deflection aDef of the mesh algorithm which is used to compute the shaded representation of the translated shape. The default value is -1. When the deflection value is less than 0, the deflection is calculated from the relative size of the shaped.
") SetDeflection;
		void SetDeflection(const Standard_Real aDef);

		/****** VrmlAPI_Writer::SetDiffuseColorToMaterial ******/
		/****** md5 signature: c4180794403474cbd61cc41108eaa759 ******/
		%feature("compactdefaultargs") SetDiffuseColorToMaterial;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material
Color: Quantity_HArray1OfColor

Return
-------
None

Description
-----------
No available documentation.
") SetDiffuseColorToMaterial;
		void SetDiffuseColorToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****** VrmlAPI_Writer::SetEmissiveColorToMaterial ******/
		/****** md5 signature: d14ea7513242ae41b196539a22ad2104 ******/
		%feature("compactdefaultargs") SetEmissiveColorToMaterial;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material
Color: Quantity_HArray1OfColor

Return
-------
None

Description
-----------
No available documentation.
") SetEmissiveColorToMaterial;
		void SetEmissiveColorToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****** VrmlAPI_Writer::SetRepresentation ******/
		/****** md5 signature: 0369655e9fa20e8a3bf3d2fc75c6f6c5 ******/
		%feature("compactdefaultargs") SetRepresentation;
		%feature("autodoc", "
Parameters
----------
aRep: VrmlAPI_RepresentationOfShape

Return
-------
None

Description
-----------
Sets the representation of the shape aRep which is written to the VRML file. The three options are: - shaded - wireframe - both shaded and wireframe (default) defined through the VrmlAPI_RepresentationOfShape enumeration.
") SetRepresentation;
		void SetRepresentation(const VrmlAPI_RepresentationOfShape aRep);

		/****** VrmlAPI_Writer::SetShininessToMaterial ******/
		/****** md5 signature: 21587669ae68343630ae9c1178e09a99 ******/
		%feature("compactdefaultargs") SetShininessToMaterial;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material
aShininess: float

Return
-------
None

Description
-----------
No available documentation.
") SetShininessToMaterial;
		void SetShininessToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const Standard_Real aShininess);

		/****** VrmlAPI_Writer::SetSpecularColorToMaterial ******/
		/****** md5 signature: d95b9c8c286dfb0cba79da45d846ef18 ******/
		%feature("compactdefaultargs") SetSpecularColorToMaterial;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material
Color: Quantity_HArray1OfColor

Return
-------
None

Description
-----------
No available documentation.
") SetSpecularColorToMaterial;
		void SetSpecularColorToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****** VrmlAPI_Writer::SetTransparencyToMaterial ******/
		/****** md5 signature: 4feb0931bc6ea687fcd929caed5868f2 ******/
		%feature("compactdefaultargs") SetTransparencyToMaterial;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material
aTransparency: float

Return
-------
None

Description
-----------
Set transparency to given material.
") SetTransparencyToMaterial;
		void SetTransparencyToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const Standard_Real aTransparency);

		/****** VrmlAPI_Writer::Write ******/
		/****** md5 signature: badea54785d979ffd7adddf30e53d573 ******/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aFile: str
aVersion: int (optional, default to 2)

Return
-------
bool

Description
-----------
Converts the shape aShape to VRML format of the passed version and writes it to the file identified by aFile.
") Write;
		Standard_Boolean Write(const TopoDS_Shape & aShape, Standard_CString aFile, const Standard_Integer aVersion = 2);

		/****** VrmlAPI_Writer::WriteDoc ******/
		/****** md5 signature: 293e597b30a83ac910add0bca5222bf1 ******/
		%feature("compactdefaultargs") WriteDoc;
		%feature("autodoc", "
Parameters
----------
theDoc: TDocStd_Document
theFile: str
theScale: float

Return
-------
bool

Description
-----------
Converts the document to VRML format of the passed version and writes it to the file identified by aFile.
") WriteDoc;
		Standard_Boolean WriteDoc(const opencascade::handle<TDocStd_Document> & theDoc, Standard_CString theFile, const Standard_Real theScale);

};


%extend VrmlAPI_Writer {
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
def vrmlapi_Write(*args):
	return vrmlapi.Write(*args)

}
