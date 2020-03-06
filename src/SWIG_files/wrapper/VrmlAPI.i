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
%define VRMLAPIDOCSTRING
"VrmlAPI module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_vrmlapi.html"
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
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<VrmlAPI_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TopoDS_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TopoDS.i
%import VrmlConverter.i
%import Vrml.i
%import Quantity.i
%import TDocStd.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum VrmlAPI_RepresentationOfShape {
	VrmlAPI_ShadedRepresentation = 0,
	VrmlAPI_WireFrameRepresentation = 1,
	VrmlAPI_BothRepresentation = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class VrmlAPI_RepresentationOfShape:
	VrmlAPI_ShadedRepresentation = 0
	VrmlAPI_WireFrameRepresentation = 1
	VrmlAPI_BothRepresentation = 2
};
/* end python proxy for enums */

/* handles */
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
		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "With help of this class user can change parameters of writing. converts the shape ashape to vrml format of the passed version and writes it to the file identified by afilename using default parameters.

Parameters
----------
aShape: TopoDS_Shape
aFileName: char *
aVersion: int,optional
	default value is 2

Returns
-------
bool
") Write;
		static Standard_Boolean Write(const TopoDS_Shape & aShape, const char * aFileName, const Standard_Integer aVersion = 2);

};


%extend VrmlAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class VrmlAPI_Writer *
***********************/
class VrmlAPI_Writer {
	public:
		/****************** VrmlAPI_Writer ******************/
		%feature("compactdefaultargs") VrmlAPI_Writer;
		%feature("autodoc", "Creates a writer object with default parameters.

Returns
-------
None
") VrmlAPI_Writer;
		 VrmlAPI_Writer();

		/****************** Drawer ******************/
		%feature("compactdefaultargs") Drawer;
		%feature("autodoc", "Returns drawer object.

Returns
-------
opencascade::handle<VrmlConverter_Drawer>
") Drawer;
		opencascade::handle<VrmlConverter_Drawer> Drawer();

		/****************** GetFreeBoundsMaterial ******************/
		%feature("compactdefaultargs") GetFreeBoundsMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") GetFreeBoundsMaterial;
		opencascade::handle<Vrml_Material> GetFreeBoundsMaterial();

		/****************** GetFrontMaterial ******************/
		%feature("compactdefaultargs") GetFrontMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") GetFrontMaterial;
		opencascade::handle<Vrml_Material> GetFrontMaterial();

		/****************** GetLineMaterial ******************/
		%feature("compactdefaultargs") GetLineMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") GetLineMaterial;
		opencascade::handle<Vrml_Material> GetLineMaterial();

		/****************** GetPointsMaterial ******************/
		%feature("compactdefaultargs") GetPointsMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") GetPointsMaterial;
		opencascade::handle<Vrml_Material> GetPointsMaterial();

		/****************** GetRepresentation ******************/
		%feature("compactdefaultargs") GetRepresentation;
		%feature("autodoc", "Returns the representation of the shape which is written to the vrml file. types of representation are set through the vrmlapi_representationofshape enumeration.

Returns
-------
VrmlAPI_RepresentationOfShape
") GetRepresentation;
		VrmlAPI_RepresentationOfShape GetRepresentation();

		/****************** GetUisoMaterial ******************/
		%feature("compactdefaultargs") GetUisoMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") GetUisoMaterial;
		opencascade::handle<Vrml_Material> GetUisoMaterial();

		/****************** GetUnfreeBoundsMaterial ******************/
		%feature("compactdefaultargs") GetUnfreeBoundsMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") GetUnfreeBoundsMaterial;
		opencascade::handle<Vrml_Material> GetUnfreeBoundsMaterial();

		/****************** GetVisoMaterial ******************/
		%feature("compactdefaultargs") GetVisoMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") GetVisoMaterial;
		opencascade::handle<Vrml_Material> GetVisoMaterial();

		/****************** GetWireMaterial ******************/
		%feature("compactdefaultargs") GetWireMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") GetWireMaterial;
		opencascade::handle<Vrml_Material> GetWireMaterial();

		/****************** ResetToDefaults ******************/
		%feature("compactdefaultargs") ResetToDefaults;
		%feature("autodoc", "Resets all parameters (representation, deflection) to their default values..

Returns
-------
None
") ResetToDefaults;
		void ResetToDefaults();

		/****************** SetAmbientColorToMaterial ******************/
		%feature("compactdefaultargs") SetAmbientColorToMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material
Color: Quantity_HArray1OfColor

Returns
-------
None
") SetAmbientColorToMaterial;
		void SetAmbientColorToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****************** SetDeflection ******************/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "Sets the deflection adef of the mesh algorithm which is used to compute the shaded representation of the translated shape. the default value is -1. when the deflection value is less than 0, the deflection is calculated from the relative size of the shaped.

Parameters
----------
aDef: float

Returns
-------
None
") SetDeflection;
		void SetDeflection(const Standard_Real aDef);

		/****************** SetDiffuseColorToMaterial ******************/
		%feature("compactdefaultargs") SetDiffuseColorToMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material
Color: Quantity_HArray1OfColor

Returns
-------
None
") SetDiffuseColorToMaterial;
		void SetDiffuseColorToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****************** SetEmissiveColorToMaterial ******************/
		%feature("compactdefaultargs") SetEmissiveColorToMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material
Color: Quantity_HArray1OfColor

Returns
-------
None
") SetEmissiveColorToMaterial;
		void SetEmissiveColorToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****************** SetRepresentation ******************/
		%feature("compactdefaultargs") SetRepresentation;
		%feature("autodoc", "Sets the representation of the shape arep which is written to the vrml file. the three options are : - shaded - wireframe - both shaded and wireframe (default) defined through the vrmlapi_representationofshape enumeration.

Parameters
----------
aRep: VrmlAPI_RepresentationOfShape

Returns
-------
None
") SetRepresentation;
		void SetRepresentation(const VrmlAPI_RepresentationOfShape aRep);

		/****************** SetShininessToMaterial ******************/
		%feature("compactdefaultargs") SetShininessToMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material
aShininess: float

Returns
-------
None
") SetShininessToMaterial;
		void SetShininessToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const Standard_Real aShininess);

		/****************** SetSpecularColorToMaterial ******************/
		%feature("compactdefaultargs") SetSpecularColorToMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material
Color: Quantity_HArray1OfColor

Returns
-------
None
") SetSpecularColorToMaterial;
		void SetSpecularColorToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****************** SetTransparencyToMaterial ******************/
		%feature("compactdefaultargs") SetTransparencyToMaterial;
		%feature("autodoc", "Set transparency to given material.

Parameters
----------
aMaterial: Vrml_Material
aTransparency: float

Returns
-------
None
") SetTransparencyToMaterial;
		void SetTransparencyToMaterial(opencascade::handle<Vrml_Material> & aMaterial, const Standard_Real aTransparency);

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "Converts the shape ashape to vrml format of the passed version and writes it to the file identified by afile.

Parameters
----------
aShape: TopoDS_Shape
aFile: char *
aVersion: int,optional
	default value is 2

Returns
-------
bool
") Write;
		Standard_Boolean Write(const TopoDS_Shape & aShape, const char * aFile, const Standard_Integer aVersion = 2);

		/****************** WriteDoc ******************/
		%feature("compactdefaultargs") WriteDoc;
		%feature("autodoc", "Converts the document to vrml format of the passed version and writes it to the file identified by afile.

Parameters
----------
theDoc: TDocStd_Document
theFile: char *
theScale: float

Returns
-------
bool
") WriteDoc;
		Standard_Boolean WriteDoc(const opencascade::handle<TDocStd_Document> & theDoc, const char * theFile, const Standard_Real theScale);

};


%extend VrmlAPI_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
