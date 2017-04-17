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
%module (package="OCC") VrmlAPI

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


%include VrmlAPI_headers.i


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
enum VrmlAPI_RepresentationOfShape {
	VrmlAPI_ShadedRepresentation = 0,
	VrmlAPI_WireFrameRepresentation = 1,
	VrmlAPI_BothRepresentation = 2,
};

/* end public enums declaration */

%rename(vrmlapi) VrmlAPI;
class VrmlAPI {
	public:
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* With help of this class user can change parameters of writing. Converts the shape aShape to VRML format of the passed version and writes it to the file identified by aFileName using default parameters.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aFileName:
	:type aFileName: char *
	:param aVersion: default value is 2
	:type aVersion: int
	:rtype: void
") Write;
		static void Write (const TopoDS_Shape & aShape,const char * aFileName,const Standard_Integer aVersion = 2);
};


%extend VrmlAPI {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlAPI_Writer;
class VrmlAPI_Writer {
	public:
		%feature("compactdefaultargs") VrmlAPI_Writer;
		%feature("autodoc", "	* Creates a writer object with default parameters.

	:rtype: None
") VrmlAPI_Writer;
		 VrmlAPI_Writer ();
		%feature("compactdefaultargs") ResetToDefaults;
		%feature("autodoc", "	* Resets all parameters (representation, deflection) to their default values..

	:rtype: None
") ResetToDefaults;
		void ResetToDefaults ();
		%feature("compactdefaultargs") Drawer;
		%feature("autodoc", "	* Returns drawer object

	:rtype: Handle_VrmlConverter_Drawer
") Drawer;
		Handle_VrmlConverter_Drawer Drawer ();
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "	* Sets the deflection aDef of the mesh algorithm which is used to compute the shaded representation of the translated shape. The default value is -1. When the deflection value is less than 0, the deflection is calculated from the relative size of the shaped.

	:param aDef:
	:type aDef: float
	:rtype: None
") SetDeflection;
		void SetDeflection (const Standard_Real aDef);
		%feature("compactdefaultargs") SetRepresentation;
		%feature("autodoc", "	* Sets the representation of the shape aRep which is written to the VRML file. The three options are : - shaded - wireframe - both shaded and wireframe (default) defined through the VrmlAPI_RepresentationOfShape enumeration.

	:param aRep:
	:type aRep: VrmlAPI_RepresentationOfShape
	:rtype: None
") SetRepresentation;
		void SetRepresentation (const VrmlAPI_RepresentationOfShape aRep);
		%feature("compactdefaultargs") SetTransparencyToMaterial;
		%feature("autodoc", "	* Set transparency to given material

	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:param aTransparency:
	:type aTransparency: float
	:rtype: None
") SetTransparencyToMaterial;
		void SetTransparencyToMaterial (Handle_Vrml_Material & aMaterial,const Standard_Real aTransparency);
		%feature("compactdefaultargs") SetShininessToMaterial;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:param aShininess:
	:type aShininess: float
	:rtype: None
") SetShininessToMaterial;
		void SetShininessToMaterial (Handle_Vrml_Material & aMaterial,const Standard_Real aShininess);
		%feature("compactdefaultargs") SetAmbientColorToMaterial;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:param Color:
	:type Color: Handle_Quantity_HArray1OfColor &
	:rtype: None
") SetAmbientColorToMaterial;
		void SetAmbientColorToMaterial (Handle_Vrml_Material & aMaterial,const Handle_Quantity_HArray1OfColor & Color);
		%feature("compactdefaultargs") SetDiffuseColorToMaterial;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:param Color:
	:type Color: Handle_Quantity_HArray1OfColor &
	:rtype: None
") SetDiffuseColorToMaterial;
		void SetDiffuseColorToMaterial (Handle_Vrml_Material & aMaterial,const Handle_Quantity_HArray1OfColor & Color);
		%feature("compactdefaultargs") SetSpecularColorToMaterial;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:param Color:
	:type Color: Handle_Quantity_HArray1OfColor &
	:rtype: None
") SetSpecularColorToMaterial;
		void SetSpecularColorToMaterial (Handle_Vrml_Material & aMaterial,const Handle_Quantity_HArray1OfColor & Color);
		%feature("compactdefaultargs") SetEmissiveColorToMaterial;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:param Color:
	:type Color: Handle_Quantity_HArray1OfColor &
	:rtype: None
") SetEmissiveColorToMaterial;
		void SetEmissiveColorToMaterial (Handle_Vrml_Material & aMaterial,const Handle_Quantity_HArray1OfColor & Color);
		%feature("compactdefaultargs") GetRepresentation;
		%feature("autodoc", "	* Returns the representation of the shape which is written to the VRML file. Types of representation are set through the VrmlAPI_RepresentationOfShape enumeration.

	:rtype: VrmlAPI_RepresentationOfShape
") GetRepresentation;
		VrmlAPI_RepresentationOfShape GetRepresentation ();
		%feature("compactdefaultargs") GetFrontMaterial;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") GetFrontMaterial;
		Handle_Vrml_Material GetFrontMaterial ();
		%feature("compactdefaultargs") GetPointsMaterial;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") GetPointsMaterial;
		Handle_Vrml_Material GetPointsMaterial ();
		%feature("compactdefaultargs") GetUisoMaterial;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") GetUisoMaterial;
		Handle_Vrml_Material GetUisoMaterial ();
		%feature("compactdefaultargs") GetVisoMaterial;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") GetVisoMaterial;
		Handle_Vrml_Material GetVisoMaterial ();
		%feature("compactdefaultargs") GetLineMaterial;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") GetLineMaterial;
		Handle_Vrml_Material GetLineMaterial ();
		%feature("compactdefaultargs") GetWireMaterial;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") GetWireMaterial;
		Handle_Vrml_Material GetWireMaterial ();
		%feature("compactdefaultargs") GetFreeBoundsMaterial;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") GetFreeBoundsMaterial;
		Handle_Vrml_Material GetFreeBoundsMaterial ();
		%feature("compactdefaultargs") GetUnfreeBoundsMaterial;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") GetUnfreeBoundsMaterial;
		Handle_Vrml_Material GetUnfreeBoundsMaterial ();
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Converts the shape aShape to VRML format of the passed version and writes it to the file identified by aFile.

	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aFile:
	:type aFile: char *
	:param aVersion: default value is 2
	:type aVersion: int
	:rtype: None
") Write;
		void Write (const TopoDS_Shape & aShape,const char * aFile,const Standard_Integer aVersion = 2);
};


%extend VrmlAPI_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
