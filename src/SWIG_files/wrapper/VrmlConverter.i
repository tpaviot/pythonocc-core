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
%define VRMLCONVERTERDOCSTRING
"-Purpose:
Computes different kinds of presentation and converts CasCade objects
( points, curves, surfaces, shapes ... ) into nodes of VRML format
( package Vrml ), into specific geometry shapes ( AsciiText, Cone,
IndexedFaceSet, IndexedLineSet, .... ) for requested (or default) properties
of the geometry and its appearance ( Material, Normal, Texture2, ... )
and requested (or default) properties of cameras and lights ( OrthograpicCamera,
PerspectiveCamera, DirectionalLight, SpotLight ).

All requested properties of a current representation are specified
in aDrawer of Drawer class, which qualifies how the presentation
algorithms compute the presentation of a specific kind of object.
This includes for example color, maximal chordial deviation, etc... with default values.

In the result the classes of this package Add a corresponding VRML
description to anOStream.
"
%enddef
%module (package="OCC.Core", docstring=VRMLCONVERTERDOCSTRING) VrmlConverter

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
%include ../common/OccHandle.i


%include VrmlConverter_headers.i

/* typedefs */
/* end typedefs declaration */

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

%wrap_handle(VrmlConverter_Drawer)
%wrap_handle(VrmlConverter_LineAspect)
%wrap_handle(VrmlConverter_PointAspect)
%wrap_handle(VrmlConverter_Projector)
%wrap_handle(VrmlConverter_ShadingAspect)
%wrap_handle(VrmlConverter_IsoAspect)

class VrmlConverter_Curve {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the OStream the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer.

	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:param anOStream:
	:type anOStream: Standard_OStream &
	:rtype: void
") Add;
		static void Add (const Adaptor3d_Curve & aCurve,const Handle_VrmlConverter_Drawer & aDrawer,Standard_OStream & anOStream);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the OStream the drawing of the curve aCurve. The aspect is defined by LineAspect in aDrawer. The drawing will be limited between the points of parameter U1 and U2.

	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:param anOStream:
	:type anOStream: Standard_OStream &
	:rtype: void
") Add;
		static void Add (const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Handle_VrmlConverter_Drawer & aDrawer,Standard_OStream & anOStream);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the OStream the drawing of the curve aCurve. The aspect is the current aspect. The drawing will be limited between the points of parameter U1 and U2. aNbPoints defines number of points on one interval.

	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aNbPoints:
	:type aNbPoints: int
	:rtype: void
") Add;
		static void Add (const Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,Standard_OStream & anOStream,const Standard_Integer aNbPoints);
};


%extend VrmlConverter_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class VrmlConverter_DeflectionCurve {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the OStream the drawing of the curve aCurve with respect to the maximal chordial deviation defined by the drawer aDrawer. The aspect is defined by LineAspect in aDrawer.

	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,Adaptor3d_Curve & aCurve,const Handle_VrmlConverter_Drawer & aDrawer);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the OStream the drawing of the curve aCurve with respect to the maximal chordial deviation defined by the drawer aDrawer. The aspect is defined by LineAspect in aDrawer. The drawing will be limited between the points of parameter U1 and U2.

	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Handle_VrmlConverter_Drawer & aDrawer);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the OStream the drawing of the curve aCurve with respect to the maximal chordial deviation aDeflection. The aspect is the current aspect

	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDeflection:
	:type aDeflection: float
	:param aLimit:
	:type aLimit: float
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,Adaptor3d_Curve & aCurve,const Standard_Real aDeflection,const Standard_Real aLimit);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the OStream the drawing of the curve aCurve with respect to the maximal chordial deviation aDeflection. The aspect is the current aspect

	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aDeflection:
	:type aDeflection: float
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,Adaptor3d_Curve & aCurve,const Standard_Real aDeflection,const Handle_VrmlConverter_Drawer & aDrawer);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the OStream the drawing of the curve aCurve with respect to the maximal chordial deviation aDeflection. The aspect is the current aspect The drawing will be limited between the points of parameter U1 and U2.

	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param U1:
	:type U1: float
	:param U2:
	:type U2: float
	:param aDeflection:
	:type aDeflection: float
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,Adaptor3d_Curve & aCurve,const Standard_Real U1,const Standard_Real U2,const Standard_Real aDeflection);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* adds to the OStream the drawing of the curve aCurve with the array of parameters to retrieve points on curve.

	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aCurve:
	:type aCurve: Adaptor3d_Curve &
	:param aParams:
	:type aParams: Handle_TColStd_HArray1OfReal &
	:param aNbNodes:
	:type aNbNodes: int
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,const Adaptor3d_Curve & aCurve,const Handle_TColStd_HArray1OfReal & aParams,const Standard_Integer aNbNodes,const Handle_VrmlConverter_Drawer & aDrawer);
};


