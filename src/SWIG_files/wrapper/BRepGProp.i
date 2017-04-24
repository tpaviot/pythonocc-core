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
%module (package="OCC") BRepGProp

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


%include BRepGProp_headers.i


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
/* end public enums declaration */

%rename(brepgprop) BRepGProp;
class BRepGProp {
	public:
		%feature("compactdefaultargs") LinearProperties;
		%feature("autodoc", "	* Computes the linear global properties of the shape S, i.e. the global properties induced by each edge of the shape S, and brings them together with the global properties still retained by the framework LProps. If the current system of LProps was empty, its global properties become equal to the linear global properties of S. For this computation no linear density is attached to the edges. So, for example, the added mass corresponds to the sum of the lengths of the edges of S. The density of the composed systems, i.e. that of each component of the current system of LProps, and that of S which is considered to be equal to 1, must be coherent. Note that this coherence cannot be checked. You are advised to use a separate framework for each density, and then to bring these frameworks together into a global one. The point relative to which the inertia of the system is computed is the reference point of the framework LProps. Note: if your programming ensures that the framework LProps retains only linear global properties (brought together for example, by the function LinearProperties) for objects the density of which is equal to 1 (or is not defined), the function Mass will return the total length of edges of the system analysed by LProps. Warning No check is performed to verify that the shape S retains truly linear properties. If S is simply a vertex, it is not considered to present any additional global properties.

	:param S:
	:type S: TopoDS_Shape &
	:param LProps:
	:type LProps: GProp_GProps &
	:rtype: void
") LinearProperties;
		static void LinearProperties (const TopoDS_Shape & S,GProp_GProps & LProps);
		%feature("compactdefaultargs") SurfaceProperties;
		%feature("autodoc", "	* Computes the surface global properties of the shape S, i.e. the global properties induced by each face of the shape S, and brings them together with the global properties still retained by the framework SProps. If the current system of SProps was empty, its global properties become equal to the surface global properties of S. For this computation, no surface density is attached to the faces. Consequently, the added mass corresponds to the sum of the areas of the faces of S. The density of the component systems, i.e. that of each component of the current system of SProps, and that of S which is considered to be equal to 1, must be coherent. Note that this coherence cannot be checked. You are advised to use a framework for each different value of density, and then to bring these frameworks together into a global one. The point relative to which the inertia of the system is computed is the reference point of the framework SProps. Note : if your programming ensures that the framework SProps retains only surface global properties, brought together, for example, by the function SurfaceProperties, for objects the density of which is equal to 1 (or is not defined), the function Mass will return the total area of faces of the system analysed by SProps. Warning No check is performed to verify that the shape S retains truly surface properties. If S is simply a vertex, an edge or a wire, it is not considered to present any additional global properties.

	:param S:
	:type S: TopoDS_Shape &
	:param SProps:
	:type SProps: GProp_GProps &
	:rtype: void
") SurfaceProperties;
		static void SurfaceProperties (const TopoDS_Shape & S,GProp_GProps & SProps);
		%feature("compactdefaultargs") SurfaceProperties;
		%feature("autodoc", "	* Updates <SProps> with the shape <S>, that contains its pricipal properties. The surface properties of all the faces in <S> are computed. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (area) for each face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. Method returns estimation of relative error reached for whole shape. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration. //! Computes the global volume properties of the solid S, and brings them together with the global properties still retained by the framework VProps. If the current system of VProps was empty, its global properties become equal to the global properties of S for volume. For this computation, no volume density is attached to the solid. Consequently, the added mass corresponds to the volume of S. The density of the component systems, i.e. that of each component of the current system of VProps, and that of S which is considered to be equal to 1, must be coherent to each other. Note that this coherence cannot be checked. You are advised to use a separate framework for each density, and then to bring these frameworks together into a global one. The point relative to which the inertia of the system is computed is the reference point of the framework VProps. Note: if your programming ensures that the framework VProps retains only global properties of volume (brought together for example, by the function VolumeProperties) for objects the density of which is equal to 1 (or is not defined), the function Mass will return the total volume of the solids of the system analysed by VProps. Warning The shape S must represent an object whose global volume properties can be computed. It may be a finite solid, or a series of finite solids all oriented in a coherent way. Nonetheless, S must be exempt of any free boundary. Note that these conditions of coherence are not checked by this algorithm, and results will be false if they are not respected.

	:param S:
	:type S: TopoDS_Shape &
	:param SProps:
	:type SProps: GProp_GProps &
	:param Eps:
	:type Eps: float
	:rtype: float
") SurfaceProperties;
		static Standard_Real SurfaceProperties (const TopoDS_Shape & S,GProp_GProps & SProps,const Standard_Real Eps);
		%feature("compactdefaultargs") VolumeProperties;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param VProps:
	:type VProps: GProp_GProps &
	:param OnlyClosed: default value is Standard_False
	:type OnlyClosed: bool
	:rtype: void
") VolumeProperties;
		static void VolumeProperties (const TopoDS_Shape & S,GProp_GProps & VProps,const Standard_Boolean OnlyClosed = Standard_False);
		%feature("compactdefaultargs") VolumeProperties;
		%feature("autodoc", "	* Updates <VProps> with the shape <S>, that contains its pricipal properties. The volume properties of all the FORWARD and REVERSED faces in <S> are computed. If OnlyClosed is True then computed faces must belong to closed Shells. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for each face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. Method returns estimation of relative error reached for whole shape. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.

	:param S:
	:type S: TopoDS_Shape &
	:param VProps:
	:type VProps: GProp_GProps &
	:param Eps:
	:type Eps: float
	:param OnlyClosed: default value is Standard_False
	:type OnlyClosed: bool
	:rtype: float
") VolumeProperties;
		static Standard_Real VolumeProperties (const TopoDS_Shape & S,GProp_GProps & VProps,const Standard_Real Eps,const Standard_Boolean OnlyClosed = Standard_False);
		%feature("compactdefaultargs") VolumePropertiesGK;
		%feature("autodoc", "	* Updates <VProps> with the shape <S>, that contains its pricipal properties. The volume properties of all the FORWARD and REVERSED faces in <S> are computed. If OnlyClosed is True then computed faces must belong to closed Shells. Adaptive 2D Gauss integration is used. Parameter IsUseSpan says if it is necessary to define spans on a face. This option has an effect only for BSpline faces. Parameter Eps sets maximal relative error of computed property for each face. Error is delivered by the adaptive Gauss-Kronrod method of integral computation that is used for properties computation. Method returns estimation of relative error reached for whole shape. Returns negative value if the computation is failed.

	:param S:
	:type S: TopoDS_Shape &
	:param VProps:
	:type VProps: GProp_GProps &
	:param Eps: default value is 0.001
	:type Eps: float
	:param OnlyClosed: default value is Standard_False
	:type OnlyClosed: bool
	:param IsUseSpan: default value is Standard_False
	:type IsUseSpan: bool
	:param CGFlag: default value is Standard_False
	:type CGFlag: bool
	:param IFlag: default value is Standard_False
	:type IFlag: bool
	:rtype: float
") VolumePropertiesGK;
		static Standard_Real VolumePropertiesGK (const TopoDS_Shape & S,GProp_GProps & VProps,const Standard_Real Eps = 0.001,const Standard_Boolean OnlyClosed = Standard_False,const Standard_Boolean IsUseSpan = Standard_False,const Standard_Boolean CGFlag = Standard_False,const Standard_Boolean IFlag = Standard_False);
		%feature("compactdefaultargs") VolumePropertiesGK;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:param VProps:
	:type VProps: GProp_GProps &
	:param thePln:
	:type thePln: gp_Pln
	:param Eps: default value is 0.001
	:type Eps: float
	:param OnlyClosed: default value is Standard_False
	:type OnlyClosed: bool
	:param IsUseSpan: default value is Standard_False
	:type IsUseSpan: bool
	:param CGFlag: default value is Standard_False
	:type CGFlag: bool
	:param IFlag: default value is Standard_False
	:type IFlag: bool
	:rtype: float
") VolumePropertiesGK;
		static Standard_Real VolumePropertiesGK (const TopoDS_Shape & S,GProp_GProps & VProps,const gp_Pln & thePln,const Standard_Real Eps = 0.001,const Standard_Boolean OnlyClosed = Standard_False,const Standard_Boolean IsUseSpan = Standard_False,const Standard_Boolean CGFlag = Standard_False,const Standard_Boolean IFlag = Standard_False);
};


%extend BRepGProp {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepGProp_Cinert;
class BRepGProp_Cinert : public GProp_GProps {
	public:
		%feature("compactdefaultargs") BRepGProp_Cinert;
		%feature("autodoc", "	:rtype: None
") BRepGProp_Cinert;
		 BRepGProp_Cinert ();
		%feature("compactdefaultargs") BRepGProp_Cinert;
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:param CLocation:
	:type CLocation: gp_Pnt
	:rtype: None
") BRepGProp_Cinert;
		 BRepGProp_Cinert (const BRepAdaptor_Curve & C,const gp_Pnt & CLocation);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param CLocation:
	:type CLocation: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & CLocation);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: None
") Perform;
		void Perform (const BRepAdaptor_Curve & C);
};


%extend BRepGProp_Cinert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepGProp_Domain;
class BRepGProp_Domain {
	public:
		%feature("compactdefaultargs") BRepGProp_Domain;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") BRepGProp_Domain;
		 BRepGProp_Domain ();
		%feature("compactdefaultargs") BRepGProp_Domain;
		%feature("autodoc", "	* Constructor. Initializes the domain with the face.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") BRepGProp_Domain;
		 BRepGProp_Domain (const TopoDS_Face & F);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the domain with the face.

	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F);
		%feature("compactdefaultargs") More;
		%feature("autodoc", "	* Returns True if there is another arc of curve in the list.

	:rtype: bool
") More;
		Standard_Boolean More ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the exploration with the face already set.

	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the current edge.

	:rtype: TopoDS_Edge
") Value;
		const TopoDS_Edge  Value ();
		%feature("compactdefaultargs") Next;
		%feature("autodoc", "	* Sets the index of the arc iterator to the next arc of curve.

	:rtype: None
") Next;
		void Next ();
};


%extend BRepGProp_Domain {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
class BRepGProp_EdgeTool {
	public:
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* Returns the parametric value of the start point of the curve. The curve is oriented from the start point to the end point.

	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const BRepAdaptor_Curve & C);
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	* Returns the parametric value of the end point of the curve. The curve is oriented from the start point to the end point.

	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const BRepAdaptor_Curve & C);
		%feature("compactdefaultargs") IntegrationOrder;
		%feature("autodoc", "	* Returns the number of Gauss points required to do the integration with a good accuracy using the Gauss method. For a polynomial curve of degree n the maxima of accuracy is obtained with an order of integration equal to 2*n-1.

	:param C:
	:type C: BRepAdaptor_Curve &
	:rtype: int
") IntegrationOrder;
		static Standard_Integer IntegrationOrder (const BRepAdaptor_Curve & C);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point of parameter U on the loaded curve.

	:param C:
	:type C: BRepAdaptor_Curve &
	:param U:
	:type U: float
	:rtype: gp_Pnt
") Value;
		static gp_Pnt Value (const BRepAdaptor_Curve & C,const Standard_Real U);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Returns the point of parameter U and the first derivative at this point.

	:param C:
	:type C: BRepAdaptor_Curve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		static void D1 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>

	:param C:
	:type C: BRepAdaptor_Curve &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int
") NbIntervals;
		static Standard_Integer NbIntervals (const BRepAdaptor_Curve & C,const GeomAbs_Shape S);
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "	* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()

	:param C:
	:type C: BRepAdaptor_Curve &
	:param T:
	:type T: TColStd_Array1OfReal &
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void
") Intervals;
		static void Intervals (const BRepAdaptor_Curve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
};


%extend BRepGProp_EdgeTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepGProp_Face;
class BRepGProp_Face {
	public:
		%feature("compactdefaultargs") BRepGProp_Face;
		%feature("autodoc", "	* Constructor. Initializes the object with a flag IsUseSpan that says if it is necessary to define spans on a face. This option has an effect only for BSpline faces. Spans are returned by the methods GetUKnots and GetTKnots.

	:param IsUseSpan: default value is Standard_False
	:type IsUseSpan: bool
	:rtype: None
") BRepGProp_Face;
		 BRepGProp_Face (const Standard_Boolean IsUseSpan = Standard_False);
		%feature("compactdefaultargs") BRepGProp_Face;
		%feature("autodoc", "	* Constructor. Initializes the object with the face and the flag IsUseSpan that says if it is necessary to define spans on a face. This option has an effect only for BSpline faces. Spans are returned by the methods GetUKnots and GetTKnots.

	:param F:
	:type F: TopoDS_Face &
	:param IsUseSpan: default value is Standard_False
	:type IsUseSpan: bool
	:rtype: None
") BRepGProp_Face;
		 BRepGProp_Face (const TopoDS_Face & F,const Standard_Boolean IsUseSpan = Standard_False);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: None
") Load;
		void Load (const TopoDS_Face & F);
		%feature("compactdefaultargs") VIntegrationOrder;
		%feature("autodoc", "	:rtype: int
") VIntegrationOrder;
		Standard_Integer VIntegrationOrder ();
		%feature("compactdefaultargs") NaturalRestriction;
		%feature("autodoc", "	* Returns Standard_True if the face is not trimmed.

	:rtype: bool
") NaturalRestriction;
		Standard_Boolean NaturalRestriction ();
		%feature("compactdefaultargs") Value2d;
		%feature("autodoc", "	* Returns the value of the boundary curve of the face.

	:param U:
	:type U: float
	:rtype: gp_Pnt2d
") Value2d;
		gp_Pnt2d Value2d (const Standard_Real U);
		%feature("compactdefaultargs") SIntOrder;
		%feature("autodoc", "	:param Eps:
	:type Eps: float
	:rtype: int
") SIntOrder;
		Standard_Integer SIntOrder (const Standard_Real Eps);
		%feature("compactdefaultargs") SVIntSubs;
		%feature("autodoc", "	:rtype: int
") SVIntSubs;
		Standard_Integer SVIntSubs ();
		%feature("compactdefaultargs") SUIntSubs;
		%feature("autodoc", "	:rtype: int
") SUIntSubs;
		Standard_Integer SUIntSubs ();
		%feature("compactdefaultargs") UKnots;
		%feature("autodoc", "	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:rtype: None
") UKnots;
		void UKnots (TColStd_Array1OfReal & Knots);
		%feature("compactdefaultargs") VKnots;
		%feature("autodoc", "	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:rtype: None
") VKnots;
		void VKnots (TColStd_Array1OfReal & Knots);
		%feature("compactdefaultargs") LIntOrder;
		%feature("autodoc", "	:param Eps:
	:type Eps: float
	:rtype: int
") LIntOrder;
		Standard_Integer LIntOrder (const Standard_Real Eps);
		%feature("compactdefaultargs") LIntSubs;
		%feature("autodoc", "	:rtype: int
") LIntSubs;
		Standard_Integer LIntSubs ();
		%feature("compactdefaultargs") LKnots;
		%feature("autodoc", "	:param Knots:
	:type Knots: TColStd_Array1OfReal &
	:rtype: None
") LKnots;
		void LKnots (TColStd_Array1OfReal & Knots);
		%feature("compactdefaultargs") UIntegrationOrder;
		%feature("autodoc", "	* Returns the number of points required to do the integration in the U parametric direction with a good accuracy.

	:rtype: int
") UIntegrationOrder;
		Standard_Integer UIntegrationOrder ();
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "	* Returns the parametric bounds of the Face.

	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:param V1:
	:type V1: float &
	:param V2:
	:type V2: float &
	:rtype: None
") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Normal;
		%feature("autodoc", "	* Computes the point of parameter U, V on the Face <S> and the normal to the face at this point.

	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param VNor:
	:type VNor: gp_Vec
	:rtype: None
") Normal;
		void Normal (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & VNor);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Loading the boundary arc.

	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Load;
		void Load (const TopoDS_Edge & E);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* Returns the parametric value of the start point of the current arc of curve.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	* Returns the parametric value of the end point of the current arc of curve.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") IntegrationOrder;
		%feature("autodoc", "	* Returns the number of points required to do the integration along the parameter of curve.

	:rtype: int
") IntegrationOrder;
		Standard_Integer IntegrationOrder ();
		%feature("compactdefaultargs") D12d;
		%feature("autodoc", "	* Returns the point of parameter U and the first derivative at this point of a boundary curve.

	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D12d;
		void D12d (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Loading the boundary arc. This arc is either a top, bottom, left or right bound of a UV rectangle in which the parameters of surface are defined. If IsFirstParam is equal to Standard_True, the face is initialized by either left of bottom bound. Otherwise it is initialized by the top or right one. If theIsoType is equal to GeomAbs_IsoU, the face is initialized with either left or right bound. Otherwise - with either top or bottom one.

	:param IsFirstParam:
	:type IsFirstParam: bool
	:param theIsoType:
	:type theIsoType: GeomAbs_IsoType
	:rtype: None
") Load;
		void Load (const Standard_Boolean IsFirstParam,const GeomAbs_IsoType theIsoType);
		%feature("compactdefaultargs") GetUKnots;
		%feature("autodoc", "	* Returns an array of U knots of the face. The first and last elements of the array will be theUMin and theUMax. The middle elements will be the U Knots of the face greater then theUMin and lower then theUMax in increasing order. If the face is not a BSpline, the array initialized with theUMin and theUMax only.

	:param theUMin:
	:type theUMin: float
	:param theUMax:
	:type theUMax: float
	:param theUKnots:
	:type theUKnots: Handle_TColStd_HArray1OfReal &
	:rtype: None
") GetUKnots;
		void GetUKnots (const Standard_Real theUMin,const Standard_Real theUMax,Handle_TColStd_HArray1OfReal & theUKnots);
		%feature("compactdefaultargs") GetTKnots;
		%feature("autodoc", "	* Returns an array of combination of T knots of the arc and V knots of the face. The first and last elements of the array will be theTMin and theTMax. The middle elements will be the Knots of the arc and the values of parameters of arc on which the value points have V coordinates close to V knots of face. All the parameter will be greater then theTMin and lower then theTMax in increasing order. If the face is not a BSpline, the array initialized with theTMin and theTMax only.

	:param theTMin:
	:type theTMin: float
	:param theTMax:
	:type theTMax: float
	:param theTKnots:
	:type theTKnots: Handle_TColStd_HArray1OfReal &
	:rtype: None
") GetTKnots;
		void GetTKnots (const Standard_Real theTMin,const Standard_Real theTMax,Handle_TColStd_HArray1OfReal & theTKnots);
};


%extend BRepGProp_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepGProp_Gauss;
class BRepGProp_Gauss {
	public:
/* public enums */
enum BRepGProp_GaussType {
	Vinert = 0,
	Sinert = 1,
};

/* end public enums declaration */

		%feature("compactdefaultargs") BRepGProp_Gauss;
		%feature("autodoc", "	* Constructor

	:param theType:
	:type theType: BRepGProp_GaussType
	:rtype: None
") BRepGProp_Gauss;
		 BRepGProp_Gauss (const BRepGProp_GaussType theType);
};


%extend BRepGProp_Gauss {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepGProp_Sinert;
class BRepGProp_Sinert : public GProp_GProps {
	public:
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "	:rtype: None
") BRepGProp_Sinert;
		 BRepGProp_Sinert ();
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param SLocation:
	:type SLocation: gp_Pnt
	:rtype: None
") BRepGProp_Sinert;
		 BRepGProp_Sinert (const BRepGProp_Face & S,const gp_Pnt & SLocation);
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "	* Builds a Sinert to evaluate the global properties of the face <S>. If isNaturalRestriction is true the domain of S is defined with the natural bounds, else it defined with an iterator of Edge from TopoDS (see DomainTool from GProp)

	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param SLocation:
	:type SLocation: gp_Pnt
	:rtype: None
") BRepGProp_Sinert;
		 BRepGProp_Sinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & SLocation);
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param SLocation:
	:type SLocation: gp_Pnt
	:param Eps:
	:type Eps: float
	:rtype: None
") BRepGProp_Sinert;
		 BRepGProp_Sinert (BRepGProp_Face & S,const gp_Pnt & SLocation,const Standard_Real Eps);
		%feature("compactdefaultargs") BRepGProp_Sinert;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param SLocation:
	:type SLocation: gp_Pnt
	:param Eps:
	:type Eps: float
	:rtype: None
") BRepGProp_Sinert;
		 BRepGProp_Sinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & SLocation,const Standard_Real Eps);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param SLocation:
	:type SLocation: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & SLocation);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:rtype: None
") Perform;
		void Perform (const BRepGProp_Face & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:rtype: None
") Perform;
		void Perform (BRepGProp_Face & S,BRepGProp_Domain & D);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param Eps:
	:type Eps: float
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & S,const Standard_Real Eps);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param Eps:
	:type Eps: float
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const Standard_Real Eps);
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "	* If previously used method contained Eps parameter get actual relative error of the computation, else return 1.0.

	:rtype: float
") GetEpsilon;
		Standard_Real GetEpsilon ();
};


%extend BRepGProp_Sinert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepGProp_TFunction;
class BRepGProp_TFunction : public math_Function {
	public:
		%feature("compactdefaultargs") BRepGProp_TFunction;
		%feature("autodoc", "	* Constructor. Initializes the function with the face, the location point, the flag IsByPoint, the coefficients theCoeff that have different meaning depending on the value of IsByPoint. The last two parameters are theUMin - the lower bound of the inner integral. This value is fixed for any integral. And the value of tolerance of inner integral computation. If IsByPoint is equal to Standard_True, the number of the coefficients is equal to 3 and they represent X, Y and Z coordinates (theCoeff[0], theCoeff[1] and theCoeff[2] correspondingly) of the shift if the inertia is computed with respect to the point different then the location. If IsByPoint is equal to Standard_False, the number of the coefficients is 4 and they represent the compbination of plane parameters and shift values.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param theVertex:
	:type theVertex: gp_Pnt
	:param IsByPoint:
	:type IsByPoint: bool
	:param theCoeffs:
	:type theCoeffs: Standard_Address
	:param theUMin:
	:type theUMin: float
	:param theTolerance:
	:type theTolerance: float
	:rtype: None
") BRepGProp_TFunction;
		 BRepGProp_TFunction (const BRepGProp_Face & theSurface,const gp_Pnt & theVertex,const Standard_Boolean IsByPoint,const Standard_Address theCoeffs,const Standard_Real theUMin,const Standard_Real theTolerance);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:rtype: None
") Init;
		void Init ();
		%feature("compactdefaultargs") SetNbKronrodPoints;
		%feature("autodoc", "	* Setting the expected number of Kronrod points for the outer integral computation. This number is required for computation of a value of tolerance for inner integral computation. After GetStateNumber method call, this number is recomputed by the same law as in math_KronrodSingleIntegration, i.e. next number of points is equal to the current number plus a square root of the current number. If the law in math_KronrodSingleIntegration is changed, the modification algo should be modified accordingly.

	:param theNbPoints:
	:type theNbPoints: int
	:rtype: None
") SetNbKronrodPoints;
		void SetNbKronrodPoints (const Standard_Integer theNbPoints);
		%feature("compactdefaultargs") SetValueType;
		%feature("autodoc", "	* Setting the type of the value to be returned. This parameter is directly passed to the UFunction.

	:param aType:
	:type aType: GProp_ValueType
	:rtype: None
") SetValueType;
		void SetValueType (const GProp_ValueType aType);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Setting the tolerance for inner integration

	:param aTol:
	:type aTol: float
	:rtype: None
") SetTolerance;
		void SetTolerance (const Standard_Real aTol);
		%feature("compactdefaultargs") ErrorReached;
		%feature("autodoc", "	* Returns the relative reached error of all values computation since the last call of GetStateNumber method.

	:rtype: float
") ErrorReached;
		Standard_Real ErrorReached ();
		%feature("compactdefaultargs") AbsolutError;
		%feature("autodoc", "	* Returns the absolut reached error of all values computation since the last call of GetStateNumber method.

	:rtype: float
") AbsolutError;
		Standard_Real AbsolutError ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns a value of the function. The value represents an integral of UFunction. It is computed with the predefined tolerance using the adaptive Gauss-Kronrod method.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "	* Redefined method. Remembers the error reached during computation of integral values since the object creation or the last call of GetStateNumber. It is invoked in each algorithm from the package math. Particularly in the algorithm math_KronrodSingleIntegration that is used to compute the integral of TFunction.

	:rtype: int
") GetStateNumber;
		virtual Standard_Integer GetStateNumber ();
};


%extend BRepGProp_TFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepGProp_UFunction;
class BRepGProp_UFunction : public math_Function {
	public:
		%feature("compactdefaultargs") BRepGProp_UFunction;
		%feature("autodoc", "	* Constructor. Initializes the function with the face, the location point, the flag IsByPoint and the coefficients theCoeff that have different meaning depending on the value of IsByPoint. If IsByPoint is equal to Standard_True, the number of the coefficients is equal to 3 and they represent X, Y and Z coordinates (theCoeff[0], theCoeff[1] and theCoeff[2] correspondingly) of the shift, if the inertia is computed with respect to the point different then the location. If IsByPoint is equal to Standard_False, the number of the coefficients is 4 and they represent the combination of plane parameters and shift values.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param theVertex:
	:type theVertex: gp_Pnt
	:param IsByPoint:
	:type IsByPoint: bool
	:param theCoeffs:
	:type theCoeffs: Standard_Address
	:rtype: None
") BRepGProp_UFunction;
		 BRepGProp_UFunction (const BRepGProp_Face & theSurface,const gp_Pnt & theVertex,const Standard_Boolean IsByPoint,const Standard_Address theCoeffs);
		%feature("compactdefaultargs") SetValueType;
		%feature("autodoc", "	* Setting the type of the value to be returned.

	:param theType:
	:type theType: GProp_ValueType
	:rtype: None
") SetValueType;
		void SetValueType (const GProp_ValueType theType);
		%feature("compactdefaultargs") SetVParam;
		%feature("autodoc", "	* Setting the V parameter that is constant during the integral computation.

	:param theVParam:
	:type theVParam: float
	:rtype: None
") SetVParam;
		void SetVParam (const Standard_Real theVParam);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns a value of the function.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
};


%extend BRepGProp_UFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepGProp_Vinert;
class BRepGProp_Vinert : public GProp_GProps {
	public:
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert ();
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of a region of 3D space delimited with the surface <S> and the point VLocation. S can be closed The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Errror of the computation is not calculated.

	:param S:
	:type S: BRepGProp_Face &
	:param VLocation:
	:type VLocation: gp_Pnt
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (const BRepGProp_Face & S,const gp_Pnt & VLocation);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of a region of 3D space delimited with the surface <S> and the point VLocation. S can be closed Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration.

	:param S:
	:type S: BRepGProp_Face &
	:param VLocation:
	:type VLocation: gp_Pnt
	:param Eps:
	:type Eps: float
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of the region of 3D space delimited with the surface <S> and the point VLocation. The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Error of the computation is not calculated.

	:param S:
	:type S: BRepGProp_Face &
	:param O:
	:type O: gp_Pnt
	:param VLocation:
	:type VLocation: gp_Pnt
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (const BRepGProp_Face & S,const gp_Pnt & O,const gp_Pnt & VLocation);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of the region of 3D space delimited with the surface <S> and the point VLocation. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.

	:param S:
	:type S: BRepGProp_Face &
	:param O:
	:type O: gp_Pnt
	:param VLocation:
	:type VLocation: gp_Pnt
	:param Eps:
	:type Eps: float
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,const gp_Pnt & O,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of the region of 3D space delimited with the surface <S> and the plane Pln. The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Error of the computation is not calculated.

	:param S:
	:type S: BRepGProp_Face &
	:param Pl:
	:type Pl: gp_Pln
	:param VLocation:
	:type VLocation: gp_Pnt
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (const BRepGProp_Face & S,const gp_Pln & Pl,const gp_Pnt & VLocation);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of the region of 3D space delimited with the surface <S> and the plane Pln. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.

	:param S:
	:type S: BRepGProp_Face &
	:param Pl:
	:type Pl: gp_Pln
	:param VLocation:
	:type VLocation: gp_Pnt
	:param Eps:
	:type Eps: float
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,const gp_Pln & Pl,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of a region of 3D space delimited with the surface <S> and the point VLocation. S can be closed The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Errror of the computation is not calculated.

	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param VLocation:
	:type VLocation: gp_Pnt
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & VLocation);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of a region of 3D space delimited with the surface <S> and the point VLocation. S can be closed Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration.

	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param VLocation:
	:type VLocation: gp_Pnt
	:param Eps:
	:type Eps: float
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of the region of 3D space delimited with the surface <S> and the point VLocation. The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Error of the computation is not calculated.

	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param O:
	:type O: gp_Pnt
	:param VLocation:
	:type VLocation: gp_Pnt
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & O,const gp_Pnt & VLocation);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of the region of 3D space delimited with the surface <S> and the point VLocation. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.

	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param O:
	:type O: gp_Pnt
	:param VLocation:
	:type VLocation: gp_Pnt
	:param Eps:
	:type Eps: float
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & O,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of the region of 3D space delimited with the surface <S> and the plane Pln. The method is quick and its precision is enough for many cases of analytical surfaces. Non-adaptive 2D Gauss integration with predefined numbers of Gauss points is used. Numbers of points depend on types of surfaces and curves. Error of the computation is not calculated.

	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param Pl:
	:type Pl: gp_Pln
	:param VLocation:
	:type VLocation: gp_Pnt
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pln & Pl,const gp_Pnt & VLocation);
		%feature("compactdefaultargs") BRepGProp_Vinert;
		%feature("autodoc", "	* Computes the global properties of the region of 3D space delimited with the surface <S> and the plane Pln. Adaptive 2D Gauss integration is used. Parameter Eps sets maximal relative error of computed mass (volume) for face. Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values for two successive steps of adaptive integration. WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.

	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param Pl:
	:type Pl: gp_Pln
	:param VLocation:
	:type VLocation: gp_Pnt
	:param Eps:
	:type Eps: float
	:rtype: None
") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pln & Pl,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	:param VLocation:
	:type VLocation: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & VLocation);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:rtype: None
") Perform;
		void Perform (const BRepGProp_Face & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param Eps:
	:type Eps: float
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & S,const Standard_Real Eps);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param O:
	:type O: gp_Pnt
	:rtype: None
") Perform;
		void Perform (const BRepGProp_Face & S,const gp_Pnt & O);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param O:
	:type O: gp_Pnt
	:param Eps:
	:type Eps: float
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & S,const gp_Pnt & O,const Standard_Real Eps);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param Pl:
	:type Pl: gp_Pln
	:rtype: None
") Perform;
		void Perform (const BRepGProp_Face & S,const gp_Pln & Pl);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param Pl:
	:type Pl: gp_Pln
	:param Eps:
	:type Eps: float
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & S,const gp_Pln & Pl,const Standard_Real Eps);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:rtype: None
") Perform;
		void Perform (BRepGProp_Face & S,BRepGProp_Domain & D);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param Eps:
	:type Eps: float
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const Standard_Real Eps);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param O:
	:type O: gp_Pnt
	:rtype: None
") Perform;
		void Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & O);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param O:
	:type O: gp_Pnt
	:param Eps:
	:type Eps: float
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & O,const Standard_Real Eps);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param Pl:
	:type Pl: gp_Pln
	:rtype: None
") Perform;
		void Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pln & Pl);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param S:
	:type S: BRepGProp_Face &
	:param D:
	:type D: BRepGProp_Domain &
	:param Pl:
	:type Pl: gp_Pln
	:param Eps:
	:type Eps: float
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pln & Pl,const Standard_Real Eps);
		%feature("compactdefaultargs") GetEpsilon;
		%feature("autodoc", "	* If previously used methods containe Eps parameter gets actual relative error of the computation, else returns 1.0.

	:rtype: float
") GetEpsilon;
		Standard_Real GetEpsilon ();
};


%extend BRepGProp_Vinert {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor BRepGProp_VinertGK;
class BRepGProp_VinertGK : public GProp_GProps {
	public:
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "	* Empty constructor.

	:rtype: None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK ();
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "	* Constructor. Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the point VLocation.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param theLocation:
	:type theLocation: gp_Pnt
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "	* Constructor. Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the point VLocation. The inertia is computed with respect to thePoint.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theLocation:
	:type theLocation: gp_Pnt
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,const gp_Pnt & thePoint,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "	* Constructor. Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the point VLocation.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param theDomain:
	:type theDomain: BRepGProp_Domain &
	:param theLocation:
	:type theLocation: gp_Pnt
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "	* Constructor. Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the point VLocation. The inertia is computed with respect to thePoint.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param theDomain:
	:type theDomain: BRepGProp_Domain &
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theLocation:
	:type theLocation: gp_Pnt
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const gp_Pnt & thePoint,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "	* Constructor. Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the plane.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param thePlane:
	:type thePlane: gp_Pln
	:param theLocation:
	:type theLocation: gp_Pnt
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,const gp_Pln & thePlane,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") BRepGProp_VinertGK;
		%feature("autodoc", "	* Constructor. Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the plane.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param theDomain:
	:type theDomain: BRepGProp_Domain &
	:param thePlane:
	:type thePlane: gp_Pln
	:param theLocation:
	:type theLocation: gp_Pnt
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: None
") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const gp_Pln & thePlane,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") SetLocation;
		%feature("autodoc", "	* Sets the vertex that delimit 3D closed region of space.

	:param theLocation:
	:type theLocation: gp_Pnt
	:rtype: None
") SetLocation;
		void SetLocation (const gp_Pnt & theLocation);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the point VLocation.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the point VLocation. The inertia is computed with respect to thePoint.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,const gp_Pnt & thePoint,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the point VLocation.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param theDomain:
	:type theDomain: BRepGProp_Domain &
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the point VLocation. The inertia is computed with respect to thePoint.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param theDomain:
	:type theDomain: BRepGProp_Domain &
	:param thePoint:
	:type thePoint: gp_Pnt
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const gp_Pnt & thePoint,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the global properties of a region of 3D space delimited with the naturally restricted surface and the plane.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param thePlane:
	:type thePlane: gp_Pln
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,const gp_Pln & thePlane,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the global properties of a region of 3D space delimited with the surface bounded by the domain and the plane.

	:param theSurface:
	:type theSurface: BRepGProp_Face &
	:param theDomain:
	:type theDomain: BRepGProp_Domain &
	:param thePlane:
	:type thePlane: gp_Pln
	:param theTolerance: default value is 0.001
	:type theTolerance: float
	:param theCGFlag: default value is Standard_False
	:type theCGFlag: bool
	:param theIFlag: default value is Standard_False
	:type theIFlag: bool
	:rtype: float
") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const gp_Pln & thePlane,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("compactdefaultargs") GetErrorReached;
		%feature("autodoc", "	* Returns the relative reached computation error.

	:rtype: float
") GetErrorReached;
		Standard_Real GetErrorReached ();
};


%extend BRepGProp_VinertGK {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
