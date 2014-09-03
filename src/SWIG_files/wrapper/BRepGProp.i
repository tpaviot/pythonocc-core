/*
Copyright 2008-2014 Thomas Paviot (tpaviot@gmail.com)


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
%include ../common/StandardDefines.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i

%include BRepGProp_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%rename(brepgprop) BRepGProp;
%nodefaultctor BRepGProp;
class BRepGProp {
	public:
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	LProps(GProp_GProps)

Returns:
	static void

Computes the linear global properties of the shape S,  
i.e. the global properties induced by each edge of the  
shape S, and brings them together with the global  
properties still retained by the framework LProps. If  
the current system of LProps was empty, its global  
properties become equal to the linear global  
properties of S.  
For this computation no linear density is attached to  
the edges. So, for example, the added mass  
corresponds to the sum of the lengths of the edges of  
S. The density of the composed systems, i.e. that of  
each component of the current system of LProps, and  
that of S which is considered to be equal to 1, must be coherent.  
Note that this coherence cannot be checked. You are  
advised to use a separate framework for each  
density, and then to bring these frameworks together  
into a global one.  
The point relative to which the inertia of the system is  
computed is the reference point of the framework LProps.  
Note: if your programming ensures that the framework  
LProps retains only linear global properties (brought  
together for example, by the function  
LinearProperties) for objects the density of which is  
equal to 1 (or is not defined), the function Mass will  
return the total length of edges of the system analysed by LProps.  
Warning  
No check is performed to verify that the shape S  
retains truly linear properties. If S is simply a vertex, it  
is not considered to present any additional global properties.") LinearProperties;
		static void LinearProperties (const TopoDS_Shape & S,GProp_GProps & LProps);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	SProps(GProp_GProps)

Returns:
	static void

Computes the surface global properties of the  
shape S, i.e. the global properties induced by each  
face of the shape S, and brings them together with  
the global properties still retained by the framework  
SProps. If the current system of SProps was empty,  
its global properties become equal to the surface  
global properties of S.  
For this computation, no surface density is attached  
to the faces. Consequently, the added mass  
corresponds to the sum of the areas of the faces of  
S. The density of the component systems, i.e. that  
of each component of the current system of  
SProps, and that of S which is considered to be  
equal to 1, must be coherent.  
Note that this coherence cannot be checked. You  
are advised to use a framework for each different  
value of density, and then to bring these  
frameworks together into a global one.  
The point relative to which the inertia of the system  
is computed is the reference point of the framework SProps.  
Note : if your programming ensures that the  
framework SProps retains only surface global  
properties, brought together, for example, by the  
function SurfaceProperties, for objects the density  
of which is equal to 1 (or is not defined), the  
function Mass will return the total area of faces of  
the system analysed by SProps.  
Warning  
No check is performed to verify that the shape S  
retains truly surface properties. If S is simply a  
vertex, an edge or a wire, it is not considered to  
present any additional global properties.") SurfaceProperties;
		static void SurfaceProperties (const TopoDS_Shape & S,GProp_GProps & SProps);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	SProps(GProp_GProps)
	Eps(Standard_Real)

Returns:
	static Standard_Real

Updates <SProps> with the shape <S>, that contains its pricipal properties.  
         The surface properties of all the faces in <S> are computed.  
         Adaptive 2D Gauss integration is used.  
         Parameter Eps sets maximal relative error of computed mass (area) for each face.  
         Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values  
         for two successive steps of adaptive integration.  
         Method returns estimation of relative error reached for whole shape.  
         WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.  
Computes the global volume properties of the solid  
S, and brings them together with the global  
properties still retained by the framework VProps. If  
the current system of VProps was empty, its global  
properties become equal to the global properties of S for volume.  
For this computation, no volume density is attached  
to the solid. Consequently, the added mass  
corresponds to the volume of S. The density of the  
component systems, i.e. that of each component of  
the current system of VProps, and that of S which  
is considered to be equal to 1, must be coherent to each other.  
Note that this coherence cannot be checked. You  
are advised to use a separate framework for each  
density, and then to bring these frameworks  
together into a global one.  
The point relative to which the inertia of the system  
is computed is the reference point of the framework VProps.  
Note: if your programming ensures that the  
framework VProps retains only global properties of  
volume (brought together for example, by the  
function VolumeProperties) for objects the density  
of which is equal to 1 (or is not defined), the  
function Mass will return the total volume of the  
solids of the system analysed by VProps.  
Warning  
The shape S must represent an object whose  
global volume properties can be computed. It may  
be a finite solid, or a series of finite solids all  
oriented in a coherent way. Nonetheless, S must be  
exempt of any free boundary. Note that these  
conditions of coherence are not checked by this  
algorithm, and results will be false if they are not respected.") SurfaceProperties;
		static Standard_Real SurfaceProperties (const TopoDS_Shape & S,GProp_GProps & SProps,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	VProps(GProp_GProps)
	OnlyClosed(Standard_Boolean)=Standard_False

Returns:
	static void

No detailed docstring for this function.") VolumeProperties;
		static void VolumeProperties (const TopoDS_Shape & S,GProp_GProps & VProps,const Standard_Boolean OnlyClosed = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	VProps(GProp_GProps)
	Eps(Standard_Real)
	OnlyClosed(Standard_Boolean)=Standard_False

Returns:
	static Standard_Real

Updates <VProps> with the shape <S>, that contains its pricipal properties.  
         The volume properties of all the FORWARD and REVERSED faces in <S> are computed.  
         If OnlyClosed is True then computed faces must belong to closed Shells.  
         Adaptive 2D Gauss integration is used.  
         Parameter Eps sets maximal relative error of computed mass (volume) for each face.  
         Error is calculated as Abs((M(i+1)-M(i))/M(i+1)), M(i+1) and M(i) are values  
         for two successive steps of adaptive integration.  
         Method returns estimation of relative error reached for whole shape.  
         WARNING: if Eps > 0.001 algorithm performs non-adaptive integration.") VolumeProperties;
		static Standard_Real VolumeProperties (const TopoDS_Shape & S,GProp_GProps & VProps,const Standard_Real Eps,const Standard_Boolean OnlyClosed = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	VProps(GProp_GProps)
	Eps(Standard_Real)=0.001
	OnlyClosed(Standard_Boolean)=Standard_False
	IsUseSpan(Standard_Boolean)=Standard_False
	CGFlag(Standard_Boolean)=Standard_False
	IFlag(Standard_Boolean)=Standard_False

Returns:
	static Standard_Real

Updates <VProps> with the shape <S>, that contains its pricipal properties.  
         The volume properties of all the FORWARD and REVERSED faces in <S> are computed.  
         If OnlyClosed is True then computed faces must belong to closed Shells.  
         Adaptive 2D Gauss integration is used.  
         Parameter IsUseSpan says if it is necessary to define spans on a face.  
         This option has an effect only for BSpline faces.  
         Parameter Eps sets maximal relative error of computed property for each face.  
         Error is delivered by the adaptive Gauss-Kronrod method of integral computation  
         that is used for properties computation.  
         Method returns estimation of relative error reached for whole shape.  
         Returns negative value if the computation is failed.") VolumePropertiesGK;
		static Standard_Real VolumePropertiesGK (const TopoDS_Shape & S,GProp_GProps & VProps,const Standard_Real Eps = 0.001,const Standard_Boolean OnlyClosed = Standard_False,const Standard_Boolean IsUseSpan = Standard_False,const Standard_Boolean CGFlag = Standard_False,const Standard_Boolean IFlag = Standard_False);
		%feature("autodoc", "Args:
	S(TopoDS_Shape)
	VProps(GProp_GProps)
	thePln(gp_Pln)
	Eps(Standard_Real)=0.001
	OnlyClosed(Standard_Boolean)=Standard_False
	IsUseSpan(Standard_Boolean)=Standard_False
	CGFlag(Standard_Boolean)=Standard_False
	IFlag(Standard_Boolean)=Standard_False

Returns:
	static Standard_Real

No detailed docstring for this function.") VolumePropertiesGK;
		static Standard_Real VolumePropertiesGK (const TopoDS_Shape & S,GProp_GProps & VProps,const gp_Pln & thePln,const Standard_Real Eps = 0.001,const Standard_Boolean OnlyClosed = Standard_False,const Standard_Boolean IsUseSpan = Standard_False,const Standard_Boolean CGFlag = Standard_False,const Standard_Boolean IFlag = Standard_False);
};


%feature("shadow") BRepGProp::~BRepGProp %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepGProp {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepGProp_Cinert;
class BRepGProp_Cinert : public GProp_GProps {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepGProp_Cinert;
		 BRepGProp_Cinert ();
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	CLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Cinert;
		 BRepGProp_Cinert (const BRepAdaptor_Curve & C,const gp_Pnt & CLocation);
		%feature("autodoc", "Args:
	CLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetLocation;
		void SetLocation (const gp_Pnt & CLocation);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const BRepAdaptor_Curve & C);
};


%feature("shadow") BRepGProp_Cinert::~BRepGProp_Cinert %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepGProp_Cinert {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepGProp_Domain;
class BRepGProp_Domain {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Empty constructor.") BRepGProp_Domain;
		 BRepGProp_Domain ();
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Constructor. Initializes the domain with the face.") BRepGProp_Domain;
		 BRepGProp_Domain (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

Initializes the domain with the face.") Init;
		void Init (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns True if there is another arc of curve in the list.") More;
		Standard_Boolean More ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Initializes the exploration with the face already set.") Init;
		void Init ();
		%feature("autodoc", "Args:
	None
Returns:
	TopoDS_Edge

Returns the current edge.") Value;
		const TopoDS_Edge & Value ();
		%feature("autodoc", "Args:
	None
Returns:
	None

Sets the index of the arc iterator to the next arc of  
 curve.") Next;
		void Next ();
};


%feature("shadow") BRepGProp_Domain::~BRepGProp_Domain %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepGProp_Domain {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepGProp_EdgeTool;
class BRepGProp_EdgeTool {
	public:
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Real

Returns the parametric value of the start point of  
 the curve.  The curve is oriented from the start point  
 to the end point.") FirstParameter;
		static Standard_Real FirstParameter (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Real

Returns the parametric value of the end point of  
 the curve.  The curve is oriented from the start point  
 to the end point.") LastParameter;
		static Standard_Real LastParameter (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)

Returns:
	static Standard_Integer

Returns the number of Gauss points required to do  
 the integration with a good accuracy using the  
 Gauss method.  For a polynomial curve of degree n  
 the maxima of accuracy is obtained with an order  
 of integration equal to 2*n-1.") IntegrationOrder;
		static Standard_Integer IntegrationOrder (const BRepAdaptor_Curve & C);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)

Returns:
	static gp_Pnt

Returns the point of parameter U on the loaded curve.") Value;
		static gp_Pnt Value (const BRepAdaptor_Curve & C,const Standard_Real U);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	U(Standard_Real)
	P(gp_Pnt)
	V1(gp_Vec)

Returns:
	static void

Returns the point of parameter U and the first derivative  
 at this point.") D1;
		static void D1 (const BRepAdaptor_Curve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	S(GeomAbs_Shape)

Returns:
	static Standard_Integer

Returns  the number  of  intervals for  continuity  
         <S>. May be one if Continuity(me) >= <S>") NbIntervals;
		static Standard_Integer NbIntervals (const BRepAdaptor_Curve & C,const GeomAbs_Shape S);
		%feature("autodoc", "Args:
	C(BRepAdaptor_Curve)
	T(TColStd_Array1OfReal)
	S(GeomAbs_Shape)

Returns:
	static void

Stores in <T> the  parameters bounding the intervals  
         of continuity <S>.  
 
         The array must provide  enough room to  accomodate  
         for the parameters. i.e. T.Length() > NbIntervals()") Intervals;
		static void Intervals (const BRepAdaptor_Curve & C,TColStd_Array1OfReal & T,const GeomAbs_Shape S);
};


%feature("shadow") BRepGProp_EdgeTool::~BRepGProp_EdgeTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepGProp_EdgeTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepGProp_Face;
class BRepGProp_Face {
	public:
		%feature("autodoc", "Args:
	IsUseSpan(Standard_Boolean)=Standard_False

Returns:
	None

Constructor. Initializes the object with a flag IsUseSpan  
         that says if it is necessary to define spans on a face.  
         This option has an effect only for BSpline faces. Spans  
         are returned by the methods GetUKnots and GetTKnots.") BRepGProp_Face;
		 BRepGProp_Face (const Standard_Boolean IsUseSpan = Standard_False);
		%feature("autodoc", "Args:
	F(TopoDS_Face)
	IsUseSpan(Standard_Boolean)=Standard_False

Returns:
	None

Constructor. Initializes the object with the face and the  
         flag IsUseSpan that says if it is necessary to define  
         spans on a face. This option has an effect only for  
         BSpline faces. Spans are returned by the methods GetUKnots  
         and GetTKnots.") BRepGProp_Face;
		 BRepGProp_Face (const TopoDS_Face & F,const Standard_Boolean IsUseSpan = Standard_False);
		%feature("autodoc", "Args:
	F(TopoDS_Face)

Returns:
	None

No detailed docstring for this function.") Load;
		void Load (const TopoDS_Face & F);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") VIntegrationOrder;
		Standard_Integer VIntegrationOrder ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns Standard_True if the face is not trimmed.") NaturalRestriction;
		Standard_Boolean NaturalRestriction ();
		%feature("autodoc", "Args:
	U(Standard_Real)

Returns:
	gp_Pnt2d

Returns the value of the boundary curve of the face.") Value2d;
		gp_Pnt2d Value2d (const Standard_Real U);
		%feature("autodoc", "Args:
	Eps(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") SIntOrder;
		Standard_Integer SIntOrder (const Standard_Real Eps);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SVIntSubs;
		Standard_Integer SVIntSubs ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") SUIntSubs;
		Standard_Integer SUIntSubs ();
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") UKnots;
		void UKnots (TColStd_Array1OfReal & Knots);
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") VKnots;
		void VKnots (TColStd_Array1OfReal & Knots);
		%feature("autodoc", "Args:
	Eps(Standard_Real)

Returns:
	Standard_Integer

No detailed docstring for this function.") LIntOrder;
		Standard_Integer LIntOrder (const Standard_Real Eps);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") LIntSubs;
		Standard_Integer LIntSubs ();
		%feature("autodoc", "Args:
	Knots(TColStd_Array1OfReal)

Returns:
	None

No detailed docstring for this function.") LKnots;
		void LKnots (TColStd_Array1OfReal & Knots);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of points required to do the  
         integration in the U parametric direction with  
         a good accuracy.") UIntegrationOrder;
		Standard_Integer UIntegrationOrder ();
		%feature("autodoc", "Args:
	U1(Standard_Real)
	U2(Standard_Real)
	V1(Standard_Real)
	V2(Standard_Real)

Returns:
	None

Returns the parametric bounds of the Face.") Bounds;
		void Bounds (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	U(Standard_Real)
	V(Standard_Real)
	P(gp_Pnt)
	VNor(gp_Vec)

Returns:
	None

Computes the point of parameter U, V on the Face <S> and  
         the normal to the face at this point.") Normal;
		void Normal (const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & VNor);
		%feature("autodoc", "Args:
	E(TopoDS_Edge)

Returns:
	None

Loading the boundary arc.") Load;
		void Load (const TopoDS_Edge & E);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parametric value of the start point of  
         the current arc of curve.") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parametric value of the end point of  
         the current arc of curve.") LastParameter;
		Standard_Real LastParameter ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of points required to do the  
         integration along the parameter of curve.") IntegrationOrder;
		Standard_Integer IntegrationOrder ();
		%feature("autodoc", "Args:
	U(Standard_Real)
	P(gp_Pnt2d)
	V1(gp_Vec2d)

Returns:
	None

Returns the point of parameter U and the first derivative  
         at this point of a boundary curve.") D12d;
		void D12d (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("autodoc", "Args:
	IsFirstParam(Standard_Boolean)
	theIsoType(GeomAbs_IsoType)

Returns:
	None

Loading the boundary arc. This arc is either a top, bottom,  
         left or right bound of a UV rectangle in which the  
         parameters of surface are defined.  
         If IsFirstParam is equal to Standard_True, the face is  
         initialized by either left of bottom bound. Otherwise it is  
         initialized by the top or right one.  
         If theIsoType is equal to GeomAbs_IsoU, the face is  
         initialized with either left or right bound. Otherwise -  
         with either top or bottom one.") Load;
		void Load (const Standard_Boolean IsFirstParam,const GeomAbs_IsoType theIsoType);
		%feature("autodoc", "Args:
	theUMin(Standard_Real)
	theUMax(Standard_Real)
	theUKnots(Handle_TColStd_HArray1OfReal)

Returns:
	None

Returns an array of U knots of the face. The first and last  
         elements of the array will be theUMin and theUMax. The  
         middle elements will be the U Knots of the face greater  
         then theUMin and lower then theUMax in increasing order.  
         If the face is not a BSpline, the array initialized with  
         theUMin and theUMax only.") GetUKnots;
		void GetUKnots (const Standard_Real theUMin,const Standard_Real theUMax,Handle_TColStd_HArray1OfReal & theUKnots);
		%feature("autodoc", "Args:
	theTMin(Standard_Real)
	theTMax(Standard_Real)
	theTKnots(Handle_TColStd_HArray1OfReal)

Returns:
	None

Returns an array of combination of T knots of the arc and  
         V knots of the face. The first and last elements of the  
         array will be theTMin and theTMax. The middle elements will  
         be the Knots of the arc and the values of parameters of  
         arc on which the value points have V coordinates close to V  
         knots of face. All the parameter will be greater then  
         theTMin and lower then theTMax in increasing order.  
         If the face is not a BSpline, the array initialized with  
         theTMin and theTMax only.") GetTKnots;
		void GetTKnots (const Standard_Real theTMin,const Standard_Real theTMax,Handle_TColStd_HArray1OfReal & theTKnots);
};


%feature("shadow") BRepGProp_Face::~BRepGProp_Face %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepGProp_Face {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepGProp_Sinert;
class BRepGProp_Sinert : public GProp_GProps {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepGProp_Sinert;
		 BRepGProp_Sinert ();
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	SLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Sinert;
		 BRepGProp_Sinert (const BRepGProp_Face & S,const gp_Pnt & SLocation);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	SLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Sinert;
		 BRepGProp_Sinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & SLocation);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	SLocation(gp_Pnt)
	Eps(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Sinert;
		 BRepGProp_Sinert (BRepGProp_Face & S,const gp_Pnt & SLocation,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	SLocation(gp_Pnt)
	Eps(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Sinert;
		 BRepGProp_Sinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & SLocation,const Standard_Real Eps);
		%feature("autodoc", "Args:
	SLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetLocation;
		void SetLocation (const gp_Pnt & SLocation);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const BRepGProp_Face & S);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (BRepGProp_Face & S,BRepGProp_Domain & D);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	Eps(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & S,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	Eps(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const Standard_Real Eps);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetEpsilon;
		Standard_Real GetEpsilon ();
};


%feature("shadow") BRepGProp_Sinert::~BRepGProp_Sinert %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepGProp_Sinert {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepGProp_TFunctionOfVinertGK;
class BRepGProp_TFunctionOfVinertGK : public math_Function {
	public:
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	theVertex(gp_Pnt)
	IsByPoint(Standard_Boolean)
	theCoeffs(Standard_Address)
	theUMin(Standard_Real)
	theTolerance(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepGProp_TFunctionOfVinertGK;
		 BRepGProp_TFunctionOfVinertGK (const BRepGProp_Face & theSurface,const gp_Pnt & theVertex,const Standard_Boolean IsByPoint,const Standard_Address theCoeffs,const Standard_Real theUMin,const Standard_Real theTolerance);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") Init;
		void Init ();
		%feature("autodoc", "Args:
	theNbPoints(Standard_Integer)

Returns:
	None

No detailed docstring for this function.") SetNbKronrodPoints;
		void SetNbKronrodPoints (const Standard_Integer theNbPoints);
		%feature("autodoc", "Args:
	aType(GProp_ValueType)

Returns:
	None

No detailed docstring for this function.") SetValueType;
		void SetValueType (const GProp_ValueType aType);
		%feature("autodoc", "Args:
	aTol(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetTolerance;
		void SetTolerance (const Standard_Real aTol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") ErrorReached;
		Standard_Real ErrorReached ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") AbsolutError;
		Standard_Real AbsolutError ();
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") GetStateNumber;
		Standard_Integer GetStateNumber ();
};


%feature("shadow") BRepGProp_TFunctionOfVinertGK::~BRepGProp_TFunctionOfVinertGK %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepGProp_TFunctionOfVinertGK {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepGProp_UFunctionOfVinertGK;
class BRepGProp_UFunctionOfVinertGK : public math_Function {
	public:
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	theVertex(gp_Pnt)
	IsByPoint(Standard_Boolean)
	theCoeffs(Standard_Address)

Returns:
	None

No detailed docstring for this function.") BRepGProp_UFunctionOfVinertGK;
		 BRepGProp_UFunctionOfVinertGK (const BRepGProp_Face & theSurface,const gp_Pnt & theVertex,const Standard_Boolean IsByPoint,const Standard_Address theCoeffs);
		%feature("autodoc", "Args:
	theType(GProp_ValueType)

Returns:
	None

No detailed docstring for this function.") SetValueType;
		void SetValueType (const GProp_ValueType theType);
		%feature("autodoc", "Args:
	theVParam(Standard_Real)

Returns:
	None

No detailed docstring for this function.") SetVParam;
		void SetVParam (const Standard_Real theVParam);
		%feature("autodoc", "Args:
	X(Standard_Real)
	F(Standard_Real)

Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") Value;
		virtual Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
};


%feature("shadow") BRepGProp_UFunctionOfVinertGK::~BRepGProp_UFunctionOfVinertGK %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepGProp_UFunctionOfVinertGK {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepGProp_Vinert;
class BRepGProp_Vinert : public GProp_GProps {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert ();
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (const BRepGProp_Face & S,const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	VLocation(gp_Pnt)
	Eps(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	O(gp_Pnt)
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (const BRepGProp_Face & S,const gp_Pnt & O,const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	O(gp_Pnt)
	VLocation(gp_Pnt)
	Eps(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,const gp_Pnt & O,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	Pl(gp_Pln)
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (const BRepGProp_Face & S,const gp_Pln & Pl,const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	Pl(gp_Pln)
	VLocation(gp_Pnt)
	Eps(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,const gp_Pln & Pl,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	VLocation(gp_Pnt)
	Eps(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	O(gp_Pnt)
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & O,const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	O(gp_Pnt)
	VLocation(gp_Pnt)
	Eps(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & O,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	Pl(gp_Pln)
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pln & Pl,const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	Pl(gp_Pln)
	VLocation(gp_Pnt)
	Eps(Standard_Real)

Returns:
	None

No detailed docstring for this function.") BRepGProp_Vinert;
		 BRepGProp_Vinert (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pln & Pl,const gp_Pnt & VLocation,const Standard_Real Eps);
		%feature("autodoc", "Args:
	VLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetLocation;
		void SetLocation (const gp_Pnt & VLocation);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const BRepGProp_Face & S);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	Eps(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & S,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	O(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const BRepGProp_Face & S,const gp_Pnt & O);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	O(gp_Pnt)
	Eps(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & S,const gp_Pnt & O,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	Pl(gp_Pln)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (const BRepGProp_Face & S,const gp_Pln & Pl);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	Pl(gp_Pln)
	Eps(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & S,const gp_Pln & Pl,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (BRepGProp_Face & S,BRepGProp_Domain & D);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	Eps(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	O(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & O);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	O(gp_Pnt)
	Eps(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pnt & O,const Standard_Real Eps);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	Pl(gp_Pln)

Returns:
	None

No detailed docstring for this function.") Perform;
		void Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pln & Pl);
		%feature("autodoc", "Args:
	S(BRepGProp_Face)
	D(BRepGProp_Domain)
	Pl(gp_Pln)
	Eps(Standard_Real)

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & S,BRepGProp_Domain & D,const gp_Pln & Pl,const Standard_Real Eps);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetEpsilon;
		Standard_Real GetEpsilon ();
};


%feature("shadow") BRepGProp_Vinert::~BRepGProp_Vinert %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepGProp_Vinert {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor BRepGProp_VinertGK;
class BRepGProp_VinertGK : public GProp_GProps {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") BRepGProp_VinertGK;
		 BRepGProp_VinertGK ();
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	theLocation(gp_Pnt)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	thePoint(gp_Pnt)
	theLocation(gp_Pnt)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,const gp_Pnt & thePoint,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	theDomain(BRepGProp_Domain)
	theLocation(gp_Pnt)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	theDomain(BRepGProp_Domain)
	thePoint(gp_Pnt)
	theLocation(gp_Pnt)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const gp_Pnt & thePoint,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	thePlane(gp_Pln)
	theLocation(gp_Pnt)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,const gp_Pln & thePlane,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	theDomain(BRepGProp_Domain)
	thePlane(gp_Pln)
	theLocation(gp_Pnt)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	None

No detailed docstring for this function.") BRepGProp_VinertGK;
		 BRepGProp_VinertGK (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const gp_Pln & thePlane,const gp_Pnt & theLocation,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theLocation(gp_Pnt)

Returns:
	None

No detailed docstring for this function.") SetLocation;
		void SetLocation (const gp_Pnt & theLocation);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	thePoint(gp_Pnt)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,const gp_Pnt & thePoint,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	theDomain(BRepGProp_Domain)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	theDomain(BRepGProp_Domain)
	thePoint(gp_Pnt)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const gp_Pnt & thePoint,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	thePlane(gp_Pln)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,const gp_Pln & thePlane,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	theSurface(BRepGProp_Face)
	theDomain(BRepGProp_Domain)
	thePlane(gp_Pln)
	theTolerance(Standard_Real)=0.001
	theCGFlag(Standard_Boolean)=Standard_False
	theIFlag(Standard_Boolean)=Standard_False

Returns:
	Standard_Real

No detailed docstring for this function.") Perform;
		Standard_Real Perform (BRepGProp_Face & theSurface,BRepGProp_Domain & theDomain,const gp_Pln & thePlane,const Standard_Real theTolerance = 0.001,const Standard_Boolean theCGFlag = Standard_False,const Standard_Boolean theIFlag = Standard_False);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

No detailed docstring for this function.") GetErrorReached;
		Standard_Real GetErrorReached ();
};


%feature("shadow") BRepGProp_VinertGK::~BRepGProp_VinertGK %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend BRepGProp_VinertGK {
	void _kill_pointed() {
		delete $self;
	}
};