%extend VrmlConverter_DeflectionCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlConverter_Drawer;
class VrmlConverter_Drawer : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") VrmlConverter_Drawer;
		%feature("autodoc", "	:rtype: None
") VrmlConverter_Drawer;
		 VrmlConverter_Drawer ();
		%feature("compactdefaultargs") SetTypeOfDeflection;
		%feature("autodoc", "	* by default: TOD_Relative; however, except for the shapes, the drawing will be made using the absolute deviation.

	:param aTypeOfDeflection:
	:type aTypeOfDeflection: Aspect_TypeOfDeflection
	:rtype: None
") SetTypeOfDeflection;
		void SetTypeOfDeflection (const Aspect_TypeOfDeflection aTypeOfDeflection);
		%feature("compactdefaultargs") TypeOfDeflection;
		%feature("autodoc", "	:rtype: Aspect_TypeOfDeflection
") TypeOfDeflection;
		Aspect_TypeOfDeflection TypeOfDeflection ();
		%feature("compactdefaultargs") SetMaximalChordialDeviation;
		%feature("autodoc", "	* Defines the maximal chordial deviation when drawing any curve; If this value is one of the obvious parameters of methods, current value from Drawer won't be used. This value is used by: //! VrmlConverter_DeflectionCurve VrmlConverter_WFDeflectionRestrictedFace VrmlConverter_WFDeflectionShape

	:param aChordialDeviation:
	:type aChordialDeviation: Quantity_Length
	:rtype: None
") SetMaximalChordialDeviation;
		void SetMaximalChordialDeviation (const Quantity_Length aChordialDeviation);
		%feature("compactdefaultargs") MaximalChordialDeviation;
		%feature("autodoc", "	* returns the maximal chordial deviation. Default value: 0.1

	:rtype: Quantity_Length
") MaximalChordialDeviation;
		Quantity_Length MaximalChordialDeviation ();
		%feature("compactdefaultargs") SetDeviationCoefficient;
		%feature("autodoc", "	* default 0.001

	:param aCoefficient:
	:type aCoefficient: float
	:rtype: None
") SetDeviationCoefficient;
		void SetDeviationCoefficient (const Standard_Real aCoefficient);
		%feature("compactdefaultargs") DeviationCoefficient;
		%feature("autodoc", "	:rtype: float
") DeviationCoefficient;
		Standard_Real DeviationCoefficient ();
		%feature("compactdefaultargs") SetDiscretisation;
		%feature("autodoc", "	* default: 17 points. Defines the Discretisation (myNbPoints) when drawing any curve; If this value is one of the obvious parameters of methods, current value from Drawer won't be used. This value is used by: //! VrmlConverter_Curve VrmlConverter_WFRestrictedFace VrmlConverter_WFShape

	:param d:
	:type d: int
	:rtype: None
") SetDiscretisation;
		void SetDiscretisation (const Standard_Integer d);
		%feature("compactdefaultargs") Discretisation;
		%feature("autodoc", "	:rtype: int
") Discretisation;
		Standard_Integer Discretisation ();
		%feature("compactdefaultargs") SetMaximalParameterValue;
		%feature("autodoc", "	* defines the maximum value allowed for the first and last parameters of an infinite curve. Default value: 500. VrmlConverter_Curve VrmlConverter_WFRestrictedFace VrmlConverter_WFShape

	:param Value:
	:type Value: float
	:rtype: None
") SetMaximalParameterValue;
		void SetMaximalParameterValue (const Standard_Real Value);
		%feature("compactdefaultargs") MaximalParameterValue;
		%feature("autodoc", "	:rtype: float
") MaximalParameterValue;
		Standard_Real MaximalParameterValue ();
		%feature("compactdefaultargs") SetIsoOnPlane;
		%feature("autodoc", "	* enables the drawing of isos on planes. By default there are no isos on planes.

	:param OnOff:
	:type OnOff: bool
	:rtype: None
") SetIsoOnPlane;
		void SetIsoOnPlane (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") IsoOnPlane;
		%feature("autodoc", "	* returns True if the drawing of isos on planes is enabled.

	:rtype: bool
") IsoOnPlane;
		Standard_Boolean IsoOnPlane ();
		%feature("compactdefaultargs") UIsoAspect;
		%feature("autodoc", "	* Defines the attributes which are used when drawing an U isoparametric curve of a face. Defines the number of U isoparametric curves to be drawn for a single face. The default values are the same default values from Vrml package. //! These attributes are used by the following algorithms: VrmlConverter_WFRestrictedFace VrmlConverter_WFDeflectionRestrictedFace

	:rtype: Handle_VrmlConverter_IsoAspect
") UIsoAspect;
		Handle_VrmlConverter_IsoAspect UIsoAspect ();
		%feature("compactdefaultargs") SetUIsoAspect;
		%feature("autodoc", "	:param anAspect:
	:type anAspect: Handle_VrmlConverter_IsoAspect &
	:rtype: None
") SetUIsoAspect;
		void SetUIsoAspect (const Handle_VrmlConverter_IsoAspect & anAspect);
		%feature("compactdefaultargs") VIsoAspect;
		%feature("autodoc", "	* Defines the attributes which are used when drawing an V isoparametric curve of a face. Defines the number of V isoparametric curves to be drawn for a single face. The default values are the same default values from Vrml package. //! These attributes are used by the following algorithms: VrmlConverter_WFRestrictedFace VrmlConverter_WFDeflectionRestrictedFace

	:rtype: Handle_VrmlConverter_IsoAspect
") VIsoAspect;
		Handle_VrmlConverter_IsoAspect VIsoAspect ();
		%feature("compactdefaultargs") SetVIsoAspect;
		%feature("autodoc", "	:param anAspect:
	:type anAspect: Handle_VrmlConverter_IsoAspect &
	:rtype: None
") SetVIsoAspect;
		void SetVIsoAspect (const Handle_VrmlConverter_IsoAspect & anAspect);
		%feature("compactdefaultargs") FreeBoundaryAspect;
		%feature("autodoc", "	* The default values are the same default values from Vrml package. These attributes are used by the following algorithms: VrmlConverter_WFShape VrmlConverter_WFDeflectionShape

	:rtype: Handle_VrmlConverter_LineAspect
") FreeBoundaryAspect;
		Handle_VrmlConverter_LineAspect FreeBoundaryAspect ();
		%feature("compactdefaultargs") SetFreeBoundaryAspect;
		%feature("autodoc", "	:param anAspect:
	:type anAspect: Handle_VrmlConverter_LineAspect &
	:rtype: None
") SetFreeBoundaryAspect;
		void SetFreeBoundaryAspect (const Handle_VrmlConverter_LineAspect & anAspect);
		%feature("compactdefaultargs") SetFreeBoundaryDraw;
		%feature("autodoc", "	* enables the drawing the free boundaries By default the free boundaries are drawn.

	:param OnOff:
	:type OnOff: bool
	:rtype: None
") SetFreeBoundaryDraw;
		void SetFreeBoundaryDraw (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") FreeBoundaryDraw;
		%feature("autodoc", "	* returns True if the drawing of the free boundaries is enabled.

	:rtype: bool
") FreeBoundaryDraw;
		Standard_Boolean FreeBoundaryDraw ();
		%feature("compactdefaultargs") WireAspect;
		%feature("autodoc", "	* The default values are the same default values from Vrml package. These attributes are used by the following algorithms: VrmlConverter_WFShape VrmlConverter_WFDeflectionShape

	:rtype: Handle_VrmlConverter_LineAspect
") WireAspect;
		Handle_VrmlConverter_LineAspect WireAspect ();
		%feature("compactdefaultargs") SetWireAspect;
		%feature("autodoc", "	:param anAspect:
	:type anAspect: Handle_VrmlConverter_LineAspect &
	:rtype: None
") SetWireAspect;
		void SetWireAspect (const Handle_VrmlConverter_LineAspect & anAspect);
		%feature("compactdefaultargs") SetWireDraw;
		%feature("autodoc", "	* enables the drawing the wire By default the wire are drawn.

	:param OnOff:
	:type OnOff: bool
	:rtype: None
") SetWireDraw;
		void SetWireDraw (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") WireDraw;
		%feature("autodoc", "	* returns True if the drawing of the wire is enabled.

	:rtype: bool
") WireDraw;
		Standard_Boolean WireDraw ();
		%feature("compactdefaultargs") UnFreeBoundaryAspect;
		%feature("autodoc", "	* The default values are the same default values from Vrml package. These attributes are used by the following algorithms: VrmlConverter_WFShape VrmlConverter_WFDeflectionShape

	:rtype: Handle_VrmlConverter_LineAspect
") UnFreeBoundaryAspect;
		Handle_VrmlConverter_LineAspect UnFreeBoundaryAspect ();
		%feature("compactdefaultargs") SetUnFreeBoundaryAspect;
		%feature("autodoc", "	:param anAspect:
	:type anAspect: Handle_VrmlConverter_LineAspect &
	:rtype: None
") SetUnFreeBoundaryAspect;
		void SetUnFreeBoundaryAspect (const Handle_VrmlConverter_LineAspect & anAspect);
		%feature("compactdefaultargs") SetUnFreeBoundaryDraw;
		%feature("autodoc", "	* enables the drawing the unfree boundaries By default the unfree boundaries are drawn.

	:param OnOff:
	:type OnOff: bool
	:rtype: None
") SetUnFreeBoundaryDraw;
		void SetUnFreeBoundaryDraw (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") UnFreeBoundaryDraw;
		%feature("autodoc", "	* returns True if the drawing of the unfree boundaries is enabled.

	:rtype: bool
") UnFreeBoundaryDraw;
		Standard_Boolean UnFreeBoundaryDraw ();
		%feature("compactdefaultargs") LineAspect;
		%feature("autodoc", "	* The default values are the same default values from Vrml package.

	:rtype: Handle_VrmlConverter_LineAspect
") LineAspect;
		Handle_VrmlConverter_LineAspect LineAspect ();
		%feature("compactdefaultargs") SetLineAspect;
		%feature("autodoc", "	:param anAspect:
	:type anAspect: Handle_VrmlConverter_LineAspect &
	:rtype: None
") SetLineAspect;
		void SetLineAspect (const Handle_VrmlConverter_LineAspect & anAspect);
		%feature("compactdefaultargs") PointAspect;
		%feature("autodoc", "	:rtype: Handle_VrmlConverter_PointAspect
") PointAspect;
		Handle_VrmlConverter_PointAspect PointAspect ();
		%feature("compactdefaultargs") SetPointAspect;
		%feature("autodoc", "	:param anAspect:
	:type anAspect: Handle_VrmlConverter_PointAspect &
	:rtype: None
") SetPointAspect;
		void SetPointAspect (const Handle_VrmlConverter_PointAspect & anAspect);
		%feature("compactdefaultargs") ShadingAspect;
		%feature("autodoc", "	* The default values are the same default values from Vrml package.

	:rtype: Handle_VrmlConverter_ShadingAspect
") ShadingAspect;
		Handle_VrmlConverter_ShadingAspect ShadingAspect ();
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "	:param anAspect:
	:type anAspect: Handle_VrmlConverter_ShadingAspect &
	:rtype: None
") SetShadingAspect;
		void SetShadingAspect (const Handle_VrmlConverter_ShadingAspect & anAspect);
		%feature("compactdefaultargs") DrawHiddenLine;
		%feature("autodoc", "	* returns Standard_True if the hidden lines are to be drawn. By default the hidden lines are not drawn.

	:rtype: bool
") DrawHiddenLine;
		Standard_Boolean DrawHiddenLine ();
		%feature("compactdefaultargs") EnableDrawHiddenLine;
		%feature("autodoc", "	* sets DrawHiddenLine = Standard_True - the hidden lines are drawn.

	:rtype: None
") EnableDrawHiddenLine;
		void EnableDrawHiddenLine ();
		%feature("compactdefaultargs") DisableDrawHiddenLine;
		%feature("autodoc", "	* sets DrawHiddenLine = Standard_False - the hidden lines are not drawn.

	:rtype: None
") DisableDrawHiddenLine;
		void DisableDrawHiddenLine ();
		%feature("compactdefaultargs") HiddenLineAspect;
		%feature("autodoc", "	* returns LineAspect for the hidden lines. The default values are the same default values from Vrml package.

	:rtype: Handle_VrmlConverter_LineAspect
") HiddenLineAspect;
		Handle_VrmlConverter_LineAspect HiddenLineAspect ();
		%feature("compactdefaultargs") SetHiddenLineAspect;
		%feature("autodoc", "	* sets LineAspect for the hidden lines.

	:param anAspect:
	:type anAspect: Handle_VrmlConverter_LineAspect &
	:rtype: None
") SetHiddenLineAspect;
		void SetHiddenLineAspect (const Handle_VrmlConverter_LineAspect & anAspect);
		%feature("compactdefaultargs") SeenLineAspect;
		%feature("autodoc", "	* returns LineAspect for the seen lines. The default values are the same default values from Vrml package.

	:rtype: Handle_VrmlConverter_LineAspect
") SeenLineAspect;
		Handle_VrmlConverter_LineAspect SeenLineAspect ();
		%feature("compactdefaultargs") SetSeenLineAspect;
		%feature("autodoc", "	* sets LineAspect for the seen lines.

	:param anAspect:
	:type anAspect: Handle_VrmlConverter_LineAspect &
	:rtype: None
") SetSeenLineAspect;
		void SetSeenLineAspect (const Handle_VrmlConverter_LineAspect & anAspect);
};


%make_alias(VrmlConverter_Drawer)

%extend VrmlConverter_Drawer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class VrmlConverter_HLRShape {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:param aProjector:
	:type aProjector: Handle_VrmlConverter_Projector &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,const TopoDS_Shape & aShape,const Handle_VrmlConverter_Drawer & aDrawer,const Handle_VrmlConverter_Projector & aProjector);
};


%extend VrmlConverter_HLRShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlConverter_LineAspect;
class VrmlConverter_LineAspect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") VrmlConverter_LineAspect;
		%feature("autodoc", "	* create a default LineAspect. Default value: HasMaterial = False - a line hasn't own material (color)

	:rtype: None
") VrmlConverter_LineAspect;
		 VrmlConverter_LineAspect ();
		%feature("compactdefaultargs") VrmlConverter_LineAspect;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:param OnOff:
	:type OnOff: bool
	:rtype: None
") VrmlConverter_LineAspect;
		 VrmlConverter_LineAspect (const Handle_Vrml_Material & aMaterial,const Standard_Boolean OnOff);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:rtype: None
") SetMaterial;
		void SetMaterial (const Handle_Vrml_Material & aMaterial);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") Material;
		Handle_Vrml_Material Material ();
		%feature("compactdefaultargs") SetHasMaterial;
		%feature("autodoc", "	* defines the necessary of writing own Material from Vrml into output OStream. By default False - the material is not writing into OStream, True - the material is writing.

	:param OnOff:
	:type OnOff: bool
	:rtype: None
") SetHasMaterial;
		void SetHasMaterial (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "	* returns True if the materials is writing into OStream.

	:rtype: bool
") HasMaterial;
		Standard_Boolean HasMaterial ();
};


%make_alias(VrmlConverter_LineAspect)

%extend VrmlConverter_LineAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlConverter_PointAspect;
class VrmlConverter_PointAspect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") VrmlConverter_PointAspect;
		%feature("autodoc", "	* create a default PointAspect. Default value: HasMaterial = False - a line hasn't own material (color)

	:rtype: None
") VrmlConverter_PointAspect;
		 VrmlConverter_PointAspect ();
		%feature("compactdefaultargs") VrmlConverter_PointAspect;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:param OnOff:
	:type OnOff: bool
	:rtype: None
") VrmlConverter_PointAspect;
		 VrmlConverter_PointAspect (const Handle_Vrml_Material & aMaterial,const Standard_Boolean OnOff);
		%feature("compactdefaultargs") SetMaterial;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:rtype: None
") SetMaterial;
		void SetMaterial (const Handle_Vrml_Material & aMaterial);
		%feature("compactdefaultargs") Material;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") Material;
		Handle_Vrml_Material Material ();
		%feature("compactdefaultargs") SetHasMaterial;
		%feature("autodoc", "	* defines the necessary of writing own Material from Vrml into output OStream. By default False - the material is not writing into OStream, True - the material is writing.

	:param OnOff:
	:type OnOff: bool
	:rtype: None
") SetHasMaterial;
		void SetHasMaterial (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "	* returns True if the materials is writing into OStream.

	:rtype: bool
") HasMaterial;
		Standard_Boolean HasMaterial ();
};


%make_alias(VrmlConverter_PointAspect)

%extend VrmlConverter_PointAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlConverter_Projector;
class VrmlConverter_Projector : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") VrmlConverter_Projector;
		%feature("autodoc", "	:param Shapes:
	:type Shapes: TopTools_Array1OfShape &
	:param Focus:
	:type Focus: Quantity_Length
	:param DX:
	:type DX: Quantity_Length
	:param DY:
	:type DY: Quantity_Length
	:param DZ:
	:type DZ: Quantity_Length
	:param XUp:
	:type XUp: Quantity_Length
	:param YUp:
	:type YUp: Quantity_Length
	:param ZUp:
	:type ZUp: Quantity_Length
	:param Camera: default value is VrmlConverter_NoCamera
	:type Camera: VrmlConverter_TypeOfCamera
	:param Light: default value is VrmlConverter_NoLight
	:type Light: VrmlConverter_TypeOfLight
	:rtype: None
") VrmlConverter_Projector;
		 VrmlConverter_Projector (const TopTools_Array1OfShape & Shapes,const Quantity_Length Focus,const Quantity_Length DX,const Quantity_Length DY,const Quantity_Length DZ,const Quantity_Length XUp,const Quantity_Length YUp,const Quantity_Length ZUp,const VrmlConverter_TypeOfCamera Camera = VrmlConverter_NoCamera,const VrmlConverter_TypeOfLight Light = VrmlConverter_NoLight);
		%feature("compactdefaultargs") SetCamera;
		%feature("autodoc", "	:param aCamera:
	:type aCamera: VrmlConverter_TypeOfCamera
	:rtype: None
") SetCamera;
		void SetCamera (const VrmlConverter_TypeOfCamera aCamera);
		%feature("compactdefaultargs") Camera;
		%feature("autodoc", "	:rtype: VrmlConverter_TypeOfCamera
") Camera;
		VrmlConverter_TypeOfCamera Camera ();
		%feature("compactdefaultargs") SetLight;
		%feature("autodoc", "	:param aLight:
	:type aLight: VrmlConverter_TypeOfLight
	:rtype: None
") SetLight;
		void SetLight (const VrmlConverter_TypeOfLight aLight);
		%feature("compactdefaultargs") Light;
		%feature("autodoc", "	:rtype: VrmlConverter_TypeOfLight
") Light;
		VrmlConverter_TypeOfLight Light ();

        %feature("autodoc", "1");
        %extend{
            std::string AddToString() {
            std::stringstream s;
            self->Add(s);
            return s.str();}
        };
        		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "	:rtype: HLRAlgo_Projector
") Projector;
		HLRAlgo_Projector Projector ();
};


%make_alias(VrmlConverter_Projector)

%extend VrmlConverter_Projector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class VrmlConverter_ShadedShape {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,const TopoDS_Shape & aShape,const Handle_VrmlConverter_Drawer & aDrawer);
		%feature("compactdefaultargs") ComputeNormal;
		%feature("autodoc", "	:param aFace:
	:type aFace: TopoDS_Face &
	:param pc:
	:type pc: Poly_Connect &
	:param Nor:
	:type Nor: TColgp_Array1OfDir
	:rtype: void
") ComputeNormal;
		static void ComputeNormal (const TopoDS_Face & aFace,Poly_Connect & pc,TColgp_Array1OfDir & Nor);
};


%extend VrmlConverter_ShadedShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlConverter_ShadingAspect;
class VrmlConverter_ShadingAspect : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") VrmlConverter_ShadingAspect;
		%feature("autodoc", "	* create a default ShadingAspect.

	:rtype: None
") VrmlConverter_ShadingAspect;
		 VrmlConverter_ShadingAspect ();
		%feature("compactdefaultargs") SetFrontMaterial;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:rtype: None
") SetFrontMaterial;
		void SetFrontMaterial (const Handle_Vrml_Material & aMaterial);
		%feature("compactdefaultargs") FrontMaterial;
		%feature("autodoc", "	:rtype: Handle_Vrml_Material
") FrontMaterial;
		Handle_Vrml_Material FrontMaterial ();
		%feature("compactdefaultargs") SetShapeHints;
		%feature("autodoc", "	:param aShapeHints:
	:type aShapeHints: Vrml_ShapeHints &
	:rtype: None
") SetShapeHints;
		void SetShapeHints (const Vrml_ShapeHints & aShapeHints);
		%feature("compactdefaultargs") ShapeHints;
		%feature("autodoc", "	:rtype: Vrml_ShapeHints
") ShapeHints;
		Vrml_ShapeHints ShapeHints ();
		%feature("compactdefaultargs") SetHasNormals;
		%feature("autodoc", "	* defines necessary of a calculation of normals for ShadedShape to more accurately display curved surfaces, pacticularly when smoooth or phong shading is used in VRML viewer. By default False - the normals are not calculated, True - the normals are calculated. Warning: If normals are calculated the resulting VRML file will be substantially lager.

	:param OnOff:
	:type OnOff: bool
	:rtype: None
") SetHasNormals;
		void SetHasNormals (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") HasNormals;
		%feature("autodoc", "	* returns True if the normals are calculating

	:rtype: bool
") HasNormals;
		Standard_Boolean HasNormals ();
		%feature("compactdefaultargs") SetHasMaterial;
		%feature("autodoc", "	* defines necessary of writing Material from Vrml into output OStream. By default False - the material is not writing into OStream, True - the material is writing.

	:param OnOff:
	:type OnOff: bool
	:rtype: None
") SetHasMaterial;
		void SetHasMaterial (const Standard_Boolean OnOff);
		%feature("compactdefaultargs") HasMaterial;
		%feature("autodoc", "	* returns True if the materials is writing into OStream.

	:rtype: bool
") HasMaterial;
		Standard_Boolean HasMaterial ();
};


%make_alias(VrmlConverter_ShadingAspect)

%extend VrmlConverter_ShadingAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class VrmlConverter_WFDeflectionRestrictedFace {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,const Handle_BRepAdaptor_HSurface & aFace,const Handle_VrmlConverter_Drawer & aDrawer);
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") AddUIso;
		static void AddUIso (Standard_OStream & anOStream,const Handle_BRepAdaptor_HSurface & aFace,const Handle_VrmlConverter_Drawer & aDrawer);
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") AddVIso;
		static void AddVIso (Standard_OStream & anOStream,const Handle_BRepAdaptor_HSurface & aFace,const Handle_VrmlConverter_Drawer & aDrawer);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param DrawUIso:
	:type DrawUIso: bool
	:param DrawVIso:
	:type DrawVIso: bool
	:param Deflection:
	:type Deflection: Quantity_Length
	:param NBUiso:
	:type NBUiso: int
	:param NBViso:
	:type NBViso: int
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,const Handle_BRepAdaptor_HSurface & aFace,const Standard_Boolean DrawUIso,const Standard_Boolean DrawVIso,const Quantity_Length Deflection,const Standard_Integer NBUiso,const Standard_Integer NBViso,const Handle_VrmlConverter_Drawer & aDrawer);
};


%extend VrmlConverter_WFDeflectionRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class VrmlConverter_WFDeflectionShape {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,const TopoDS_Shape & aShape,const Handle_VrmlConverter_Drawer & aDrawer);
};


%extend VrmlConverter_WFDeflectionShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class VrmlConverter_WFRestrictedFace {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,const Handle_BRepAdaptor_HSurface & aFace,const Handle_VrmlConverter_Drawer & aDrawer);
		%feature("compactdefaultargs") AddUIso;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") AddUIso;
		static void AddUIso (Standard_OStream & anOStream,const Handle_BRepAdaptor_HSurface & aFace,const Handle_VrmlConverter_Drawer & aDrawer);
		%feature("compactdefaultargs") AddVIso;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") AddVIso;
		static void AddVIso (Standard_OStream & anOStream,const Handle_BRepAdaptor_HSurface & aFace,const Handle_VrmlConverter_Drawer & aDrawer);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aFace:
	:type aFace: Handle_BRepAdaptor_HSurface &
	:param DrawUIso:
	:type DrawUIso: bool
	:param DrawVIso:
	:type DrawVIso: bool
	:param NBUiso:
	:type NBUiso: int
	:param NBViso:
	:type NBViso: int
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,const Handle_BRepAdaptor_HSurface & aFace,const Standard_Boolean DrawUIso,const Standard_Boolean DrawVIso,const Standard_Integer NBUiso,const Standard_Integer NBViso,const Handle_VrmlConverter_Drawer & aDrawer);
};


%extend VrmlConverter_WFRestrictedFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class VrmlConverter_WFShape {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param anOStream:
	:type anOStream: Standard_OStream &
	:param aShape:
	:type aShape: TopoDS_Shape &
	:param aDrawer:
	:type aDrawer: Handle_VrmlConverter_Drawer &
	:rtype: void
") Add;
		static void Add (Standard_OStream & anOStream,const TopoDS_Shape & aShape,const Handle_VrmlConverter_Drawer & aDrawer);
};


%extend VrmlConverter_WFShape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor VrmlConverter_IsoAspect;
class VrmlConverter_IsoAspect : public VrmlConverter_LineAspect {
	public:
		%feature("compactdefaultargs") VrmlConverter_IsoAspect;
		%feature("autodoc", "	* create a default IsoAspect. Default value: myNumber - 10.

	:rtype: None
") VrmlConverter_IsoAspect;
		 VrmlConverter_IsoAspect ();
		%feature("compactdefaultargs") VrmlConverter_IsoAspect;
		%feature("autodoc", "	:param aMaterial:
	:type aMaterial: Handle_Vrml_Material &
	:param OnOff:
	:type OnOff: bool
	:param aNumber:
	:type aNumber: int
	:rtype: None
") VrmlConverter_IsoAspect;
		 VrmlConverter_IsoAspect (const Handle_Vrml_Material & aMaterial,const Standard_Boolean OnOff,const Standard_Integer aNumber);
		%feature("compactdefaultargs") SetNumber;
		%feature("autodoc", "	:param aNumber:
	:type aNumber: int
	:rtype: None
") SetNumber;
		void SetNumber (const Standard_Integer aNumber);
		%feature("compactdefaultargs") Number;
		%feature("autodoc", "	* returns the number of U or V isoparametric curves drawn for a single face.

	:rtype: int
") Number;
		Standard_Integer Number ();
};


%make_alias(VrmlConverter_IsoAspect)

%extend VrmlConverter_IsoAspect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
