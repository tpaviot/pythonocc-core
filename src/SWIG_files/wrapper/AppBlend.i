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
%module (package="OCC") AppBlend

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

%include AppBlend_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor AppBlend_Approx;
class AppBlend_Approx {
	public:
		%feature("autodoc", "	:rtype: void
") Delete;
		virtual void Delete ();
		%feature("autodoc", "	:rtype: bool
") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "	:param UDegree:
	:type UDegree: Standard_Integer &
	:param VDegree:
	:type VDegree: Standard_Integer &
	:param NbUPoles:
	:type NbUPoles: Standard_Integer &
	:param NbVPoles:
	:type NbVPoles: Standard_Integer &
	:param NbUKnots:
	:type NbUKnots: Standard_Integer &
	:param NbVKnots:
	:type NbVKnots: Standard_Integer &
	:rtype: void
") SurfShape;
		virtual void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param TPoles:
	:type TPoles: TColgp_Array2OfPnt
	:param TWeights:
	:type TWeights: TColStd_Array2OfReal &
	:param TUKnots:
	:type TUKnots: TColStd_Array1OfReal &
	:param TVKnots:
	:type TVKnots: TColStd_Array1OfReal &
	:param TUMults:
	:type TUMults: TColStd_Array1OfInteger &
	:param TVMults:
	:type TVMults: TColStd_Array1OfInteger &
	:rtype: void
") Surface;
		virtual void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);
		%feature("autodoc", "	:rtype: int
") UDegree;
		virtual Standard_Integer UDegree ();
		%feature("autodoc", "	:rtype: int
") VDegree;
		virtual Standard_Integer VDegree ();
		%feature("autodoc", "	:rtype: TColgp_Array2OfPnt
") SurfPoles;
		virtual const TColgp_Array2OfPnt & SurfPoles ();
		%feature("autodoc", "	:rtype: TColStd_Array2OfReal
") SurfWeights;
		virtual const TColStd_Array2OfReal & SurfWeights ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfUKnots;
		virtual const TColStd_Array1OfReal & SurfUKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") SurfVKnots;
		virtual const TColStd_Array1OfReal & SurfVKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfUMults;
		virtual const TColStd_Array1OfInteger & SurfUMults ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") SurfVMults;
		virtual const TColStd_Array1OfInteger & SurfVMults ();
		%feature("autodoc", "	:rtype: int
") NbCurves2d;
		virtual Standard_Integer NbCurves2d ();
		%feature("autodoc", "	:param Degree:
	:type Degree: Standard_Integer &
	:param NbPoles:
	:type NbPoles: Standard_Integer &
	:param NbKnots:
	:type NbKnots: Standard_Integer &
	:rtype: void
") Curves2dShape;
		virtual void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal &
	:param TMults:
	:type TMults: TColStd_Array1OfInteger &
	:rtype: void
") Curve2d;
		virtual void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "	:rtype: int
") Curves2dDegree;
		virtual Standard_Integer Curves2dDegree ();
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: TColgp_Array1OfPnt2d
") Curve2dPoles;
		virtual const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("autodoc", "	:rtype: TColStd_Array1OfReal
") Curves2dKnots;
		virtual const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("autodoc", "	:rtype: TColStd_Array1OfInteger
") Curves2dMults;
		virtual const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("autodoc", "	:param Tol3d:
	:type Tol3d: float &
	:param Tol2d:
	:type Tol2d: float &
	:rtype: void
") TolReached;
		virtual void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "	:param Index:
	:type Index: Standard_Integer
	:rtype: float
") TolCurveOnSurf;
		virtual Standard_Real TolCurveOnSurf (const Standard_Integer Index);
};


%feature("shadow") AppBlend_Approx::~AppBlend_Approx %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend AppBlend_Approx {
	void _kill_pointed() {
		delete $self;
	}
};
