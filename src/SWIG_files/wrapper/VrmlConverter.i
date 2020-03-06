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
%define VRMLCONVERTERDOCSTRING
"VrmlConverter module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_vrmlconverter.html"
%enddef
%module (package="OCC.Core", docstring=VRMLCONVERTERDOCSTRING) VrmlConverter


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
#include<VrmlConverter_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<TColStd_module.hxx>
#include<Aspect_module.hxx>
#include<TopoDS_module.hxx>
#include<Vrml_module.hxx>
#include<TopTools_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Poly_module.hxx>
#include<TColgp_module.hxx>
#include<BRepAdaptor_module.hxx>
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
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import TColStd.i
%import Aspect.i
%import TopoDS.i
%import Vrml.i
%import TopTools.i
%import HLRAlgo.i
%import Poly.i
%import TColgp.i
%import BRepAdaptor.i

%pythoncode {
from OCC.Core.Exception import *
};

/* public enums */
enum VrmlConverter_TypeOfLight {
	VrmlConverter_NoLight = 0,
	VrmlConverter_DirectionLight = 1,
	VrmlConverter_PointLight = 2,
	VrmlConverter_SpotLight = 3,
};

enum VrmlConverter_TypeOfCamera {
	VrmlConverter_NoCamera = 0,
	VrmlConverter_PerspectiveCamera = 1,
	VrmlConverter_OrthographicCamera = 2,
};

/* end public enums declaration */

/* python proy classes for enums */
%pythoncode {

class VrmlConverter_TypeOfLight:
	VrmlConverter_NoLight = 0
	VrmlConverter_DirectionLight = 1
	VrmlConverter_PointLight = 2
	VrmlConverter_SpotLight = 3

class VrmlConverter_TypeOfCamera:
	VrmlConverter_NoCamera = 0
	VrmlConverter_PerspectiveCamera = 1
	VrmlConverter_OrthographicCamera = 2
};
/* end python proxy for enums */

/* handles */
%wrap_handle(VrmlConverter_Drawer)
%wrap_handle(VrmlConverter_LineAspect)
%wrap_handle(VrmlConverter_PointAspect)
%wrap_handle(VrmlConverter_Projector)
%wrap_handle(VrmlConverter_ShadingAspect)
%wrap_handle(VrmlConverter_IsoAspect)
/* end handles declaration */

/* templates */
/* end templates declaration */

/* typedefs */
/* end typedefs declaration */

/****************************
* class VrmlConverter_Curve *
****************************/
class VrmlConverter_Curve {
	public:
};


%extend VrmlConverter_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************************
* class VrmlConverter_DeflectionCurve *
**************************************/
class VrmlConverter_DeflectionCurve {
	public:
};


