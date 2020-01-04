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
/* public enums */
enum VrmlAPI_RepresentationOfShape {
	VrmlAPI_ShadedRepresentation = 0,
	VrmlAPI_WireFrameRepresentation = 1,
	VrmlAPI_BothRepresentation = 2,
};

/* end public enums declaration */

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
		%feature("autodoc", "* With help of this class user can change parameters of writing. Converts the shape aShape to VRML format of the passed version and writes it to the file identified by aFileName using default parameters.
	:param aShape:
	:type aShape: TopoDS_Shape
	:param aFileName:
	:type aFileName: char *
	:param aVersion: default value is 2
	:type aVersion: int
	:rtype: bool") Write;
		static Standard_Boolean Write (const TopoDS_Shape & aShape,const char * aFileName,const Standard_Integer aVersion = 2);

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
		/****************** Drawer ******************/
		%feature("compactdefaultargs") Drawer;
		%feature("autodoc", "* Returns drawer object
	:rtype: opencascade::handle<VrmlConverter_Drawer>") Drawer;
		opencascade::handle<VrmlConverter_Drawer> Drawer ();

		/****************** GetFreeBoundsMaterial ******************/
		%feature("compactdefaultargs") GetFreeBoundsMaterial;
		%feature("autodoc", ":rtype: opencascade::handle<Vrml_Material>") GetFreeBoundsMaterial;
		opencascade::handle<Vrml_Material> GetFreeBoundsMaterial ();

		/****************** GetFrontMaterial ******************/
		%feature("compactdefaultargs") GetFrontMaterial;
		%feature("autodoc", ":rtype: opencascade::handle<Vrml_Material>") GetFrontMaterial;
		opencascade::handle<Vrml_Material> GetFrontMaterial ();

		/****************** GetLineMaterial ******************/
		%feature("compactdefaultargs") GetLineMaterial;
		%feature("autodoc", ":rtype: opencascade::handle<Vrml_Material>") GetLineMaterial;
		opencascade::handle<Vrml_Material> GetLineMaterial ();

		/****************** GetPointsMaterial ******************/
		%feature("compactdefaultargs") GetPointsMaterial;
		%feature("autodoc", ":rtype: opencascade::handle<Vrml_Material>") GetPointsMaterial;
		opencascade::handle<Vrml_Material> GetPointsMaterial ();

		/****************** GetRepresentation ******************/
		%feature("compactdefaultargs") GetRepresentation;
		%feature("autodoc", "* Returns the representation of the shape which is written to the VRML file. Types of representation are set through the VrmlAPI_RepresentationOfShape enumeration.
	:rtype: VrmlAPI_RepresentationOfShape") GetRepresentation;
		VrmlAPI_RepresentationOfShape GetRepresentation ();

		/****************** GetUisoMaterial ******************/
		%feature("compactdefaultargs") GetUisoMaterial;
		%feature("autodoc", ":rtype: opencascade::handle<Vrml_Material>") GetUisoMaterial;
		opencascade::handle<Vrml_Material> GetUisoMaterial ();

		/****************** GetUnfreeBoundsMaterial ******************/
		%feature("compactdefaultargs") GetUnfreeBoundsMaterial;
		%feature("autodoc", ":rtype: opencascade::handle<Vrml_Material>") GetUnfreeBoundsMaterial;
		opencascade::handle<Vrml_Material> GetUnfreeBoundsMaterial ();

		/****************** GetVisoMaterial ******************/
		%feature("compactdefaultargs") GetVisoMaterial;
		%feature("autodoc", ":rtype: opencascade::handle<Vrml_Material>") GetVisoMaterial;
		opencascade::handle<Vrml_Material> GetVisoMaterial ();

		/****************** GetWireMaterial ******************/
		%feature("compactdefaultargs") GetWireMaterial;
		%feature("autodoc", ":rtype: opencascade::handle<Vrml_Material>") GetWireMaterial;
		opencascade::handle<Vrml_Material> GetWireMaterial ();

		/****************** ResetToDefaults ******************/
		%feature("compactdefaultargs") ResetToDefaults;
		%feature("autodoc", "* Resets all parameters (representation, deflection) to their default values..
	:rtype: None") ResetToDefaults;
		void ResetToDefaults ();

		/****************** SetAmbientColorToMaterial ******************/
		%feature("compactdefaultargs") SetAmbientColorToMaterial;
		%feature("autodoc", ":param aMaterial:
	:type aMaterial: Vrml_Material
	:param Color:
	:type Color: Quantity_HArray1OfColor
	:rtype: None") SetAmbientColorToMaterial;
		void SetAmbientColorToMaterial (opencascade::handle<Vrml_Material> & aMaterial,const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****************** SetDeflection ******************/
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "* Sets the deflection aDef of the mesh algorithm which is used to compute the shaded representation of the translated shape. The default value is -1. When the deflection value is less than 0, the deflection is calculated from the relative size of the shaped.
	:param aDef:
	:type aDef: float
	:rtype: None") SetDeflection;
		void SetDeflection (const Standard_Real aDef);

		/****************** SetDiffuseColorToMaterial ******************/
		%feature("compactdefaultargs") SetDiffuseColorToMaterial;
		%feature("autodoc", ":param aMaterial:
	:type aMaterial: Vrml_Material
	:param Color:
	:type Color: Quantity_HArray1OfColor
	:rtype: None") SetDiffuseColorToMaterial;
		void SetDiffuseColorToMaterial (opencascade::handle<Vrml_Material> & aMaterial,const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****************** SetEmissiveColorToMaterial ******************/
		%feature("compactdefaultargs") SetEmissiveColorToMaterial;
		%feature("autodoc", ":param aMaterial:
	:type aMaterial: Vrml_Material
	:param Color:
	:type Color: Quantity_HArray1OfColor
	:rtype: None") SetEmissiveColorToMaterial;
		void SetEmissiveColorToMaterial (opencascade::handle<Vrml_Material> & aMaterial,const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****************** SetRepresentation ******************/
		%feature("compactdefaultargs") SetRepresentation;
		%feature("autodoc", "* Sets the representation of the shape aRep which is written to the VRML file. The three options are : - shaded - wireframe - both shaded and wireframe (default) defined through the VrmlAPI_RepresentationOfShape enumeration.
	:param aRep:
	:type aRep: VrmlAPI_RepresentationOfShape
	:rtype: None") SetRepresentation;
		void SetRepresentation (const VrmlAPI_RepresentationOfShape aRep);

		/****************** SetShininessToMaterial ******************/
		%feature("compactdefaultargs") SetShininessToMaterial;
		%feature("autodoc", ":param aMaterial:
	:type aMaterial: Vrml_Material
	:param aShininess:
	:type aShininess: float
	:rtype: None") SetShininessToMaterial;
		void SetShininessToMaterial (opencascade::handle<Vrml_Material> & aMaterial,const Standard_Real aShininess);

		/****************** SetSpecularColorToMaterial ******************/
		%feature("compactdefaultargs") SetSpecularColorToMaterial;
		%feature("autodoc", ":param aMaterial:
	:type aMaterial: Vrml_Material
	:param Color:
	:type Color: Quantity_HArray1OfColor
	:rtype: None") SetSpecularColorToMaterial;
		void SetSpecularColorToMaterial (opencascade::handle<Vrml_Material> & aMaterial,const opencascade::handle<Quantity_HArray1OfColor> & Color);

		/****************** SetTransparencyToMaterial ******************/
		%feature("compactdefaultargs") SetTransparencyToMaterial;
		%feature("autodoc", "* Set transparency to given material
	:param aMaterial:
	:type aMaterial: Vrml_Material
	:param aTransparency:
	:type aTransparency: float
	:rtype: None") SetTransparencyToMaterial;
		void SetTransparencyToMaterial (opencascade::handle<Vrml_Material> & aMaterial,const Standard_Real aTransparency);

		/****************** VrmlAPI_Writer ******************/
		%feature("compactdefaultargs") VrmlAPI_Writer;
		%feature("autodoc", "* Creates a writer object with default parameters.
	:rtype: None") VrmlAPI_Writer;
		 VrmlAPI_Writer ();

		/****************** Write ******************/
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "* Converts the shape aShape to VRML format of the passed version and writes it to the file identified by aFile.
	:param aShape:
	:type aShape: TopoDS_Shape
	:param aFile:
	:type aFile: char *
	:param aVersion: default value is 2
	:type aVersion: int
	:rtype: bool") Write;
		Standard_Boolean Write (const TopoDS_Shape & aShape,const char * aFile,const Standard_Integer aVersion = 2);

		/****************** WriteDoc ******************/
		%feature("compactdefaultargs") WriteDoc;
		%feature("autodoc", "* Converts the document to VRML format of the passed version and writes it to the file identified by aFile.
	:param theDoc:
	:type theDoc: TDocStd_Document
	:param theFile:
	:type theFile: char *
	:param theScale:
	:type theScale: float
	:rtype: bool") WriteDoc;
		Standard_Boolean WriteDoc (const opencascade::handle<TDocStd_Document> & theDoc,const char * theFile,const Standard_Real theScale);

};


%extend VrmlAPI_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
