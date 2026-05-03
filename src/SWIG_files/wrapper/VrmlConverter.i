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
%define VRMLCONVERTERDOCSTRING
"VrmlConverter module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_vrmlconverter.html"
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
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<VrmlConverter_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Aspect_module.hxx>
#include<TopoDS_module.hxx>
#include<Vrml_module.hxx>
#include<HLRAlgo_module.hxx>
#include<Poly_module.hxx>
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
#include<Graphic3d_module.hxx>
#include<Bnd_module.hxx>
#include<Media_module.hxx>
#include<IFSelect_module.hxx>
#include<TopTools_module.hxx>
#include<CDF_module.hxx>
#include<PCDM_module.hxx>
#include<TDF_module.hxx>
#include<MoniTool_module.hxx>
#include<Transfer_module.hxx>
#include<Interface_module.hxx>
#include<TDocStd_module.hxx>
#include<XSControl_module.hxx>
#include<DE_module.hxx>
#include<Aspect_module.hxx>
#include<Quantity_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Adaptor3d.i
%import Aspect.i
%import TopoDS.i
%import Vrml.i
%import HLRAlgo.i
%import Poly.i
%import BRepAdaptor.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum VrmlConverter_TypeOfCamera {
	VrmlConverter_NoCamera = 0,
	VrmlConverter_PerspectiveCamera = 1,
	VrmlConverter_OrthographicCamera = 2,
};

enum VrmlConverter_TypeOfLight {
	VrmlConverter_NoLight = 0,
	VrmlConverter_DirectionLight = 1,
	VrmlConverter_PointLight = 2,
	VrmlConverter_SpotLight = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class VrmlConverter_TypeOfCamera(IntEnum):
	VrmlConverter_NoCamera = 0
	VrmlConverter_PerspectiveCamera = 1
	VrmlConverter_OrthographicCamera = 2
VrmlConverter_NoCamera = VrmlConverter_TypeOfCamera.VrmlConverter_NoCamera
VrmlConverter_PerspectiveCamera = VrmlConverter_TypeOfCamera.VrmlConverter_PerspectiveCamera
VrmlConverter_OrthographicCamera = VrmlConverter_TypeOfCamera.VrmlConverter_OrthographicCamera

class VrmlConverter_TypeOfLight(IntEnum):
	VrmlConverter_NoLight = 0
	VrmlConverter_DirectionLight = 1
	VrmlConverter_PointLight = 2
	VrmlConverter_SpotLight = 3
VrmlConverter_NoLight = VrmlConverter_TypeOfLight.VrmlConverter_NoLight
VrmlConverter_DirectionLight = VrmlConverter_TypeOfLight.VrmlConverter_DirectionLight
VrmlConverter_PointLight = VrmlConverter_TypeOfLight.VrmlConverter_PointLight
VrmlConverter_SpotLight = VrmlConverter_TypeOfLight.VrmlConverter_SpotLight
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
		/****** VrmlConverter_Curve::Add ******/
		/****** md5 signature: f77568c42bfd62e2909598e33b21279c ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
adds to the OStream the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer.
") Add;
		static void Add(const Adaptor3d_Curve & aCurve, const opencascade::handle<VrmlConverter_Drawer> & aDrawer, std::ostream &OutValue);

		/****** VrmlConverter_Curve::Add ******/
		/****** md5 signature: f0d508cd5402267f77598cf41c88e4a9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
U1: double
U2: double
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
adds to the OStream the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer. The drawing will be limited between the points of parameter U1 and U2.
") Add;
		static void Add(const Adaptor3d_Curve & aCurve, const double U1, const double U2, const opencascade::handle<VrmlConverter_Drawer> & aDrawer, std::ostream &OutValue);

		/****** VrmlConverter_Curve::Add ******/
		/****** md5 signature: 5eade89a2abc86d13953c1ec0f6441f0 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
U1: double
U2: double
aNbPoints: int

Return
-------
anOStream: Standard_OStream

Description
-----------
adds to the OStream the drawing of the curve aCurve. The aspect is the current aspect. The drawing will be limited between the points of parameter U1 and U2. aNbPoints defines number of points on one interval.
") Add;
		static void Add(const Adaptor3d_Curve & aCurve, const double U1, const double U2, std::ostream &OutValue, const int aNbPoints);

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
		/****** VrmlConverter_DeflectionCurve::Add ******/
		/****** md5 signature: fa3cf6474a22907885c6263224b0cf1a ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
adds to the OStream the drawing of the curve aCurve with respect to the maximal chordial deviation defined by the drawer aDrawer. The aspect is defined by LineAspect in aDrawer.
") Add;
		static void Add(std::ostream &OutValue, Adaptor3d_Curve & aCurve, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****** VrmlConverter_DeflectionCurve::Add ******/
		/****** md5 signature: d19e580528a588cd640883e05619cba2 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
U1: double
U2: double
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
adds to the OStream the drawing of the curve aCurve with respect to the maximal chordial deviation defined by the drawer aDrawer. The aspect is defined by LineAspect in aDrawer. The drawing will be limited between the points of parameter U1 and U2.
") Add;
		static void Add(std::ostream &OutValue, Adaptor3d_Curve & aCurve, const double U1, const double U2, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****** VrmlConverter_DeflectionCurve::Add ******/
		/****** md5 signature: 92e5e022c4ca208a3aee9dad1e62d96d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
aDeflection: double
aLimit: double

Return
-------
anOStream: Standard_OStream

Description
-----------
adds to the OStream the drawing of the curve aCurve with respect to the maximal chordial deviation aDeflection. The aspect is the current aspect.
") Add;
		static void Add(std::ostream &OutValue, Adaptor3d_Curve & aCurve, const double aDeflection, const double aLimit);

		/****** VrmlConverter_DeflectionCurve::Add ******/
		/****** md5 signature: c47630e8b453b923c31d7e4717ca7186 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
aDeflection: double
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
adds to the OStream the drawing of the curve aCurve with respect to the maximal chordial deviation aDeflection. The aspect is the current aspect.
") Add;
		static void Add(std::ostream &OutValue, Adaptor3d_Curve & aCurve, const double aDeflection, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****** VrmlConverter_DeflectionCurve::Add ******/
		/****** md5 signature: 3d86c1fdac9751658613a23fb8895713 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
U1: double
U2: double
aDeflection: double

Return
-------
anOStream: Standard_OStream

Description
-----------
adds to the OStream the drawing of the curve aCurve with respect to the maximal chordial deviation aDeflection. The aspect is the current aspect The drawing will be limited between the points of parameter U1 and U2.
") Add;
		static void Add(std::ostream &OutValue, Adaptor3d_Curve & aCurve, const double U1, const double U2, const double aDeflection);

		/****** VrmlConverter_DeflectionCurve::Add ******/
		/****** md5 signature: 4ecf00f4719be3562653b77c4e3eb09f ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
aParams: NCollection_HArray1<double
aNbNodes: int
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
adds to the OStream the drawing of the curve aCurve with the array of parameters to retrieve points on curve.
") Add;
		static void Add(std::ostream &OutValue, const Adaptor3d_Curve & aCurve, const opencascade::handle<NCollection_HArray1<double> > & aParams, const int aNbNodes, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

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
		/****** VrmlConverter_Drawer::VrmlConverter_Drawer ******/
		/****** md5 signature: 50d56b7fc0f9f70ae9696fd1ec9fb13f ******/
		%feature("compactdefaultargs") VrmlConverter_Drawer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") VrmlConverter_Drawer;
		 VrmlConverter_Drawer();