%extend VrmlConverter_DeflectionCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class VrmlConverter_Drawer *
*****************************/
class VrmlConverter_Drawer : public Standard_Transient {
	public:
		/****************** VrmlConverter_Drawer ******************/
		%feature("compactdefaultargs") VrmlConverter_Drawer;
		%feature("autodoc", "No available documentation.

Returns
-------
None
") VrmlConverter_Drawer;
		 VrmlConverter_Drawer();

		/****************** DeviationCoefficient ******************/
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") DeviationCoefficient;
		Standard_Real DeviationCoefficient();

		/****************** DisableDrawHiddenLine ******************/
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "Sets drawhiddenline = standard_false - the hidden lines are not drawn.

Returns
-------
None
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine();

		/****************** Discretisation ******************/
		%feature("compactdefaultargs") Discretisation;
		%feature("autodoc", "No available documentation.

Returns
-------
int
") Discretisation;
		Standard_Integer Discretisation();

		/****************** DrawHiddenLine ******************/
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "Returns standard_true if the hidden lines are to be drawn. by default the hidden lines are not drawn.

Returns
-------
bool
") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine();

		/****************** EnableDrawHiddenLine ******************/
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "Sets drawhiddenline = standard_true - the hidden lines are drawn.

Returns
-------
None
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine();

		/****************** FreeBoundaryAspect ******************/
		%feature("compactdefaultargs") FreeBoundaryAspect;
		%feature("autodoc", "The default values are the same default values from vrml package. these attributes are used by the following algorithms: vrmlconverter_wfshape vrmlconverter_wfdeflectionshape.

Returns
-------
opencascade::handle<VrmlConverter_LineAspect>
") FreeBoundaryAspect;
		opencascade::handle<VrmlConverter_LineAspect> FreeBoundaryAspect();

		/****************** FreeBoundaryDraw ******************/
		%feature("compactdefaultargs") FreeBoundaryDraw;
		%feature("autodoc", "Returns true if the drawing of the free boundaries is enabled.

Returns
-------
bool
") FreeBoundaryDraw;
		Standard_Boolean FreeBoundaryDraw();

		/****************** HiddenLineAspect ******************/
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "Returns lineaspect for the hidden lines. the default values are the same default values from vrml package.

Returns
-------
opencascade::handle<VrmlConverter_LineAspect>
") HiddenLineAspect;
		opencascade::handle<VrmlConverter_LineAspect> HiddenLineAspect();

		/****************** IsoOnPlane ******************/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "Returns true if the drawing of isos on planes is enabled.

Returns
-------
bool
") IsoOnPlane;
		Standard_Boolean IsoOnPlane();

		/****************** LineAspect ******************/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "The default values are the same default values from vrml package.

Returns
-------
opencascade::handle<VrmlConverter_LineAspect>
") LineAspect;
		opencascade::handle<VrmlConverter_LineAspect> LineAspect();

		/****************** MaximalChordialDeviation ******************/
		%feature("compactdefaultargs") MaximalChordialDeviation;
		%feature("autodoc", "Returns the maximal chordial deviation. default value: 0.1.

Returns
-------
float
") MaximalChordialDeviation;
		Standard_Real MaximalChordialDeviation();

		/****************** MaximalParameterValue ******************/
		%feature("compactdefaultargs") MaximalParameterValue;
		%feature("autodoc", "No available documentation.

Returns
-------
float
") MaximalParameterValue;
		Standard_Real MaximalParameterValue();

		/****************** PointAspect ******************/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<VrmlConverter_PointAspect>
") PointAspect;
		opencascade::handle<VrmlConverter_PointAspect> PointAspect();

		/****************** SeenLineAspect ******************/
		%feature("compactdefaultargs") SeenLineAspect;
		%feature("autodoc", "Returns lineaspect for the seen lines. the default values are the same default values from vrml package.

Returns
-------
opencascade::handle<VrmlConverter_LineAspect>
") SeenLineAspect;
		opencascade::handle<VrmlConverter_LineAspect> SeenLineAspect();

		/****************** SetDeviationCoefficient ******************/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "Default 0.001.

Parameters
----------
aCoefficient: float

Returns
-------
None
") SetDeviationCoefficient;
		void SetDeviationCoefficient(const Standard_Real aCoefficient);

		/****************** SetDiscretisation ******************/
		%feature("compactdefaultargs") SetDiscretisation;
		%feature("autodoc", "Default: 17 points. defines the discretisation (mynbpoints) when drawing any curve; if this value is one of the obvious parameters of methods, current value from drawer won't be used. this value is used by: //! vrmlconverter_curve vrmlconverter_wfrestrictedface vrmlconverter_wfshape.

Parameters
----------
d: int

Returns
-------
None
") SetDiscretisation;
		void SetDiscretisation(const Standard_Integer d);

		/****************** SetFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") SetFreeBoundaryAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAspect: VrmlConverter_LineAspect

Returns
-------
None
") SetFreeBoundaryAspect;
		void SetFreeBoundaryAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****************** SetFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") SetFreeBoundaryDraw;
		%feature("autodoc", "Enables the drawing the free boundaries by default the free boundaries are drawn.

Parameters
----------
OnOff: bool

Returns
-------
None
") SetFreeBoundaryDraw;
		void SetFreeBoundaryDraw(const Standard_Boolean OnOff);

		/****************** SetHiddenLineAspect ******************/
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "Sets lineaspect for the hidden lines.

Parameters
----------
anAspect: VrmlConverter_LineAspect

Returns
-------
None
") SetHiddenLineAspect;
		void SetHiddenLineAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****************** SetIsoOnPlane ******************/
		%feature("compactdefaultargs") SetIsoOnPlane;
		%feature("autodoc", "Enables the drawing of isos on planes. by default there are no isos on planes.

Parameters
----------
OnOff: bool

Returns
-------
None
") SetIsoOnPlane;
		void SetIsoOnPlane(const Standard_Boolean OnOff);

		/****************** SetLineAspect ******************/
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAspect: VrmlConverter_LineAspect

Returns
-------
None
") SetLineAspect;
		void SetLineAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****************** SetMaximalChordialDeviation ******************/
		%feature("compactdefaultargs") SetMaximalChordialDeviation;
		%feature("autodoc", "Defines the maximal chordial deviation when drawing any curve; if this value is one of the obvious parameters of methods, current value from drawer won't be used. this value is used by: //! vrmlconverter_deflectioncurve vrmlconverter_wfdeflectionrestrictedface vrmlconverter_wfdeflectionshape.

Parameters
----------
aChordialDeviation: float

Returns
-------
None
") SetMaximalChordialDeviation;
		void SetMaximalChordialDeviation(const Standard_Real aChordialDeviation);

		/****************** SetMaximalParameterValue ******************/
		%feature("compactdefaultargs") SetMaximalParameterValue;
		%feature("autodoc", "Defines the maximum value allowed for the first and last parameters of an infinite curve. default value: 500. vrmlconverter_curve vrmlconverter_wfrestrictedface vrmlconverter_wfshape.

Parameters
----------
Value: float

Returns
-------
None
") SetMaximalParameterValue;
		void SetMaximalParameterValue(const Standard_Real Value);

		/****************** SetPointAspect ******************/
		%feature("compactdefaultargs") SetPointAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAspect: VrmlConverter_PointAspect

Returns
-------
None
") SetPointAspect;
		void SetPointAspect(const opencascade::handle<VrmlConverter_PointAspect> & anAspect);

		/****************** SetSeenLineAspect ******************/
		%feature("compactdefaultargs") SetSeenLineAspect;
		%feature("autodoc", "Sets lineaspect for the seen lines.

Parameters
----------
anAspect: VrmlConverter_LineAspect

Returns
-------
None
") SetSeenLineAspect;
		void SetSeenLineAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****************** SetShadingAspect ******************/
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAspect: VrmlConverter_ShadingAspect

Returns
-------
None
") SetShadingAspect;
		void SetShadingAspect(const opencascade::handle<VrmlConverter_ShadingAspect> & anAspect);

		/****************** SetTypeOfDeflection ******************/
		%feature("compactdefaultargs") SetTypeOfDeflection;
		%feature("autodoc", "By default: tod_relative; however, except for the shapes, the drawing will be made using the absolute deviation.

Parameters
----------
aTypeOfDeflection: Aspect_TypeOfDeflection

Returns
-------
None
") SetTypeOfDeflection;
		void SetTypeOfDeflection(const Aspect_TypeOfDeflection aTypeOfDeflection);

		/****************** SetUIsoAspect ******************/
		%feature("compactdefaultargs") SetUIsoAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAspect: VrmlConverter_IsoAspect

Returns
-------
None
") SetUIsoAspect;
		void SetUIsoAspect(const opencascade::handle<VrmlConverter_IsoAspect> & anAspect);

		/****************** SetUnFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") SetUnFreeBoundaryAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAspect: VrmlConverter_LineAspect

Returns
-------
None
") SetUnFreeBoundaryAspect;
		void SetUnFreeBoundaryAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****************** SetUnFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") SetUnFreeBoundaryDraw;
		%feature("autodoc", "Enables the drawing the unfree boundaries by default the unfree boundaries are drawn.

Parameters
----------
OnOff: bool

Returns
-------
None
") SetUnFreeBoundaryDraw;
		void SetUnFreeBoundaryDraw(const Standard_Boolean OnOff);

		/****************** SetVIsoAspect ******************/
		%feature("compactdefaultargs") SetVIsoAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAspect: VrmlConverter_IsoAspect

Returns
-------
None
") SetVIsoAspect;
		void SetVIsoAspect(const opencascade::handle<VrmlConverter_IsoAspect> & anAspect);

		/****************** SetWireAspect ******************/
		%feature("compactdefaultargs") SetWireAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
anAspect: VrmlConverter_LineAspect

Returns
-------
None
") SetWireAspect;
		void SetWireAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****************** SetWireDraw ******************/
		%feature("compactdefaultargs") SetWireDraw;
		%feature("autodoc", "Enables the drawing the wire by default the wire are drawn.

Parameters
----------
OnOff: bool

Returns
-------
None
") SetWireDraw;
		void SetWireDraw(const Standard_Boolean OnOff);

		/****************** ShadingAspect ******************/
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "The default values are the same default values from vrml package.

Returns
-------
opencascade::handle<VrmlConverter_ShadingAspect>
") ShadingAspect;
		opencascade::handle<VrmlConverter_ShadingAspect> ShadingAspect();

		/****************** TypeOfDeflection ******************/
		%feature("compactdefaultargs") TypeOfDeflection;
		%feature("autodoc", "No available documentation.

Returns
-------
Aspect_TypeOfDeflection
") TypeOfDeflection;
		Aspect_TypeOfDeflection TypeOfDeflection();

		/****************** UIsoAspect ******************/
		%feature("compactdefaultargs") UIsoAspect;
		%feature("autodoc", "Defines the attributes which are used when drawing an u isoparametric curve of a face. defines the number of u isoparametric curves to be drawn for a single face. the default values are the same default values from vrml package. //! these attributes are used by the following algorithms: vrmlconverter_wfrestrictedface vrmlconverter_wfdeflectionrestrictedface.

Returns
-------
opencascade::handle<VrmlConverter_IsoAspect>
") UIsoAspect;
		opencascade::handle<VrmlConverter_IsoAspect> UIsoAspect();

		/****************** UnFreeBoundaryAspect ******************/
		%feature("compactdefaultargs") UnFreeBoundaryAspect;
		%feature("autodoc", "The default values are the same default values from vrml package. these attributes are used by the following algorithms: vrmlconverter_wfshape vrmlconverter_wfdeflectionshape.

Returns
-------
opencascade::handle<VrmlConverter_LineAspect>
") UnFreeBoundaryAspect;
		opencascade::handle<VrmlConverter_LineAspect> UnFreeBoundaryAspect();

		/****************** UnFreeBoundaryDraw ******************/
		%feature("compactdefaultargs") UnFreeBoundaryDraw;
		%feature("autodoc", "Returns true if the drawing of the unfree boundaries is enabled.

Returns
-------
bool
") UnFreeBoundaryDraw;
		Standard_Boolean UnFreeBoundaryDraw();

		/****************** VIsoAspect ******************/
		%feature("compactdefaultargs") VIsoAspect;
		%feature("autodoc", "Defines the attributes which are used when drawing an v isoparametric curve of a face. defines the number of v isoparametric curves to be drawn for a single face. the default values are the same default values from vrml package. //! these attributes are used by the following algorithms: vrmlconverter_wfrestrictedface vrmlconverter_wfdeflectionrestrictedface.

Returns
-------
opencascade::handle<VrmlConverter_IsoAspect>
") VIsoAspect;
		opencascade::handle<VrmlConverter_IsoAspect> VIsoAspect();

		/****************** WireAspect ******************/
		%feature("compactdefaultargs") WireAspect;
		%feature("autodoc", "The default values are the same default values from vrml package. these attributes are used by the following algorithms: vrmlconverter_wfshape vrmlconverter_wfdeflectionshape.

Returns
-------
opencascade::handle<VrmlConverter_LineAspect>
") WireAspect;
		opencascade::handle<VrmlConverter_LineAspect> WireAspect();

		/****************** WireDraw ******************/
		%feature("compactdefaultargs") WireDraw;
		%feature("autodoc", "Returns true if the drawing of the wire is enabled.

Returns
-------
bool
") WireDraw;
		Standard_Boolean WireDraw();

};


%make_alias(VrmlConverter_Drawer)

%extend VrmlConverter_Drawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class VrmlConverter_HLRShape *
*******************************/
class VrmlConverter_HLRShape {
	public:
};


%extend VrmlConverter_HLRShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class VrmlConverter_LineAspect *
*********************************/
class VrmlConverter_LineAspect : public Standard_Transient {
	public:
		/****************** VrmlConverter_LineAspect ******************/
		%feature("compactdefaultargs") VrmlConverter_LineAspect;
		%feature("autodoc", "Create a default lineaspect. default value: hasmaterial = false - a line hasn't own material (color).

Returns
-------
None
") VrmlConverter_LineAspect;
		 VrmlConverter_LineAspect();

		/****************** VrmlConverter_LineAspect ******************/
		%feature("compactdefaultargs") VrmlConverter_LineAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material
OnOff: bool

Returns
-------
None
") VrmlConverter_LineAspect;
		 VrmlConverter_LineAspect(const opencascade::handle<Vrml_Material> & aMaterial, const Standard_Boolean OnOff);

		/****************** HasMaterial ******************/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Returns true if the materials is writing into ostream.

Returns
-------
bool
") HasMaterial;
		Standard_Boolean HasMaterial();

		/****************** Material ******************/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") Material;
		opencascade::handle<Vrml_Material> Material();

		/****************** SetHasMaterial ******************/
		%feature("compactdefaultargs") SetHasMaterial;
		%feature("autodoc", "Defines the necessary of writing own material from vrml into output ostream. by default false - the material is not writing into ostream, true - the material is writing.

Parameters
----------
OnOff: bool

Returns
-------
None
") SetHasMaterial;
		void SetHasMaterial(const Standard_Boolean OnOff);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material

Returns
-------
None
") SetMaterial;
		void SetMaterial(const opencascade::handle<Vrml_Material> & aMaterial);

};


%make_alias(VrmlConverter_LineAspect)

%extend VrmlConverter_LineAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class VrmlConverter_PointAspect *
**********************************/
class VrmlConverter_PointAspect : public Standard_Transient {
	public:
		/****************** VrmlConverter_PointAspect ******************/
		%feature("compactdefaultargs") VrmlConverter_PointAspect;
		%feature("autodoc", "Create a default pointaspect. default value: hasmaterial = false - a line hasn't own material (color).

Returns
-------
None
") VrmlConverter_PointAspect;
		 VrmlConverter_PointAspect();

		/****************** VrmlConverter_PointAspect ******************/
		%feature("compactdefaultargs") VrmlConverter_PointAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material
OnOff: bool

Returns
-------
None
") VrmlConverter_PointAspect;
		 VrmlConverter_PointAspect(const opencascade::handle<Vrml_Material> & aMaterial, const Standard_Boolean OnOff);

		/****************** HasMaterial ******************/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Returns true if the materials is writing into ostream.

Returns
-------
bool
") HasMaterial;
		Standard_Boolean HasMaterial();

		/****************** Material ******************/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") Material;
		opencascade::handle<Vrml_Material> Material();

		/****************** SetHasMaterial ******************/
		%feature("compactdefaultargs") SetHasMaterial;
		%feature("autodoc", "Defines the necessary of writing own material from vrml into output ostream. by default false - the material is not writing into ostream, true - the material is writing.

Parameters
----------
OnOff: bool

Returns
-------
None
") SetHasMaterial;
		void SetHasMaterial(const Standard_Boolean OnOff);

		/****************** SetMaterial ******************/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material

Returns
-------
None
") SetMaterial;
		void SetMaterial(const opencascade::handle<Vrml_Material> & aMaterial);

};


%make_alias(VrmlConverter_PointAspect)

%extend VrmlConverter_PointAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class VrmlConverter_Projector *
********************************/
class VrmlConverter_Projector : public Standard_Transient {
	public:
		/****************** VrmlConverter_Projector ******************/
		%feature("compactdefaultargs") VrmlConverter_Projector;
		%feature("autodoc", "No available documentation.

Parameters
----------
Shapes: TopTools_Array1OfShape
Focus: float
DX: float
DY: float
DZ: float
XUp: float
YUp: float
ZUp: float
Camera: VrmlConverter_TypeOfCamera,optional
	default value is VrmlConverter_NoCamera
Light: VrmlConverter_TypeOfLight,optional
	default value is VrmlConverter_NoLight

Returns
-------
None
") VrmlConverter_Projector;
		 VrmlConverter_Projector(const TopTools_Array1OfShape & Shapes, const Standard_Real Focus, const Standard_Real DX, const Standard_Real DY, const Standard_Real DZ, const Standard_Real XUp, const Standard_Real YUp, const Standard_Real ZUp, const VrmlConverter_TypeOfCamera Camera = VrmlConverter_NoCamera, const VrmlConverter_TypeOfLight Light = VrmlConverter_NoLight);


        %feature("autodoc", "1");
        %extend{
            std::string AddToString() {
            std::stringstream s;
            self->Add(s);
            return s.str();}
        };
		/****************** Camera ******************/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "No available documentation.

Returns
-------
VrmlConverter_TypeOfCamera
") Camera;
		VrmlConverter_TypeOfCamera Camera();

		/****************** Light ******************/
		%feature("compactdefaultargs") Light;
		%feature("autodoc", "No available documentation.

Returns
-------
VrmlConverter_TypeOfLight
") Light;
		VrmlConverter_TypeOfLight Light();

		/****************** Projector ******************/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "No available documentation.

Returns
-------
HLRAlgo_Projector
") Projector;
		HLRAlgo_Projector Projector();

		/****************** SetCamera ******************/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "No available documentation.

Parameters
----------
aCamera: VrmlConverter_TypeOfCamera

Returns
-------
None
") SetCamera;
		void SetCamera(const VrmlConverter_TypeOfCamera aCamera);

		/****************** SetLight ******************/
		%feature("compactdefaultargs") SetLight;
		%feature("autodoc", "No available documentation.

Parameters
----------
aLight: VrmlConverter_TypeOfLight

Returns
-------
None
") SetLight;
		void SetLight(const VrmlConverter_TypeOfLight aLight);

};


%make_alias(VrmlConverter_Projector)

%extend VrmlConverter_Projector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class VrmlConverter_ShadedShape *
**********************************/
class VrmlConverter_ShadedShape {
	public:
		/****************** ComputeNormal ******************/
		%feature("compactdefaultargs") ComputeNormal;
		%feature("autodoc", "No available documentation.

Parameters
----------
aFace: TopoDS_Face
pc: Poly_Connect
Nor: TColgp_Array1OfDir

Returns
-------
None
") ComputeNormal;
		static void ComputeNormal(const TopoDS_Face & aFace, Poly_Connect & pc, TColgp_Array1OfDir & Nor);

};


%extend VrmlConverter_ShadedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class VrmlConverter_ShadingAspect *
************************************/
class VrmlConverter_ShadingAspect : public Standard_Transient {
	public:
		/****************** VrmlConverter_ShadingAspect ******************/
		%feature("compactdefaultargs") VrmlConverter_ShadingAspect;
		%feature("autodoc", "Create a default shadingaspect.

Returns
-------
None
") VrmlConverter_ShadingAspect;
		 VrmlConverter_ShadingAspect();

		/****************** FrontMaterial ******************/
		%feature("compactdefaultargs") FrontMaterial;
		%feature("autodoc", "No available documentation.

Returns
-------
opencascade::handle<Vrml_Material>
") FrontMaterial;
		opencascade::handle<Vrml_Material> FrontMaterial();

		/****************** HasMaterial ******************/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Returns true if the materials is writing into ostream.

Returns
-------
bool
") HasMaterial;
		Standard_Boolean HasMaterial();

		/****************** HasNormals ******************/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Returns true if the normals are calculating.

Returns
-------
bool
") HasNormals;
		Standard_Boolean HasNormals();

		/****************** SetFrontMaterial ******************/
		%feature("compactdefaultargs") SetFrontMaterial;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material

Returns
-------
None
") SetFrontMaterial;
		void SetFrontMaterial(const opencascade::handle<Vrml_Material> & aMaterial);

		/****************** SetHasMaterial ******************/
		%feature("compactdefaultargs") SetHasMaterial;
		%feature("autodoc", "Defines necessary of writing material from vrml into output ostream. by default false - the material is not writing into ostream, true - the material is writing.

Parameters
----------
OnOff: bool

Returns
-------
None
") SetHasMaterial;
		void SetHasMaterial(const Standard_Boolean OnOff);

		/****************** SetHasNormals ******************/
		%feature("compactdefaultargs") SetHasNormals;
		%feature("autodoc", "Defines necessary of a calculation of normals for shadedshape to more accurately display curved surfaces, pacticularly when smoooth or phong shading is used in vrml viewer. by default false - the normals are not calculated, true - the normals are calculated. warning: if normals are calculated the resulting vrml file will be substantially lager.

Parameters
----------
OnOff: bool

Returns
-------
None
") SetHasNormals;
		void SetHasNormals(const Standard_Boolean OnOff);

		/****************** SetShapeHints ******************/
		%feature("compactdefaultargs") SetShapeHints;
		%feature("autodoc", "No available documentation.

Parameters
----------
aShapeHints: Vrml_ShapeHints

Returns
-------
None
") SetShapeHints;
		void SetShapeHints(const Vrml_ShapeHints & aShapeHints);

		/****************** ShapeHints ******************/
		%feature("compactdefaultargs") ShapeHints;
		%feature("autodoc", "No available documentation.

Returns
-------
Vrml_ShapeHints
") ShapeHints;
		Vrml_ShapeHints ShapeHints();

};


%make_alias(VrmlConverter_ShadingAspect)

%extend VrmlConverter_ShadingAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************************************
* class VrmlConverter_WFDeflectionRestrictedFace *
*************************************************/
class VrmlConverter_WFDeflectionRestrictedFace {
	public:
};


%extend VrmlConverter_WFDeflectionRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class VrmlConverter_WFDeflectionShape *
****************************************/
class VrmlConverter_WFDeflectionShape {
	public:
};


%extend VrmlConverter_WFDeflectionShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************************
* class VrmlConverter_WFRestrictedFace *
***************************************/
class VrmlConverter_WFRestrictedFace {
	public:
};


%extend VrmlConverter_WFRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class VrmlConverter_WFShape *
******************************/
class VrmlConverter_WFShape {
	public:
};


%extend VrmlConverter_WFShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class VrmlConverter_IsoAspect *
********************************/
class VrmlConverter_IsoAspect : public VrmlConverter_LineAspect {
	public:
		/****************** VrmlConverter_IsoAspect ******************/
		%feature("compactdefaultargs") VrmlConverter_IsoAspect;
		%feature("autodoc", "Create a default isoaspect. default value: mynumber - 10.

Returns
-------
None
") VrmlConverter_IsoAspect;
		 VrmlConverter_IsoAspect();

		/****************** VrmlConverter_IsoAspect ******************/
		%feature("compactdefaultargs") VrmlConverter_IsoAspect;
		%feature("autodoc", "No available documentation.

Parameters
----------
aMaterial: Vrml_Material
OnOff: bool
aNumber: int

Returns
-------
None
") VrmlConverter_IsoAspect;
		 VrmlConverter_IsoAspect(const opencascade::handle<Vrml_Material> & aMaterial, const Standard_Boolean OnOff, const Standard_Integer aNumber);

		/****************** Number ******************/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Returns the number of u or v isoparametric curves drawn for a single face.

Returns
-------
int
") Number;
		Standard_Integer Number();

		/****************** SetNumber ******************/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "No available documentation.

Parameters
----------
aNumber: int

Returns
-------
None
") SetNumber;
		void SetNumber(const Standard_Integer aNumber);

};


%make_alias(VrmlConverter_IsoAspect)

%extend VrmlConverter_IsoAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
