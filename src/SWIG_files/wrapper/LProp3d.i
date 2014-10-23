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
%module (package="OCC") LProp3d

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

%include LProp3d_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor LProp3d_CLProps;
class LProp3d_CLProps {
	public:
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") LProp3d_CLProps;
		 LProp3d_CLProps (const Handle_Adaptor3d_HCurve & C,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") LProp3d_CLProps;
		 LProp3d_CLProps (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") LProp3d_CLProps;
		 LProp3d_CLProps (const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: None
") SetParameter;
		void SetParameter (const Standard_Real U);
		%feature("autodoc", "	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: None
") SetCurve;
		void SetCurve (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("autodoc", "	:rtype: gp_Vec
") D1;
		const gp_Vec  D1 ();
		%feature("autodoc", "	:rtype: gp_Vec
") D2;
		const gp_Vec  D2 ();
		%feature("autodoc", "	:rtype: gp_Vec
") D3;
		const gp_Vec  D3 ();
		%feature("autodoc", "	:rtype: bool
") IsTangentDefined;
		Standard_Boolean IsTangentDefined ();
		%feature("autodoc", "	:param D:
	:type D: gp_Dir
	:rtype: None
") Tangent;
		void Tangent (gp_Dir & D);
		%feature("autodoc", "	:rtype: float
") Curvature;
		Standard_Real Curvature ();
		%feature("autodoc", "	:param N:
	:type N: gp_Dir
	:rtype: None
") Normal;
		void Normal (gp_Dir & N);
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt
	:rtype: None
") CentreOfCurvature;
		void CentreOfCurvature (gp_Pnt & P);
};


%feature("shadow") LProp3d_CLProps::~LProp3d_CLProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LProp3d_CLProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LProp3d_CurveTool;
class LProp3d_CurveTool {
	public:
		%feature("autodoc", "	* Computes the point <P> of parameter <U> on the HCurve <C>.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") Value;
		static void Value (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point <P> and first derivative <V1> of parameter <U> on the HCurve <C>.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1);
		%feature("autodoc", "	* Computes the point <P>, the first derivative <V1> and second derivative <V2> of parameter <U> on the HCurve <C>.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2);
		%feature("autodoc", "	* Computes the point <P>, the first derivative <V1>, the second derivative <V2> and third derivative <V3> of parameter <U> on the HCurve <C>.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt
	:param V1:
	:type V1: gp_Vec
	:param V2:
	:type V2: gp_Vec
	:param V3:
	:type V3: gp_Vec
	:rtype: void
") D3;
		static void D3 (const Handle_Adaptor3d_HCurve & C,const Standard_Real U,gp_Pnt & P,gp_Vec & V1,gp_Vec & V2,gp_Vec & V3);
		%feature("autodoc", "	* returns the order of continuity of the HCurve <C>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable. returns 3 : first, second and third are computable.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: int
") Continuity;
		static Standard_Integer Continuity (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	* returns the first parameter bound of the HCurve.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") FirstParameter;
		static Standard_Real FirstParameter (const Handle_Adaptor3d_HCurve & C);
		%feature("autodoc", "	* returns the last parameter bound of the HCurve. FirstParameter must be less than LastParamenter.

	:param C:
	:type C: Handle_Adaptor3d_HCurve &
	:rtype: float
") LastParameter;
		static Standard_Real LastParameter (const Handle_Adaptor3d_HCurve & C);
};


%feature("shadow") LProp3d_CurveTool::~LProp3d_CurveTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LProp3d_CurveTool {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LProp3d_SLProps;
class LProp3d_SLProps {
	public:
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") LProp3d_SLProps;
		 LProp3d_SLProps (const Handle_Adaptor3d_HSurface & S,const Standard_Real U,const Standard_Real V,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") LProp3d_SLProps;
		 LProp3d_SLProps (const Handle_Adaptor3d_HSurface & S,const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param N:
	:type N: Standard_Integer
	:param Resolution:
	:type Resolution: float
	:rtype: None
") LProp3d_SLProps;
		 LProp3d_SLProps (const Standard_Integer N,const Standard_Real Resolution);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: None
") SetSurface;
		void SetSurface (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "	:param U:
	:type U: float
	:param V:
	:type V: float
	:rtype: None
") SetParameters;
		void SetParameters (const Standard_Real U,const Standard_Real V);
		%feature("autodoc", "	:rtype: gp_Pnt
") Value;
		const gp_Pnt  Value ();
		%feature("autodoc", "	:rtype: gp_Vec
") D1U;
		const gp_Vec  D1U ();
		%feature("autodoc", "	:rtype: gp_Vec
") D1V;
		const gp_Vec  D1V ();
		%feature("autodoc", "	:rtype: gp_Vec
") D2U;
		const gp_Vec  D2U ();
		%feature("autodoc", "	:rtype: gp_Vec
") D2V;
		const gp_Vec  D2V ();
		%feature("autodoc", "	:rtype: gp_Vec
") DUV;
		const gp_Vec  DUV ();
		%feature("autodoc", "	:rtype: bool
") IsTangentUDefined;
		Standard_Boolean IsTangentUDefined ();
		%feature("autodoc", "	:param D:
	:type D: gp_Dir
	:rtype: None
") TangentU;
		void TangentU (gp_Dir & D);
		%feature("autodoc", "	:rtype: bool
") IsTangentVDefined;
		Standard_Boolean IsTangentVDefined ();
		%feature("autodoc", "	:param D:
	:type D: gp_Dir
	:rtype: None
") TangentV;
		void TangentV (gp_Dir & D);
		%feature("autodoc", "	:rtype: bool
") IsNormalDefined;
		Standard_Boolean IsNormalDefined ();
		%feature("autodoc", "	:rtype: gp_Dir
") Normal;
		const gp_Dir  Normal ();
		%feature("autodoc", "	:rtype: bool
") IsCurvatureDefined;
		Standard_Boolean IsCurvatureDefined ();
		%feature("autodoc", "	:rtype: bool
") IsUmbilic;
		Standard_Boolean IsUmbilic ();
		%feature("autodoc", "	:rtype: float
") MaxCurvature;
		Standard_Real MaxCurvature ();
		%feature("autodoc", "	:rtype: float
") MinCurvature;
		Standard_Real MinCurvature ();
		%feature("autodoc", "	:param MaxD:
	:type MaxD: gp_Dir
	:param MinD:
	:type MinD: gp_Dir
	:rtype: None
") CurvatureDirections;
		void CurvatureDirections (gp_Dir & MaxD,gp_Dir & MinD);
		%feature("autodoc", "	:rtype: float
") MeanCurvature;
		Standard_Real MeanCurvature ();
		%feature("autodoc", "	:rtype: float
") GaussianCurvature;
		Standard_Real GaussianCurvature ();
};


%feature("shadow") LProp3d_SLProps::~LProp3d_SLProps %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LProp3d_SLProps {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor LProp3d_SurfaceTool;
class LProp3d_SurfaceTool {
	public:
		%feature("autodoc", "	* Computes the point <P> of parameter <U> and <V> on the HSurface <S>.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:rtype: void
") Value;
		static void Value (const Handle_Adaptor3d_HSurface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P);
		%feature("autodoc", "	* Computes the point <P> and first derivative <D1*> of parameter <U> and <V> on the HSurface <S>.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:rtype: void
") D1;
		static void D1 (const Handle_Adaptor3d_HSurface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V);
		%feature("autodoc", "	* Computes the point <P>, the first derivative <D1*> and second derivative <D2*> of parameter <U> and <V> on the HSurface <S>.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param P:
	:type P: gp_Pnt
	:param D1U:
	:type D1U: gp_Vec
	:param D1V:
	:type D1V: gp_Vec
	:param D2U:
	:type D2U: gp_Vec
	:param D2V:
	:type D2V: gp_Vec
	:param DUV:
	:type DUV: gp_Vec
	:rtype: void
") D2;
		static void D2 (const Handle_Adaptor3d_HSurface & S,const Standard_Real U,const Standard_Real V,gp_Pnt & P,gp_Vec & D1U,gp_Vec & D1V,gp_Vec & D2U,gp_Vec & D2V,gp_Vec & DUV);
		%feature("autodoc", "	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param U:
	:type U: float
	:param V:
	:type V: float
	:param IU:
	:type IU: Standard_Integer
	:param IV:
	:type IV: Standard_Integer
	:rtype: gp_Vec
") DN;
		static gp_Vec DN (const Handle_Adaptor3d_HSurface & S,const Standard_Real U,const Standard_Real V,const Standard_Integer IU,const Standard_Integer IV);
		%feature("autodoc", "	* returns the order of continuity of the HSurface <S>. returns 1 : first derivative only is computable returns 2 : first and second derivative only are computable.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:rtype: int
") Continuity;
		static Standard_Integer Continuity (const Handle_Adaptor3d_HSurface & S);
		%feature("autodoc", "	* returns the bounds of the HSurface.

	:param S:
	:type S: Handle_Adaptor3d_HSurface &
	:param U1:
	:type U1: float &
	:param V1:
	:type V1: float &
	:param U2:
	:type U2: float &
	:param V2:
	:type V2: float &
	:rtype: void
") Bounds;
		static void Bounds (const Handle_Adaptor3d_HSurface & S,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%feature("shadow") LProp3d_SurfaceTool::~LProp3d_SurfaceTool %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend LProp3d_SurfaceTool {
	void _kill_pointed() {
		delete $self;
	}
};