		/****** VrmlConverter_Drawer::DeviationCoefficient ******/
		/****** md5 signature: 54d4031e0333dc15b72a5abfd0857347 ******/
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") DeviationCoefficient;
		double DeviationCoefficient();

		/****** VrmlConverter_Drawer::DisableDrawHiddenLine ******/
		/****** md5 signature: 641e43422c8b3be588dee379f3554611 ******/
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
sets DrawHiddenLine = false - the hidden lines are not drawn.
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine();

		/****** VrmlConverter_Drawer::Discretisation ******/
		/****** md5 signature: 7a003d77eaa603c7790136c0216af40d ******/
		%feature("compactdefaultargs") Discretisation;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Discretisation;
		int Discretisation();

		/****** VrmlConverter_Drawer::DrawHiddenLine ******/
		/****** md5 signature: 93a279ee3d98fce48f86ef4871fb576c ******/
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns true if the hidden lines are to be drawn. By default the hidden lines are not drawn.
") DrawHiddenLine;
		bool DrawHiddenLine();

		/****** VrmlConverter_Drawer::EnableDrawHiddenLine ******/
		/****** md5 signature: 5cd9db795aefc1eee38a63bd3f8ef65f ******/
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
sets DrawHiddenLine = true - the hidden lines are drawn.
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine();

		/****** VrmlConverter_Drawer::FreeBoundaryAspect ******/
		/****** md5 signature: 04d1df3026122ae362e2a3acf96c7bf4 ******/
		%feature("compactdefaultargs") FreeBoundaryAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
The default values are the same default values from Vrml package. These attributes are used by the following algorithms: VrmlConverter_WFShape VrmlConverter_WFDeflectionShape.
") FreeBoundaryAspect;
		opencascade::handle<VrmlConverter_LineAspect> FreeBoundaryAspect();

		/****** VrmlConverter_Drawer::FreeBoundaryDraw ******/
		/****** md5 signature: 7a5d1ae93e43f1037eff4d6a4a9fdb8e ******/
		%feature("compactdefaultargs") FreeBoundaryDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the drawing of the free boundaries is enabled.
") FreeBoundaryDraw;
		bool FreeBoundaryDraw();

		/****** VrmlConverter_Drawer::HiddenLineAspect ******/
		/****** md5 signature: 6cda2c10281e40668e3ce003bd403f7e ******/
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
returns LineAspect for the hidden lines. The default values are the same default values from Vrml package.
") HiddenLineAspect;
		opencascade::handle<VrmlConverter_LineAspect> HiddenLineAspect();

		/****** VrmlConverter_Drawer::IsoOnPlane ******/
		/****** md5 signature: 015c0994d8b48302840484a6b07346e4 ******/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the drawing of isos on planes is enabled.
") IsoOnPlane;
		bool IsoOnPlane();

		/****** VrmlConverter_Drawer::LineAspect ******/
		/****** md5 signature: 10d3b44cd6f35f1b32f4e4a53d2c93d1 ******/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
The default values are the same default values from Vrml package.
") LineAspect;
		opencascade::handle<VrmlConverter_LineAspect> LineAspect();

