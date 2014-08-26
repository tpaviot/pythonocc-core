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
%module AppBlend

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

%include AppBlend_required_python_modules.i
%include AppBlend_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
/* end public enums declaration */

%nodefaultctor AppBlend_Approx;
class AppBlend_Approx {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	virtual void

No detailed docstring for this function.") Delete;
		virtual void Delete ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Boolean

No detailed docstring for this function.") IsDone;
		virtual Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	UDegree(Standard_Integer)
	VDegree(Standard_Integer)
	NbUPoles(Standard_Integer)
	NbVPoles(Standard_Integer)
	NbUKnots(Standard_Integer)
	NbVKnots(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") SurfShape;
		virtual void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	TPoles(TColgp_Array2OfPnt)
	TWeights(TColStd_Array2OfReal)
	TUKnots(TColStd_Array1OfReal)
	TVKnots(TColStd_Array1OfReal)
	TUMults(TColStd_Array1OfInteger)
	TVMults(TColStd_Array1OfInteger)

Returns:
	virtual void

No detailed docstring for this function.") Surface;
		virtual void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") UDegree;
		virtual Standard_Integer UDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") VDegree;
		virtual Standard_Integer VDegree ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TColgp_Array2OfPnt

No detailed docstring for this function.") SurfPoles;
		virtual const TColgp_Array2OfPnt & SurfPoles ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TColStd_Array2OfReal

No detailed docstring for this function.") SurfWeights;
		virtual const TColStd_Array2OfReal & SurfWeights ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TColStd_Array1OfReal

No detailed docstring for this function.") SurfUKnots;
		virtual const TColStd_Array1OfReal & SurfUKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TColStd_Array1OfReal

No detailed docstring for this function.") SurfVKnots;
		virtual const TColStd_Array1OfReal & SurfVKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TColStd_Array1OfInteger

No detailed docstring for this function.") SurfUMults;
		virtual const TColStd_Array1OfInteger & SurfUMults ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TColStd_Array1OfInteger

No detailed docstring for this function.") SurfVMults;
		virtual const TColStd_Array1OfInteger & SurfVMults ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") NbCurves2d;
		virtual Standard_Integer NbCurves2d ();
		%feature("autodoc", "Args:
	Degree(Standard_Integer)
	NbPoles(Standard_Integer)
	NbKnots(Standard_Integer)

Returns:
	virtual void

No detailed docstring for this function.") Curves2dShape;
		virtual void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)
	TPoles(TColgp_Array1OfPnt2d)
	TKnots(TColStd_Array1OfReal)
	TMults(TColStd_Array1OfInteger)

Returns:
	virtual void

No detailed docstring for this function.") Curve2d;
		virtual void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);
		%feature("autodoc", "Args:
	None
Returns:
	virtual Standard_Integer

No detailed docstring for this function.") Curves2dDegree;
		virtual Standard_Integer Curves2dDegree ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	virtual  TColgp_Array1OfPnt2d

No detailed docstring for this function.") Curve2dPoles;
		virtual const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TColStd_Array1OfReal

No detailed docstring for this function.") Curves2dKnots;
		virtual const TColStd_Array1OfReal & Curves2dKnots ();
		%feature("autodoc", "Args:
	None
Returns:
	virtual  TColStd_Array1OfInteger

No detailed docstring for this function.") Curves2dMults;
		virtual const TColStd_Array1OfInteger & Curves2dMults ();
		%feature("autodoc", "Args:
	Tol3d(Standard_Real)
	Tol2d(Standard_Real)

Returns:
	virtual void

No detailed docstring for this function.") TolReached;
		virtual void TolReached (Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	virtual Standard_Real

No detailed docstring for this function.") TolCurveOnSurf;
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
