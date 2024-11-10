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
%define VRMLCONVERTERDOCSTRING
"VrmlConverter module, see official documentation at
https://dev.opencascade.org/doc/occt-7.7.0/refman/html/package_vrmlconverter.html"
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
		/****************** Add ******************/
		/**** md5 signature: f77568c42bfd62e2909598e33b21279c ****/
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
Adds to the ostream the drawing of the curve acurve. the aspect is defined by lineaspect in adrawer.
") Add;
		static void Add(const Adaptor3d_Curve & aCurve, const opencascade::handle<VrmlConverter_Drawer> & aDrawer, std::ostream &OutValue);

		/****************** Add ******************/
		/**** md5 signature: 3196c4271392c6a3ad65b906ad2f2f95 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
U1: float
U2: float
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
Adds to the ostream the drawing of the curve acurve. the aspect is defined by lineaspect in adrawer. the drawing will be limited between the points of parameter u1 and u2.
") Add;
		static void Add(const Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, const opencascade::handle<VrmlConverter_Drawer> & aDrawer, std::ostream &OutValue);

		/****************** Add ******************/
		/**** md5 signature: 4d8e1f226cc328fcdf9186ef585c5a61 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
U1: float
U2: float
aNbPoints: int

Return
-------
anOStream: Standard_OStream

Description
-----------
Adds to the ostream the drawing of the curve acurve. the aspect is the current aspect. the drawing will be limited between the points of parameter u1 and u2. anbpoints defines number of points on one interval.
") Add;
		static void Add(const Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, std::ostream &OutValue, const Standard_Integer aNbPoints);

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
		/****************** Add ******************/
		/**** md5 signature: fa3cf6474a22907885c6263224b0cf1a ****/
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
Adds to the ostream the drawing of the curve acurve with respect to the maximal chordial deviation defined by the drawer adrawer. the aspect is defined by lineaspect in adrawer.
") Add;
		static void Add(std::ostream &OutValue, Adaptor3d_Curve & aCurve, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****************** Add ******************/
		/**** md5 signature: 39f475f2bc1fcbcd57f32d9efba5b2a0 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
U1: float
U2: float
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
Adds to the ostream the drawing of the curve acurve with respect to the maximal chordial deviation defined by the drawer adrawer. the aspect is defined by lineaspect in adrawer. the drawing will be limited between the points of parameter u1 and u2.
") Add;
		static void Add(std::ostream &OutValue, Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****************** Add ******************/
		/**** md5 signature: 9eb6209c6c437e1de208c514bbc6c3bc ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
aDeflection: float
aLimit: float

Return
-------
anOStream: Standard_OStream

Description
-----------
Adds to the ostream the drawing of the curve acurve with respect to the maximal chordial deviation adeflection. the aspect is the current aspect.
") Add;
		static void Add(std::ostream &OutValue, Adaptor3d_Curve & aCurve, const Standard_Real aDeflection, const Standard_Real aLimit);

		/****************** Add ******************/
		/**** md5 signature: 970b94fef97d65ba55ddab3b8061c036 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
aDeflection: float
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
Adds to the ostream the drawing of the curve acurve with respect to the maximal chordial deviation adeflection. the aspect is the current aspect.
") Add;
		static void Add(std::ostream &OutValue, Adaptor3d_Curve & aCurve, const Standard_Real aDeflection, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****************** Add ******************/
		/**** md5 signature: cfb82f5b167e71e8335c2fb562364aae ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
U1: float
U2: float
aDeflection: float

Return
-------
anOStream: Standard_OStream

Description
-----------
Adds to the ostream the drawing of the curve acurve with respect to the maximal chordial deviation adeflection. the aspect is the current aspect the drawing will be limited between the points of parameter u1 and u2.
") Add;
		static void Add(std::ostream &OutValue, Adaptor3d_Curve & aCurve, const Standard_Real U1, const Standard_Real U2, const Standard_Real aDeflection);

		/****************** Add ******************/
		/**** md5 signature: ee27b5c0244974cd4e5e8d540e9f3dd4 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aCurve: Adaptor3d_Curve
aParams: TColStd_HArray1OfReal
aNbNodes: int
aDrawer: VrmlConverter_Drawer

Return
-------
anOStream: Standard_OStream

Description
-----------
Adds to the ostream the drawing of the curve acurve with the array of parameters to retrieve points on curve.
") Add;
		static void Add(std::ostream &OutValue, const Adaptor3d_Curve & aCurve, const opencascade::handle<TColStd_HArray1OfReal> & aParams, const Standard_Integer aNbNodes, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

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
		/**** md5 signature: 50d56b7fc0f9f70ae9696fd1ec9fb13f ****/
		%feature("compactdefaultargs") VrmlConverter_Drawer;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") VrmlConverter_Drawer;
		 VrmlConverter_Drawer();

		/****************** DeviationCoefficient ******************/
		/**** md5 signature: 9c4d7eea432c70a83c2882b4c26bcbec ****/
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") DeviationCoefficient;
		Standard_Real DeviationCoefficient();

		/****************** DisableDrawHiddenLine ******************/
		/**** md5 signature: 641e43422c8b3be588dee379f3554611 ****/
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets drawhiddenline = standard_false - the hidden lines are not drawn.
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine();

		/****************** Discretisation ******************/
		/**** md5 signature: 18f9f6513037ffdf8c25c09bd0c0fcae ****/
		%feature("compactdefaultargs") Discretisation;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") Discretisation;
		Standard_Integer Discretisation();

		/****************** DrawHiddenLine ******************/
		/**** md5 signature: ee867d8bc869aae190f7ad2dd51ea119 ****/
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns standard_true if the hidden lines are to be drawn. by default the hidden lines are not drawn.
") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine();

		/****************** EnableDrawHiddenLine ******************/
		/**** md5 signature: 5cd9db795aefc1eee38a63bd3f8ef65f ****/
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets drawhiddenline = standard_true - the hidden lines are drawn.
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine();

		/****************** FreeBoundaryAspect ******************/
		/**** md5 signature: 04d1df3026122ae362e2a3acf96c7bf4 ****/
		%feature("compactdefaultargs") FreeBoundaryAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
The default values are the same default values from vrml package. these attributes are used by the following algorithms: vrmlconverter_wfshape vrmlconverter_wfdeflectionshape.
") FreeBoundaryAspect;
		opencascade::handle<VrmlConverter_LineAspect> FreeBoundaryAspect();

		/****************** FreeBoundaryDraw ******************/
		/**** md5 signature: 11d22380fcd072305a34d7efb441c5fb ****/
		%feature("compactdefaultargs") FreeBoundaryDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawing of the free boundaries is enabled.
") FreeBoundaryDraw;
		Standard_Boolean FreeBoundaryDraw();

		/****************** HiddenLineAspect ******************/
		/**** md5 signature: 6cda2c10281e40668e3ce003bd403f7e ****/
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
Returns lineaspect for the hidden lines. the default values are the same default values from vrml package.
") HiddenLineAspect;
		opencascade::handle<VrmlConverter_LineAspect> HiddenLineAspect();

		/****************** IsoOnPlane ******************/
		/**** md5 signature: 2399069013e2297195a97f40a31fdec3 ****/
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawing of isos on planes is enabled.
") IsoOnPlane;
		Standard_Boolean IsoOnPlane();

		/****************** LineAspect ******************/
		/**** md5 signature: 10d3b44cd6f35f1b32f4e4a53d2c93d1 ****/
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
The default values are the same default values from vrml package.
") LineAspect;
		opencascade::handle<VrmlConverter_LineAspect> LineAspect();

		/****************** MaximalChordialDeviation ******************/
		/**** md5 signature: 3f1909519a6c78fd474f5dca47ef5d02 ****/
		%feature("compactdefaultargs") MaximalChordialDeviation;
		%feature("autodoc", "Return
-------
float

Description
-----------
Returns the maximal chordial deviation. default value: 0.1.
") MaximalChordialDeviation;
		Standard_Real MaximalChordialDeviation();

		/****************** MaximalParameterValue ******************/
		/**** md5 signature: 8d1dc382de840a6984d9a64c4f5e4f43 ****/
		%feature("compactdefaultargs") MaximalParameterValue;
		%feature("autodoc", "Return
-------
float

Description
-----------
No available documentation.
") MaximalParameterValue;
		Standard_Real MaximalParameterValue();

		/****************** PointAspect ******************/
		/**** md5 signature: 517fba9690e71053b84281b228e53cbe ****/
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_PointAspect>

Description
-----------
No available documentation.
") PointAspect;
		opencascade::handle<VrmlConverter_PointAspect> PointAspect();

		/****************** SeenLineAspect ******************/
		/**** md5 signature: 4cc88c3b860b008d7e79866002faec4c ****/
		%feature("compactdefaultargs") SeenLineAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
Returns lineaspect for the seen lines. the default values are the same default values from vrml package.
") SeenLineAspect;
		opencascade::handle<VrmlConverter_LineAspect> SeenLineAspect();

		/****************** SetDeviationCoefficient ******************/
		/**** md5 signature: 27ff94a2731caf5da558c89ae5904057 ****/
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "
Parameters
----------
aCoefficient: float

Return
-------
None

Description
-----------
Default 0.001.
") SetDeviationCoefficient;
		void SetDeviationCoefficient(const Standard_Real aCoefficient);

		/****************** SetDiscretisation ******************/
		/**** md5 signature: 41e5e45c319eeef85db796aa66efd30d ****/
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
Default: 17 points. defines the discretisation (mynbpoints) when drawing any curve; if this value is one of the obvious parameters of methods, current value from drawer won't be used. this value is used by: //! vrmlconverter_curve vrmlconverter_wfrestrictedface vrmlconverter_wfshape.
") SetDiscretisation;
		void SetDiscretisation(const Standard_Integer d);

		/****************** SetFreeBoundaryAspect ******************/
		/**** md5 signature: b753c9dce0c96db18c0367b3f719d115 ****/
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

		/****************** SetFreeBoundaryDraw ******************/
		/**** md5 signature: a97de160d86b9b7b83ea15b3c8cf20ed ****/
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
Enables the drawing the free boundaries by default the free boundaries are drawn.
") SetFreeBoundaryDraw;
		void SetFreeBoundaryDraw(const Standard_Boolean OnOff);

		/****************** SetHiddenLineAspect ******************/
		/**** md5 signature: 55fb6635c53fe6af709bf68203c8ed07 ****/
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
Sets lineaspect for the hidden lines.
") SetHiddenLineAspect;
		void SetHiddenLineAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****************** SetIsoOnPlane ******************/
		/**** md5 signature: 8307865551cf7b68497b05bccdae6df0 ****/
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
Enables the drawing of isos on planes. by default there are no isos on planes.
") SetIsoOnPlane;
		void SetIsoOnPlane(const Standard_Boolean OnOff);

		/****************** SetLineAspect ******************/
		/**** md5 signature: 5eb2900ea911f06c9e1609652af8a82c ****/
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

		/****************** SetMaximalChordialDeviation ******************/
		/**** md5 signature: cde9e0a8eebe4a5a1b478d9e9d920c32 ****/
		%feature("compactdefaultargs") SetMaximalChordialDeviation;
		%feature("autodoc", "
Parameters
----------
aChordialDeviation: float

Return
-------
None

Description
-----------
Defines the maximal chordial deviation when drawing any curve; if this value is one of the obvious parameters of methods, current value from drawer won't be used. this value is used by: //! vrmlconverter_deflectioncurve vrmlconverter_wfdeflectionrestrictedface vrmlconverter_wfdeflectionshape.
") SetMaximalChordialDeviation;
		void SetMaximalChordialDeviation(const Standard_Real aChordialDeviation);

		/****************** SetMaximalParameterValue ******************/
		/**** md5 signature: 419b5b036141a4299624009da39c0c9a ****/
		%feature("compactdefaultargs") SetMaximalParameterValue;
		%feature("autodoc", "
Parameters
----------
Value: float

Return
-------
None

Description
-----------
Defines the maximum value allowed for the first and last parameters of an infinite curve. default value: 500. vrmlconverter_curve vrmlconverter_wfrestrictedface vrmlconverter_wfshape.
") SetMaximalParameterValue;
		void SetMaximalParameterValue(const Standard_Real Value);

		/****************** SetPointAspect ******************/
		/**** md5 signature: 4fef72b3e3ed5a43e859117429fadc60 ****/
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

		/****************** SetSeenLineAspect ******************/
		/**** md5 signature: e8afb5afa4128ed47697a6f986ccadae ****/
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
Sets lineaspect for the seen lines.
") SetSeenLineAspect;
		void SetSeenLineAspect(const opencascade::handle<VrmlConverter_LineAspect> & anAspect);

		/****************** SetShadingAspect ******************/
		/**** md5 signature: d328eb9def4296cd77e6827389248b54 ****/
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

		/****************** SetTypeOfDeflection ******************/
		/**** md5 signature: 15d896ac7069d6573821f11e7331d7bf ****/
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
By default: tod_relative; however, except for the shapes, the drawing will be made using the absolute deviation.
") SetTypeOfDeflection;
		void SetTypeOfDeflection(const Aspect_TypeOfDeflection aTypeOfDeflection);

		/****************** SetUIsoAspect ******************/
		/**** md5 signature: f4e29d0b6a62a6872b6bf8d7e9347975 ****/
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

		/****************** SetUnFreeBoundaryAspect ******************/
		/**** md5 signature: f4e94b4a3f6b280c40f0dbec924dd569 ****/
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

		/****************** SetUnFreeBoundaryDraw ******************/
		/**** md5 signature: a143dffaa4a3eb95e87033d19e793bb3 ****/
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
Enables the drawing the unfree boundaries by default the unfree boundaries are drawn.
") SetUnFreeBoundaryDraw;
		void SetUnFreeBoundaryDraw(const Standard_Boolean OnOff);

		/****************** SetVIsoAspect ******************/
		/**** md5 signature: c47b1d9750c189ada6a4381144f9e6a6 ****/
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

		/****************** SetWireAspect ******************/
		/**** md5 signature: eef16c67d22be8b99f960f6bd9169b9c ****/
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

		/****************** SetWireDraw ******************/
		/**** md5 signature: c1f79da20ee06accf05441cb7cdbd87c ****/
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
Enables the drawing the wire by default the wire are drawn.
") SetWireDraw;
		void SetWireDraw(const Standard_Boolean OnOff);

		/****************** ShadingAspect ******************/
		/**** md5 signature: 5d0cf0274d76de1901c11b5f9428d705 ****/
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_ShadingAspect>

Description
-----------
The default values are the same default values from vrml package.
") ShadingAspect;
		opencascade::handle<VrmlConverter_ShadingAspect> ShadingAspect();

		/****************** TypeOfDeflection ******************/
		/**** md5 signature: 248cf82aa37de7bcdd2624ab28900498 ****/
		%feature("compactdefaultargs") TypeOfDeflection;
		%feature("autodoc", "Return
-------
Aspect_TypeOfDeflection

Description
-----------
No available documentation.
") TypeOfDeflection;
		Aspect_TypeOfDeflection TypeOfDeflection();

		/****************** UIsoAspect ******************/
		/**** md5 signature: 9c8623662309fb68b4c2f17700aafa09 ****/
		%feature("compactdefaultargs") UIsoAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_IsoAspect>

Description
-----------
Defines the attributes which are used when drawing an u isoparametric curve of a face. defines the number of u isoparametric curves to be drawn for a single face. the default values are the same default values from vrml package. //! these attributes are used by the following algorithms: vrmlconverter_wfrestrictedface vrmlconverter_wfdeflectionrestrictedface.
") UIsoAspect;
		opencascade::handle<VrmlConverter_IsoAspect> UIsoAspect();

		/****************** UnFreeBoundaryAspect ******************/
		/**** md5 signature: dda130af490804a9f49d6c964834ebc9 ****/
		%feature("compactdefaultargs") UnFreeBoundaryAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
The default values are the same default values from vrml package. these attributes are used by the following algorithms: vrmlconverter_wfshape vrmlconverter_wfdeflectionshape.
") UnFreeBoundaryAspect;
		opencascade::handle<VrmlConverter_LineAspect> UnFreeBoundaryAspect();

		/****************** UnFreeBoundaryDraw ******************/
		/**** md5 signature: 5d96cc31379600a277a02c7762d6fdcf ****/
		%feature("compactdefaultargs") UnFreeBoundaryDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawing of the unfree boundaries is enabled.
") UnFreeBoundaryDraw;
		Standard_Boolean UnFreeBoundaryDraw();

		/****************** VIsoAspect ******************/
		/**** md5 signature: cc5977cccf5921645af58a30c56dc8df ****/
		%feature("compactdefaultargs") VIsoAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_IsoAspect>

Description
-----------
Defines the attributes which are used when drawing an v isoparametric curve of a face. defines the number of v isoparametric curves to be drawn for a single face. the default values are the same default values from vrml package. //! these attributes are used by the following algorithms: vrmlconverter_wfrestrictedface vrmlconverter_wfdeflectionrestrictedface.
") VIsoAspect;
		opencascade::handle<VrmlConverter_IsoAspect> VIsoAspect();

		/****************** WireAspect ******************/
		/**** md5 signature: 9aa4d1bbc3d5b4af3f544fcd361f6961 ****/
		%feature("compactdefaultargs") WireAspect;
		%feature("autodoc", "Return
-------
opencascade::handle<VrmlConverter_LineAspect>

Description
-----------
The default values are the same default values from vrml package. these attributes are used by the following algorithms: vrmlconverter_wfshape vrmlconverter_wfdeflectionshape.
") WireAspect;
		opencascade::handle<VrmlConverter_LineAspect> WireAspect();

		/****************** WireDraw ******************/
		/**** md5 signature: 98b6c538363b2ed01de78110b802ce45 ****/
		%feature("compactdefaultargs") WireDraw;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the drawing of the wire is enabled.
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
		/****************** Add ******************/
		/**** md5 signature: 30e4fe59d2964122c8eb4a1e0b4e7266 ****/
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
		/****************** VrmlConverter_LineAspect ******************/
		/**** md5 signature: bf339f497ac9d0937f0b77e42bff0ad2 ****/
		%feature("compactdefaultargs") VrmlConverter_LineAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create a default lineaspect. default value: hasmaterial = false - a line hasn't own material (color).
") VrmlConverter_LineAspect;
		 VrmlConverter_LineAspect();

		/****************** VrmlConverter_LineAspect ******************/
		/**** md5 signature: 4c5521183a68c8d01e40f8ea856cea40 ****/
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
		 VrmlConverter_LineAspect(const opencascade::handle<Vrml_Material> & aMaterial, const Standard_Boolean OnOff);

		/****************** HasMaterial ******************/
		/**** md5 signature: 080a4ac510e7b99195dfb4b5407d4b43 ****/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the materials is writing into ostream.
") HasMaterial;
		Standard_Boolean HasMaterial();

		/****************** Material ******************/
		/**** md5 signature: 03890e6f4263cede852805215c495859 ****/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") Material;
		opencascade::handle<Vrml_Material> Material();

		/****************** SetHasMaterial ******************/
		/**** md5 signature: d47b97f4540a599bd8501ac45e6c5e60 ****/
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
Defines the necessary of writing own material from vrml into output ostream. by default false - the material is not writing into ostream, true - the material is writing.
") SetHasMaterial;
		void SetHasMaterial(const Standard_Boolean OnOff);

		/****************** SetMaterial ******************/
		/**** md5 signature: 64fb7ab89ab3467b311fe2c83f43263d ****/
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
		/****************** VrmlConverter_PointAspect ******************/
		/**** md5 signature: 84e301b175c01c01a50b022de362459a ****/
		%feature("compactdefaultargs") VrmlConverter_PointAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create a default pointaspect. default value: hasmaterial = false - a line hasn't own material (color).
") VrmlConverter_PointAspect;
		 VrmlConverter_PointAspect();

		/****************** VrmlConverter_PointAspect ******************/
		/**** md5 signature: fb2d5b763957fb90c987db37115ddec0 ****/
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
		 VrmlConverter_PointAspect(const opencascade::handle<Vrml_Material> & aMaterial, const Standard_Boolean OnOff);

		/****************** HasMaterial ******************/
		/**** md5 signature: 080a4ac510e7b99195dfb4b5407d4b43 ****/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the materials is writing into ostream.
") HasMaterial;
		Standard_Boolean HasMaterial();

		/****************** Material ******************/
		/**** md5 signature: 03890e6f4263cede852805215c495859 ****/
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") Material;
		opencascade::handle<Vrml_Material> Material();

		/****************** SetHasMaterial ******************/
		/**** md5 signature: d47b97f4540a599bd8501ac45e6c5e60 ****/
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
Defines the necessary of writing own material from vrml into output ostream. by default false - the material is not writing into ostream, true - the material is writing.
") SetHasMaterial;
		void SetHasMaterial(const Standard_Boolean OnOff);

		/****************** SetMaterial ******************/
		/**** md5 signature: 64fb7ab89ab3467b311fe2c83f43263d ****/
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
		/****************** VrmlConverter_Projector ******************/
		/**** md5 signature: 3027816b30293e2ab542f0061b45dc27 ****/
		%feature("compactdefaultargs") VrmlConverter_Projector;
		%feature("autodoc", "
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
Camera: VrmlConverter_TypeOfCamera (optional, default to VrmlConverter_NoCamera)
Light: VrmlConverter_TypeOfLight (optional, default to VrmlConverter_NoLight)

Return
-------
None

Description
-----------
No available documentation.
") VrmlConverter_Projector;
		 VrmlConverter_Projector(const TopTools_Array1OfShape & Shapes, const Standard_Real Focus, const Standard_Real DX, const Standard_Real DY, const Standard_Real DZ, const Standard_Real XUp, const Standard_Real YUp, const Standard_Real ZUp, const VrmlConverter_TypeOfCamera Camera = VrmlConverter_NoCamera, const VrmlConverter_TypeOfLight Light = VrmlConverter_NoLight);

		/****************** Add ******************/
		/**** md5 signature: fe7a6c17a63ece511d1868bb0e2144ae ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------

Return
-------
anOStream: Standard_OStream

Description
-----------
Adds into anostream if they are defined in create. perspectivecamera, orthographiccamera, directionlight, pointlight, spotlight with matrixtransform from vrmlconverter;.
") Add;
		void Add(std::ostream &OutValue);

		/****************** Camera ******************/
		/**** md5 signature: b0f9e1c3deb52397f7725e2e4fefc65e ****/
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "Return
-------
VrmlConverter_TypeOfCamera

Description
-----------
No available documentation.
") Camera;
		VrmlConverter_TypeOfCamera Camera();

		/****************** Light ******************/
		/**** md5 signature: 6f1efc19d4f2f9ce2878deb709792beb ****/
		%feature("compactdefaultargs") Light;
		%feature("autodoc", "Return
-------
VrmlConverter_TypeOfLight

Description
-----------
No available documentation.
") Light;
		VrmlConverter_TypeOfLight Light();

		/****************** Projector ******************/
		/**** md5 signature: 33ff71737cb03f728c05e0d14bb4473a ****/
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "Return
-------
HLRAlgo_Projector

Description
-----------
No available documentation.
") Projector;
		HLRAlgo_Projector Projector();

		/****************** SetCamera ******************/
		/**** md5 signature: 720856a9c37e4aa74b4f485511777c8a ****/
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

		/****************** SetLight ******************/
		/**** md5 signature: c1183fe310fce88909d0d018e45a408a ****/
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
		/****************** Add ******************/
		/**** md5 signature: 6853d47fdcd987a19eaa45ce2ad05bc1 ****/
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

		/****************** ComputeNormal ******************/
		/**** md5 signature: 94eb9e8b7db2c9db0658575ebc46926f ****/
		%feature("compactdefaultargs") ComputeNormal;
		%feature("autodoc", "
Parameters
----------
aFace: TopoDS_Face
pc: Poly_Connect
Nor: TColgp_Array1OfDir

Return
-------
None

Description
-----------
No available documentation.
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
		/**** md5 signature: d8698607c9151af7e813354ce5d1fef8 ****/
		%feature("compactdefaultargs") VrmlConverter_ShadingAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create a default shadingaspect.
") VrmlConverter_ShadingAspect;
		 VrmlConverter_ShadingAspect();

		/****************** FrontMaterial ******************/
		/**** md5 signature: 1e7c2877a17204bd3d837b77037e4cbc ****/
		%feature("compactdefaultargs") FrontMaterial;
		%feature("autodoc", "Return
-------
opencascade::handle<Vrml_Material>

Description
-----------
No available documentation.
") FrontMaterial;
		opencascade::handle<Vrml_Material> FrontMaterial();

		/****************** HasMaterial ******************/
		/**** md5 signature: 080a4ac510e7b99195dfb4b5407d4b43 ****/
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the materials is writing into ostream.
") HasMaterial;
		Standard_Boolean HasMaterial();

		/****************** HasNormals ******************/
		/**** md5 signature: 181f2084bd118d7033834a50e616fde5 ****/
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the normals are calculating.
") HasNormals;
		Standard_Boolean HasNormals();

		/****************** SetFrontMaterial ******************/
		/**** md5 signature: 51ff40ccda9a7c5790c330959b5bf7a9 ****/
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

		/****************** SetHasMaterial ******************/
		/**** md5 signature: d47b97f4540a599bd8501ac45e6c5e60 ****/
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
Defines necessary of writing material from vrml into output ostream. by default false - the material is not writing into ostream, true - the material is writing.
") SetHasMaterial;
		void SetHasMaterial(const Standard_Boolean OnOff);

		/****************** SetHasNormals ******************/
		/**** md5 signature: 14d1dce58b5b630563d8387ac84b635b ****/
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
Defines necessary of a calculation of normals for shadedshape to more accurately display curved surfaces, pacticularly when smoooth or phong shading is used in vrml viewer. by default false - the normals are not calculated, true - the normals are calculated. warning: if normals are calculated the resulting vrml file will be substantially lager.
") SetHasNormals;
		void SetHasNormals(const Standard_Boolean OnOff);

		/****************** SetShapeHints ******************/
		/**** md5 signature: 493f980a22ee969eb2903a3fce507dd0 ****/
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

		/****************** ShapeHints ******************/
		/**** md5 signature: 50f5a6145a919d76772b61f7dc5e9d63 ****/
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
		/****************** Add ******************/
		/**** md5 signature: 13df692750a7fcf225b5286ed599cc3e ****/
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

		/****************** Add ******************/
		/**** md5 signature: 90da66cc4406b2e2f1bfc7074ed66a78 ****/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
aFace: BRepAdaptor_Surface
DrawUIso: bool
DrawVIso: bool
Deflection: float
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
		static void Add(std::ostream &OutValue, const opencascade::handle<BRepAdaptor_Surface> & aFace, const Standard_Boolean DrawUIso, const Standard_Boolean DrawVIso, const Standard_Real Deflection, const Standard_Integer NBUiso, const Standard_Integer NBViso, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****************** AddUIso ******************/
		/**** md5 signature: 4aee442358ca971c2da6856dad976df1 ****/
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

		/****************** AddVIso ******************/
		/**** md5 signature: ef51abaf211cf460780b49e6f72a0132 ****/
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
		/****************** Add ******************/
		/**** md5 signature: 6853d47fdcd987a19eaa45ce2ad05bc1 ****/
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
		/****************** Add ******************/
		/**** md5 signature: 13df692750a7fcf225b5286ed599cc3e ****/
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

		/****************** Add ******************/
		/**** md5 signature: b4d3ff4ee1870e7fad0600d75e3d4ecf ****/
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
		static void Add(std::ostream &OutValue, const opencascade::handle<BRepAdaptor_Surface> & aFace, const Standard_Boolean DrawUIso, const Standard_Boolean DrawVIso, const Standard_Integer NBUiso, const Standard_Integer NBViso, const opencascade::handle<VrmlConverter_Drawer> & aDrawer);

		/****************** AddUIso ******************/
		/**** md5 signature: 4aee442358ca971c2da6856dad976df1 ****/
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

		/****************** AddVIso ******************/
		/**** md5 signature: ef51abaf211cf460780b49e6f72a0132 ****/
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
		/****************** Add ******************/
		/**** md5 signature: 6853d47fdcd987a19eaa45ce2ad05bc1 ****/
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
		/****************** VrmlConverter_IsoAspect ******************/
		/**** md5 signature: 5ce8db721ef68b19958f2b6a85831caf ****/
		%feature("compactdefaultargs") VrmlConverter_IsoAspect;
		%feature("autodoc", "Return
-------
None

Description
-----------
Create a default isoaspect. default value: mynumber - 10.
") VrmlConverter_IsoAspect;
		 VrmlConverter_IsoAspect();

		/****************** VrmlConverter_IsoAspect ******************/
		/**** md5 signature: 4f28b906a0c1712120192c48573ca260 ****/
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
		 VrmlConverter_IsoAspect(const opencascade::handle<Vrml_Material> & aMaterial, const Standard_Boolean OnOff, const Standard_Integer aNumber);

		/****************** Number ******************/
		/**** md5 signature: 0049d1350ba9feffbbe0d130f3765410 ****/
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of u or v isoparametric curves drawn for a single face.
") Number;
		Standard_Integer Number();

		/****************** SetNumber ******************/
		/**** md5 signature: c030d4f4482676437e574e8c3f3bf68c ****/
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