		/****** VrmlConverter_Drawer::MaximalChordialDeviation ******/
		/****** md5 signature: f41f16ae5e340ac45b030dc0fb51fa13 ******/
		%feature("compactdefaultargs") MaximalChordialDeviation;
		%feature("autodoc", "Return
-------
double

Description
-----------
returns the maximal chordial deviation. Default value: 0.1.
") MaximalChordialDeviation;
		double MaximalChordialDeviation();

		/****** VrmlConverter_Drawer::MaximalParameterValue ******/
		/****** md5 signature: e6abab74065c980909bc993ce9ed0113 ******/
		%feature("compactdefaultargs") MaximalParameterValue;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") MaximalParameterValue;
		double MaximalParameterValue();

		/****** VrmlConverter_Drawer::PointAspect ******/
		/****** md5 signature: 517fba9690e71053b84281b228e53cbe ******/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_PointAspect>

Description
-----------
No available documentation.
") PointAspect;
		opencascade::handle<VrmlConverter_PointAspect> PointAspect();

		/****** VrmlConverter_Drawer::SeenLineAspect ******/
		/****** md5 signature: 4cc88c3b860b008d7e79866002faec4c ******/
		%feature("compactdefaultargs") SeenLineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
returns LineAspect for the seen lines. The default values are the same default values from Vrml package.
") SeenLineAspect;
		opencascade::handle<VrmlConverter_LineAspect> SeenLineAspect();

		/****** VrmlConverter_Drawer::SetDeviationCoefficient ******/
		/****** md5 signature: a747e312279c7b855c06c93b821c7e82 ******/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "
Parameters
----------
aCoefficient: double

Return
-------
None

Description
-----------
default 0.001.
") SetDeviationCoefficient;
		void SetDeviationCoefficient(const double aCoefficient);

		/****** VrmlConverter_Drawer::SetDiscretisation ******/
		/****** md5 signature: ed6e33ba14360b6a03e5028e4cbaa299 ******/
		%feature("compactdefaultargs") SetDiscretisation;
		%feature("autodoc", "
Parameters
----------
d: int

Return
-------
None

Description
-----------
default: 17 points. Defines the Discretisation (myNbPoints) when drawing any curve; If this value is one of the obvious parameters of methods, current value from Drawer won't be used. This value is used by: //! VrmlConverter_Curve VrmlConverter_WFRestrictedFace VrmlConverter_WFShape.
") SetDiscretisation;
		void SetDiscretisation(const int d);

		/****** VrmlConverter_Drawer::SetFreeBoundaryAspect ******/
		/****** md5 signature: b753c9dce0c96db18c0367b3f719d115 ******/
		%feature("compactdefaultargs") SetFreeBoundaryAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: VrmlConverter_LineAspect

Return
-------
None

Description
-----------
No available documentation.
") SetFreeBoundaryAspect;
		void SetFreeBoundaryAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****** VrmlConverter_Drawer::SetFreeBoundaryDraw ******/
		/****** md5 signature: 25846a4849c1684b50f1e42dc4cb167d ******/
		%feature("compactdefaultargs") SetFreeBoundaryDraw;
		%feature("autodoc", "
Parameters
----------
OnOff: bool

Return
-------
None

Description
-----------
enables the drawing the free boundaries By default the free boundaries are drawn.
") SetFreeBoundaryDraw;
		void SetFreeBoundaryDraw(const bool OnOff);

		/****** VrmlConverter_Drawer::SetHiddenLineAspect ******/
		/****** md5 signature: 55fb6635c53fe6af709bf68203c8ed07 ******/
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: VrmlConverter_LineAspect

Return
-------
None

Description
-----------
sets LineAspect for the hidden lines.
") SetHiddenLineAspect;
		void SetHiddenLineAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****** VrmlConverter_Drawer::SetIsoOnPlane ******/
		/****** md5 signature: b07a17a0dc24f36fbaef7f4a3156982c ******/
		%feature("compactdefaultargs") SetIsoOnPlane;
		%feature("autodoc", "
Parameters
----------
OnOff: bool

Return
-------
None

Description
-----------
enables the drawing of isos on planes. By default there are no isos on planes.
") SetIsoOnPlane;
		void SetIsoOnPlane(const bool OnOff);

		/****** VrmlConverter_Drawer::SetLineAspect ******/
		/****** md5 signature: 5eb2900ea911f06c9e1609652af8a82c ******/
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: VrmlConverter_LineAspect

Return
-------
None

Description
-----------
No available documentation.
") SetLineAspect;
		void SetLineAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****** VrmlConverter_Drawer::SetMaximalChordialDeviation ******/
		/****** md5 signature: b740bf2c05596ab6cad775301486d72e ******/
		%feature("compactdefaultargs") SetMaximalChordialDeviation;
		%feature("autodoc", "
Parameters
----------
aChordialDeviation: double

Return
-------
None

Description
-----------
Defines the maximal chordial deviation when drawing any curve; If this value is one of the obvious parameters of methods, current value from Drawer won't be used. This value is used by: //! VrmlConverter_DeflectionCurve VrmlConverter_WFDeflectionRestrictedFace VrmlConverter_WFDeflectionShape.
") SetMaximalChordialDeviation;
		void SetMaximalChordialDeviation(const double aChordialDeviation);

		/****** VrmlConverter_Drawer::SetMaximalParameterValue ******/
		/****** md5 signature: 2c771ff8acdf16710b5790aadcb4933f ******/
		%feature("compactdefaultargs") SetMaximalParameterValue;
		%feature("autodoc", "
Parameters
----------
Value: double

Return
-------
None

Description
-----------
defines the maximum value allowed for the first and last parameters of an infinite curve. Default value: 500. VrmlConverter_Curve VrmlConverter_WFRestrictedFace VrmlConverter_WFShape.
") SetMaximalParameterValue;
		void SetMaximalParameterValue(const double Value);

		/****** VrmlConverter_Drawer::SetPointAspect ******/
		/****** md5 signature: 4fef72b3e3ed5a43e859117429fadc60 ******/
		%feature("compactdefaultargs") SetPointAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: VrmlConverter_PointAspect

Return
-------
None

Description
-----------
No available documentation.
") SetPointAspect;
		void SetPointAspect(const opencascade::handle<VrmlConverter_PointAspect> & anAspect);

		/****** VrmlConverter_Drawer::SetSeenLineAspect ******/
		/****** md5 signature: e8afb5afa4128ed47697a6f986ccadae ******/
		%feature("compactdefaultargs") SetSeenLineAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: VrmlConverter_LineAspect

Return
-------
None

Description
-----------
sets LineAspect for the seen lines.
") SetSeenLineAspect;
		void SetSeenLineAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****** VrmlConverter_Drawer::SetShadingAspect ******/
		/****** md5 signature: d328eb9def4296cd77e6827389248b54 ******/
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: VrmlConverter_ShadingAspect

Return
-------
None

Description
-----------
No available documentation.
") SetShadingAspect;
		void SetShadingAspect(const opencascade::handle<VrmlConverter_ShadingAspect> & anAspect);

		/****** VrmlConverter_Drawer::SetTypeOfDeflection ******/
		/****** md5 signature: 15d896ac7069d6573821f11e7331d7bf ******/
		%feature("compactdefaultargs") SetTypeOfDeflection;
		%feature("autodoc", "
Parameters
----------
aTypeOfDeflection: Aspect_TypeOfDeflection

Return
-------
None

Description
-----------
by default: TOD_Relative; however, except for the shapes, the drawing will be made using the absolute deviation.
") SetTypeOfDeflection;
		void SetTypeOfDeflection(const Aspect_TypeOfDeflection aTypeOfDeflection);

		/****** VrmlConverter_Drawer::SetUIsoAspect ******/
		/****** md5 signature: f4e29d0b6a62a6872b6bf8d7e9347975 ******/
		%feature("compactdefaultargs") SetUIsoAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: VrmlConverter_IsoAspect

Return
-------
None

Description
-----------
No available documentation.
") SetUIsoAspect;
		void SetUIsoAspect(const opencascade::handle<VrmlConverter_IsoAspect> & anAspect);

		/****** VrmlConverter_Drawer::SetUnFreeBoundaryAspect ******/
		/****** md5 signature: f4e94b4a3f6b280c40f0dbec924dd569 ******/
		%feature("compactdefaultargs") SetUnFreeBoundaryAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: VrmlConverter_LineAspect

Return
-------
None

Description
-----------
No available documentation.
") SetUnFreeBoundaryAspect;
		void SetUnFreeBoundaryAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****** VrmlConverter_Drawer::SetUnFreeBoundaryDraw ******/
		/****** md5 signature: 2df7278ef572157fc6a6f931d76b616b ******/
		%feature("compactdefaultargs") SetUnFreeBoundaryDraw;
		%feature("autodoc", "
Parameters
----------
OnOff: bool

Return
-------
None

Description
-----------
enables the drawing the unfree boundaries By default the unfree boundaries are drawn.
") SetUnFreeBoundaryDraw;
		void SetUnFreeBoundaryDraw(const bool OnOff);

		/****** VrmlConverter_Drawer::SetVIsoAspect ******/
		/****** md5 signature: c47b1d9750c189ada6a4381144f9e6a6 ******/
		%feature("compactdefaultargs") SetVIsoAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: VrmlConverter_IsoAspect

Return
-------
None

Description
-----------
No available documentation.
") SetVIsoAspect;
		void SetVIsoAspect(const opencascade::handle<VrmlConverter_IsoAspect> & anAspect);

		/****** VrmlConverter_Drawer::SetWireAspect ******/
		/****** md5 signature: eef16c67d22be8b99f960f6bd9169b9c ******/
		%feature("compactdefaultargs") SetWireAspect;
		%feature("autodoc", "
Parameters
----------
anAspect: VrmlConverter_LineAspect

Return
-------
None

Description
-----------
No available documentation.
") SetWireAspect;
		void SetWireAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****** VrmlConverter_Drawer::SetWireDraw ******/
		/****** md5 signature: 8eaf30a6dc6a7e2db13f0ae693af8aa9 ******/
		%feature("compactdefaultargs") SetWireDraw;
		%feature("autodoc", "
Parameters
----------
OnOff: bool

Return
-------
None

Description
-----------
enables the drawing the wire By default the wire are drawn.
") SetWireDraw;
		void SetWireDraw(const bool OnOff);

		/****** VrmlConverter_Drawer::ShadingAspect ******/
		/****** md5 signature: 5d0cf0274d76de1901c11b5f9428d705 ******/
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_ShadingAspect>

Description
-----------
The default values are the same default values from Vrml package.
") ShadingAspect;
		opencascade::handle<VrmlConverter_ShadingAspect> ShadingAspect();

		/****** VrmlConverter_Drawer::TypeOfDeflection ******/
		/****** md5 signature: 248cf82aa37de7bcdd2624ab28900498 ******/
		%feature("compactdefaultargs") TypeOfDeflection;
		%feature("autodoc", "Return
-------
Aspect_TypeOfDeflection

Description
-----------
No available documentation.
") TypeOfDeflection;
		Aspect_TypeOfDeflection TypeOfDeflection();

		/****** VrmlConverter_Drawer::UIsoAspect ******/
		/****** md5 signature: 9c8623662309fb68b4c2f17700aafa09 ******/
		%feature("compactdefaultargs") UIsoAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_IsoAspect>

Description
-----------
Defines the attributes which are used when drawing an U isoparametric curve of a face. Defines the number of U isoparametric curves to be drawn for a single face. The default values are the same default values from Vrml package. //! These attributes are used by the following algorithms: VrmlConverter_WFRestrictedFace VrmlConverter_WFDeflectionRestrictedFace.
") UIsoAspect;
		opencascade::handle<VrmlConverter_IsoAspect> UIsoAspect();

		/****** VrmlConverter_Drawer::UnFreeBoundaryAspect ******/
		/****** md5 signature: dda130af490804a9f49d6c964834ebc9 ******/
		%feature("compactdefaultargs") UnFreeBoundaryAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
The default values are the same default values from Vrml package. These attributes are used by the following algorithms: VrmlConverter_WFShape VrmlConverter_WFDeflectionShape.
") UnFreeBoundaryAspect;
		opencascade::handle<VrmlConverter_LineAspect> UnFreeBoundaryAspect();

		/****** VrmlConverter_Drawer::UnFreeBoundaryDraw ******/
		/****** md5 signature: 97d3c160d832f7c3084b202e707acce4 ******/
		%feature("compactdefaultargs") UnFreeBoundaryDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the drawing of the unfree boundaries is enabled.
") UnFreeBoundaryDraw;
		bool UnFreeBoundaryDraw();

		/****** VrmlConverter_Drawer::VIsoAspect ******/
		/****** md5 signature: cc5977cccf5921645af58a30c56dc8df ******/
		%feature("compactdefaultargs") VIsoAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_IsoAspect>

Description
-----------
Defines the attributes which are used when drawing an V isoparametric curve of a face. Defines the number of V isoparametric curves to be drawn for a single face. The default values are the same default values from Vrml package. //! These attributes are used by the following algorithms: VrmlConverter_WFRestrictedFace VrmlConverter_WFDeflectionRestrictedFace.
") VIsoAspect;
		opencascade::handle<VrmlConverter_IsoAspect> VIsoAspect();

		/****** VrmlConverter_Drawer::WireAspect ******/
		/****** md5 signature: 9aa4d1bbc3d5b4af3f544fcd361f6961 ******/
		%feature("compactdefaultargs") WireAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
The default values are the same default values from Vrml package. These attributes are used by the following algorithms: VrmlConverter_WFShape VrmlConverter_WFDeflectionShape.
") WireAspect;
		opencascade::handle<VrmlConverter_LineAspect> WireAspect();

		/****** VrmlConverter_Drawer::WireDraw ******/
		/****** md5 signature: fd5a8e6275a118fa311e373ea272187b ******/
		%feature("compactdefaultargs") WireDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the drawing of the wire is enabled.
") WireDraw;
		bool WireDraw();

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
		/****** VrmlConverter_HLRShape::Add ******/
		/****** md5 signature: 30e4fe59d2964122c8eb4a1e0b4e7266 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aDrawer: VrmlConverter_Drawer
aProjector: VrmlConverter_Projector

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Add;
		static void Add(std::ostream &OutValue, const TopoDS_Shape & aShape, const opencascade::handle<VrmlConverter_Drawer> & aDrawer, const opencascade::handle<VrmlConverter_Projector> & aProjector);

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
		/****** VrmlConverter_LineAspect::VrmlConverter_LineAspect ******/
		/****** md5 signature: bf339f497ac9d0937f0b77e42bff0ad2 ******/
		%feature("compactdefaultargs") VrmlConverter_LineAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
create a default LineAspect. Default value: HasMaterial = False - a line hasn't own material (color).
") VrmlConverter_LineAspect;
		 VrmlConverter_LineAspect();

		/****** VrmlConverter_LineAspect::VrmlConverter_LineAspect ******/
		/****** md5 signature: a6575935091b8626c11f9e2683c811aa ******/
		%feature("compactdefaultargs") VrmlConverter_LineAspect;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material
OnOff: bool

Return
-------
None

Description
-----------
No available documentation.
") VrmlConverter_LineAspect;
		 VrmlConverter_LineAspect(const opencascade::handle<Vrml_Material> & aMaterial, const bool OnOff);

		/****** VrmlConverter_LineAspect::HasMaterial ******/
		/****** md5 signature: 4c21f7fb44749c4df8e6f9673d4be968 ******/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the materials is writing into OStream.
") HasMaterial;
		bool HasMaterial();

		/****** VrmlConverter_LineAspect::Material ******/
		/****** md5 signature: 03890e6f4263cede852805215c495859 ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") Material;
		opencascade::handle<Vrml_Material> Material();

		/****** VrmlConverter_LineAspect::SetHasMaterial ******/
		/****** md5 signature: 6a5327907b8ef5ec9b53a58a20edb1c0 ******/
		%feature("compactdefaultargs") SetHasMaterial;
		%feature("autodoc", "
Parameters
----------
OnOff: bool

Return
-------
None

Description
-----------
defines the necessary of writing own Material from Vrml into output OStream. By default False - the material is not writing into OStream, True - the material is writing.
") SetHasMaterial;
		void SetHasMaterial(const bool OnOff);

		/****** VrmlConverter_LineAspect::SetMaterial ******/
		/****** md5 signature: 64fb7ab89ab3467b311fe2c83f43263d ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material

Return
-------
None

Description
-----------
No available documentation.
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
		/****** VrmlConverter_PointAspect::VrmlConverter_PointAspect ******/
		/****** md5 signature: 84e301b175c01c01a50b022de362459a ******/
		%feature("compactdefaultargs") VrmlConverter_PointAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
create a default PointAspect. Default value: HasMaterial = False - a line hasn't own material (color).
") VrmlConverter_PointAspect;
		 VrmlConverter_PointAspect();

		/****** VrmlConverter_PointAspect::VrmlConverter_PointAspect ******/
		/****** md5 signature: abad93378a11f41e1c13464948b64e0f ******/
		%feature("compactdefaultargs") VrmlConverter_PointAspect;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material
OnOff: bool

Return
-------
None

Description
-----------
No available documentation.
") VrmlConverter_PointAspect;
		 VrmlConverter_PointAspect(const opencascade::handle<Vrml_Material> & aMaterial, const bool OnOff);

		/****** VrmlConverter_PointAspect::HasMaterial ******/
		/****** md5 signature: 4c21f7fb44749c4df8e6f9673d4be968 ******/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the materials is writing into OStream.
") HasMaterial;
		bool HasMaterial();

		/****** VrmlConverter_PointAspect::Material ******/
		/****** md5 signature: 03890e6f4263cede852805215c495859 ******/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") Material;
		opencascade::handle<Vrml_Material> Material();

		/****** VrmlConverter_PointAspect::SetHasMaterial ******/
		/****** md5 signature: 6a5327907b8ef5ec9b53a58a20edb1c0 ******/
		%feature("compactdefaultargs") SetHasMaterial;
		%feature("autodoc", "
Parameters
----------
OnOff: bool

Return
-------
None

Description
-----------
defines the necessary of writing own Material from Vrml into output OStream. By default False - the material is not writing into OStream, True - the material is writing.
") SetHasMaterial;
		void SetHasMaterial(const bool OnOff);

		/****** VrmlConverter_PointAspect::SetMaterial ******/
		/****** md5 signature: 64fb7ab89ab3467b311fe2c83f43263d ******/
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material

Return
-------
None

Description
-----------
No available documentation.
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
		/****** VrmlConverter_Projector::VrmlConverter_Projector ******/
		/****** md5 signature: 5c60f006e4f27300c0d370c1326bfeca ******/
		%feature("compactdefaultargs") VrmlConverter_Projector;
		%feature("autodoc", "
Parameters
----------
Shapes: NCollection_Array1<TopoDS_Shape>
Focus: double
DX: double
DY: double
DZ: double
XUp: double
YUp: double
ZUp: double
Camera: VrmlConverter_TypeOfCamera (optional, default to VrmlConverter_NoCamera)
Light: VrmlConverter_TypeOfLight (optional, default to VrmlConverter_NoLight)

Return
-------
None

Description
-----------
No available documentation.
") VrmlConverter_Projector;
		 VrmlConverter_Projector(const NCollection_Array1<TopoDS_Shape> & Shapes, const double Focus, const double DX, const double DY, const double DZ, const double XUp, const double YUp, const double ZUp, const VrmlConverter_TypeOfCamera Camera = VrmlConverter_NoCamera, const VrmlConverter_TypeOfLight Light = VrmlConverter_NoLight);

		/****** VrmlConverter_Projector::Add ******/
		/****** md5 signature: fe7a6c17a63ece511d1868bb0e2144ae ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
Adds into anOStream if they are defined in Create. PerspectiveCamera, OrthographicCamera, DirectionLight, PointLight, SpotLight with MatrixTransform from VrmlConverter;.
") Add;
		void Add(std::ostream &OutValue);

		/****** VrmlConverter_Projector::Camera ******/
		/****** md5 signature: b0f9e1c3deb52397f7725e2e4fefc65e ******/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Return
-------
VrmlConverter_TypeOfCamera

Description
-----------
No available documentation.
") Camera;
		VrmlConverter_TypeOfCamera Camera();

		/****** VrmlConverter_Projector::Light ******/
		/****** md5 signature: 6f1efc19d4f2f9ce2878deb709792beb ******/
		%feature("compactdefaultargs") Light;
		%feature("autodoc", "Return
-------
VrmlConverter_TypeOfLight

Description
-----------
No available documentation.
") Light;
		VrmlConverter_TypeOfLight Light();

		/****** VrmlConverter_Projector::Projector ******/
		/****** md5 signature: 33ff71737cb03f728c05e0d14bb4473a ******/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Return
-------
HLRAlgo_Projector

Description
-----------
No available documentation.
") Projector;
		HLRAlgo_Projector Projector();

		/****** VrmlConverter_Projector::SetCamera ******/
		/****** md5 signature: 720856a9c37e4aa74b4f485511777c8a ******/
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "
Parameters
----------
aCamera: VrmlConverter_TypeOfCamera

Return
-------
None

Description
-----------
No available documentation.
") SetCamera;
		void SetCamera(const VrmlConverter_TypeOfCamera aCamera);

		/****** VrmlConverter_Projector::SetLight ******/
		/****** md5 signature: c1183fe310fce88909d0d018e45a408a ******/
		%feature("compactdefaultargs") SetLight;
		%feature("autodoc", "
Parameters
----------
aLight: VrmlConverter_TypeOfLight

Return
-------
None

Description
-----------
No available documentation.
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
		/****** VrmlConverter_ShadedShape::Add ******/
		/****** md5 signature: 6853d47fdcd987a19eaa45ce2ad05bc1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Add;
		static void Add(std::ostream &OutValue, const TopoDS_Shape & aShape, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****** VrmlConverter_ShadedShape::ComputeNormal ******/
		/****** md5 signature: c982790f17db594d1b7340b16724cddc ******/
		%feature("compactdefaultargs") ComputeNormal;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
pc: Poly_Connect
Nor: NCollection_Array1<gp_Dir>

Return
-------
None

Description
-----------
No available documentation.
") ComputeNormal;
		static void ComputeNormal(const TopoDS_Face & aFace, Poly_Connect & pc, NCollection_Array1<gp_Dir> & Nor);

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
		/****** VrmlConverter_ShadingAspect::VrmlConverter_ShadingAspect ******/
		/****** md5 signature: d8698607c9151af7e813354ce5d1fef8 ******/
		%feature("compactdefaultargs") VrmlConverter_ShadingAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
create a default ShadingAspect.
") VrmlConverter_ShadingAspect;
		 VrmlConverter_ShadingAspect();

		/****** VrmlConverter_ShadingAspect::FrontMaterial ******/
		/****** md5 signature: 1e7c2877a17204bd3d837b77037e4cbc ******/
		%feature("compactdefaultargs") FrontMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") FrontMaterial;
		opencascade::handle<Vrml_Material> FrontMaterial();

		/****** VrmlConverter_ShadingAspect::HasMaterial ******/
		/****** md5 signature: 4c21f7fb44749c4df8e6f9673d4be968 ******/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the materials is writing into OStream.
") HasMaterial;
		bool HasMaterial();

		/****** VrmlConverter_ShadingAspect::HasNormals ******/
		/****** md5 signature: 7b85da4e15282189c4164fb085476fe7 ******/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
returns True if the normals are calculating.
") HasNormals;
		bool HasNormals();

		/****** VrmlConverter_ShadingAspect::SetFrontMaterial ******/
		/****** md5 signature: 51ff40ccda9a7c5790c330959b5bf7a9 ******/
		%feature("compactdefaultargs") SetFrontMaterial;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material

Return
-------
None

Description
-----------
No available documentation.
") SetFrontMaterial;
		void SetFrontMaterial(const opencascade::handle<Vrml_Material> & aMaterial);

		/****** VrmlConverter_ShadingAspect::SetHasMaterial ******/
		/****** md5 signature: 6a5327907b8ef5ec9b53a58a20edb1c0 ******/
		%feature("compactdefaultargs") SetHasMaterial;
		%feature("autodoc", "
Parameters
----------
OnOff: bool

Return
-------
None

Description
-----------
defines necessary of writing Material from Vrml into output OStream. By default False - the material is not writing into OStream, True - the material is writing.
") SetHasMaterial;
		void SetHasMaterial(const bool OnOff);

		/****** VrmlConverter_ShadingAspect::SetHasNormals ******/
		/****** md5 signature: ecb3075cb13646c62b072e58572c9740 ******/
		%feature("compactdefaultargs") SetHasNormals;
		%feature("autodoc", "
Parameters
----------
OnOff: bool

Return
-------
None

Description
-----------
defines necessary of a calculation of normals for ShadedShape to more accurately display curved surfaces, pacticularly when smoooth or phong shading is used in VRML viewer. By default False - the normals are not calculated, True - the normals are calculated. Warning: If normals are calculated the resulting VRML file will be substantially lager.
") SetHasNormals;
		void SetHasNormals(const bool OnOff);

		/****** VrmlConverter_ShadingAspect::SetShapeHints ******/
		/****** md5 signature: 493f980a22ee969eb2903a3fce507dd0 ******/
		%feature("compactdefaultargs") SetShapeHints;
		%feature("autodoc", "
Parameters
----------
aShapeHints: Vrml_ShapeHints

Return
-------
None

Description
-----------
No available documentation.
") SetShapeHints;
		void SetShapeHints(const Vrml_ShapeHints & aShapeHints);

		/****** VrmlConverter_ShadingAspect::ShapeHints ******/
		/****** md5 signature: 50f5a6145a919d76772b61f7dc5e9d63 ******/
		%feature("compactdefaultargs") ShapeHints;
		%feature("autodoc", "Return
-------
Vrml_ShapeHints

Description
-----------
No available documentation.
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
		/****** VrmlConverter_WFDeflectionRestrictedFace::Add ******/
		/****** md5 signature: 13df692750a7fcf225b5286ed599cc3e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aFace: BRepAdaptor_Surface
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Add;
		static void Add(std::ostream &OutValue, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****** VrmlConverter_WFDeflectionRestrictedFace::Add ******/
		/****** md5 signature: 094b5b91259b3fe12ed406b61308dc51 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aFace: BRepAdaptor_Surface
DrawUIso: bool
DrawVIso: bool
Deflection: double
NBUiso: int
NBViso: int
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Add;
		static void Add(std::ostream &OutValue, const opencascade::handle<BRepAdaptor_Surface> & aFace, const bool DrawUIso, const bool DrawVIso, const double Deflection, const int NBUiso, const int NBViso, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****** VrmlConverter_WFDeflectionRestrictedFace::AddUIso ******/
		/****** md5 signature: 4aee442358ca971c2da6856dad976df1 ******/
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "
Parameters
----------
aFace: BRepAdaptor_Surface
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") AddUIso;
		static void AddUIso(std::ostream &OutValue, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****** VrmlConverter_WFDeflectionRestrictedFace::AddVIso ******/
		/****** md5 signature: ef51abaf211cf460780b49e6f72a0132 ******/
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "
Parameters
----------
aFace: BRepAdaptor_Surface
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") AddVIso;
		static void AddVIso(std::ostream &OutValue, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

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
		/****** VrmlConverter_WFDeflectionShape::Add ******/
		/****** md5 signature: 6853d47fdcd987a19eaa45ce2ad05bc1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Add;
		static void Add(std::ostream &OutValue, const TopoDS_Shape & aShape, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

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
		/****** VrmlConverter_WFRestrictedFace::Add ******/
		/****** md5 signature: 13df692750a7fcf225b5286ed599cc3e ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aFace: BRepAdaptor_Surface
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Add;
		static void Add(std::ostream &OutValue, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****** VrmlConverter_WFRestrictedFace::Add ******/
		/****** md5 signature: 9cb1242461907741cc3cdf62f54005a8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aFace: BRepAdaptor_Surface
DrawUIso: bool
DrawVIso: bool
NBUiso: int
NBViso: int
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Add;
		static void Add(std::ostream &OutValue, const opencascade::handle<BRepAdaptor_Surface> & aFace, const bool DrawUIso, const bool DrawVIso, const int NBUiso, const int NBViso, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****** VrmlConverter_WFRestrictedFace::AddUIso ******/
		/****** md5 signature: 4aee442358ca971c2da6856dad976df1 ******/
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "
Parameters
----------
aFace: BRepAdaptor_Surface
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") AddUIso;
		static void AddUIso(std::ostream &OutValue, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****** VrmlConverter_WFRestrictedFace::AddVIso ******/
		/****** md5 signature: ef51abaf211cf460780b49e6f72a0132 ******/
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "
Parameters
----------
aFace: BRepAdaptor_Surface
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") AddVIso;
		static void AddVIso(std::ostream &OutValue, const opencascade::handle<BRepAdaptor_Surface> & aFace, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

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
		/****** VrmlConverter_WFShape::Add ******/
		/****** md5 signature: 6853d47fdcd987a19eaa45ce2ad05bc1 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aShape: TopoDS_Shape
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
No available documentation.
") Add;
		static void Add(std::ostream &OutValue, const TopoDS_Shape & aShape, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

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
		/****** VrmlConverter_IsoAspect::VrmlConverter_IsoAspect ******/
		/****** md5 signature: 5ce8db721ef68b19958f2b6a85831caf ******/
		%feature("compactdefaultargs") VrmlConverter_IsoAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
create a default IsoAspect. Default value: myNumber - 10.
") VrmlConverter_IsoAspect;
		 VrmlConverter_IsoAspect();

		/****** VrmlConverter_IsoAspect::VrmlConverter_IsoAspect ******/
		/****** md5 signature: abb928e7205827502055d735ea98a768 ******/
		%feature("compactdefaultargs") VrmlConverter_IsoAspect;
		%feature("autodoc", "
Parameters
----------
aMaterial: Vrml_Material
OnOff: bool
aNumber: int

Return
-------
None

Description
-----------
No available documentation.
") VrmlConverter_IsoAspect;
		 VrmlConverter_IsoAspect(const opencascade::handle<Vrml_Material> & aMaterial, const bool OnOff, const int aNumber);

		/****** VrmlConverter_IsoAspect::Number ******/
		/****** md5 signature: 630c2fedd5680e328bd447673c7f6ee1 ******/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of U or V isoparametric curves drawn for a single face.
") Number;
		int Number();

		/****** VrmlConverter_IsoAspect::SetNumber ******/
		/****** md5 signature: 6a61c5d122936598d261143eb0426462 ******/
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "
Parameters
----------
aNumber: int

Return
-------
None

Description
-----------
No available documentation.
") SetNumber;
		void SetNumber(const int aNumber);

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
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def VrmlConverter_Curve_Add(*args):
	return VrmlConverter_Curve.Add(*args)

@deprecated
def VrmlConverter_Curve_Add(*args):
	return VrmlConverter_Curve.Add(*args)

@deprecated
def VrmlConverter_Curve_Add(*args):
	return VrmlConverter_Curve.Add(*args)

@deprecated
def VrmlConverter_DeflectionCurve_Add(*args):
	return VrmlConverter_DeflectionCurve.Add(*args)

@deprecated
def VrmlConverter_DeflectionCurve_Add(*args):
	return VrmlConverter_DeflectionCurve.Add(*args)

@deprecated
def VrmlConverter_DeflectionCurve_Add(*args):
	return VrmlConverter_DeflectionCurve.Add(*args)

@deprecated
def VrmlConverter_DeflectionCurve_Add(*args):
	return VrmlConverter_DeflectionCurve.Add(*args)

@deprecated
def VrmlConverter_DeflectionCurve_Add(*args):
	return VrmlConverter_DeflectionCurve.Add(*args)

@deprecated
def VrmlConverter_DeflectionCurve_Add(*args):
	return VrmlConverter_DeflectionCurve.Add(*args)

@deprecated
def VrmlConverter_HLRShape_Add(*args):
	return VrmlConverter_HLRShape.Add(*args)

@deprecated
def VrmlConverter_ShadedShape_Add(*args):
	return VrmlConverter_ShadedShape.Add(*args)

@deprecated
def VrmlConverter_ShadedShape_ComputeNormal(*args):
	return VrmlConverter_ShadedShape.ComputeNormal(*args)

@deprecated
def VrmlConverter_WFDeflectionRestrictedFace_Add(*args):
	return VrmlConverter_WFDeflectionRestrictedFace.Add(*args)

@deprecated
def VrmlConverter_WFDeflectionRestrictedFace_Add(*args):
	return VrmlConverter_WFDeflectionRestrictedFace.Add(*args)

@deprecated
def VrmlConverter_WFDeflectionRestrictedFace_AddUIso(*args):
	return VrmlConverter_WFDeflectionRestrictedFace.AddUIso(*args)

@deprecated
def VrmlConverter_WFDeflectionRestrictedFace_AddVIso(*args):
	return VrmlConverter_WFDeflectionRestrictedFace.AddVIso(*args)

@deprecated
def VrmlConverter_WFDeflectionShape_Add(*args):
	return VrmlConverter_WFDeflectionShape.Add(*args)

@deprecated
def VrmlConverter_WFRestrictedFace_Add(*args):
	return VrmlConverter_WFRestrictedFace.Add(*args)

@deprecated
def VrmlConverter_WFRestrictedFace_Add(*args):
	return VrmlConverter_WFRestrictedFace.Add(*args)

@deprecated
def VrmlConverter_WFRestrictedFace_AddUIso(*args):
	return VrmlConverter_WFRestrictedFace.AddUIso(*args)

@deprecated
def VrmlConverter_WFRestrictedFace_AddVIso(*args):
	return VrmlConverter_WFRestrictedFace.AddVIso(*args)

@deprecated
def VrmlConverter_WFShape_Add(*args):
	return VrmlConverter_WFShape.Add(*args)

}
