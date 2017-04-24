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
%module (package="OCC") AppCont

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


%include AppCont_headers.i


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

%nodefaultctor AppCont_Function;
class AppCont_Function {
	public:
		%feature("compactdefaultargs") GetNumberOfPoints;
		%feature("autodoc", "	* Get number of 3d and 2d points returned by 'Value' and 'D1' functions.

	:param theNbPnt:
	:type theNbPnt: int &
	:param theNbPnt2d:
	:type theNbPnt2d: int &
	:rtype: None
") GetNumberOfPoints;
		void GetNumberOfPoints (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetNbOf3dPoints;
		%feature("autodoc", "	* Get number of 3d points returned by 'Value' and 'D1' functions.

	:rtype: int
") GetNbOf3dPoints;
		Standard_Integer GetNbOf3dPoints ();
		%feature("compactdefaultargs") GetNbOf2dPoints;
		%feature("autodoc", "	* Get number of 2d points returned by 'Value' and 'D1' functions.

	:rtype: int
") GetNbOf2dPoints;
		Standard_Integer GetNbOf2dPoints ();
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* Returns the first parameter of the function.

	:rtype: float
") FirstParameter;
		virtual Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	* Returns the last parameter of the function.

	:rtype: float
") LastParameter;
		virtual Standard_Real LastParameter ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the point at parameter <theU>.

	:param theU:
	:type theU: float
	:param thePnt2d:
	:type thePnt2d: NCollection_Array1<gp_Pnt2d>
	:param thePnt:
	:type thePnt: NCollection_Array1<gp_Pnt>
	:rtype: bool
") Value;
		virtual Standard_Boolean Value (const Standard_Real theU,NCollection_Array1<gp_Pnt2d> & thePnt2d,NCollection_Array1<gp_Pnt> & thePnt);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	* Returns the derivative at parameter <theU>.

	:param theU:
	:type theU: float
	:param theVec2d:
	:type theVec2d: NCollection_Array1<gp_Vec2d>
	:param theVec:
	:type theVec: NCollection_Array1<gp_Vec>
	:rtype: bool
") D1;
		virtual Standard_Boolean D1 (const Standard_Real theU,NCollection_Array1<gp_Vec2d> & theVec2d,NCollection_Array1<gp_Vec> & theVec);
		%feature("compactdefaultargs") PeriodInformation;
		%feature("autodoc", "	* Return information about peridicity in output paramateters space. @param theDimIdx Defines index in output parameters space. 1 <= theDimIdx <= 3 * myNbPnt + 2 * myNbPnt2d.

	:param Standard_Integer:
	:type Standard_Integer: 
	:param IsPeriodic:
	:type IsPeriodic: bool
	:param thePeriod:
	:type thePeriod: float &
	:rtype: void
") PeriodInformation;
		virtual void PeriodInformation (const Standard_Integer,Standard_Boolean &OutValue,Standard_Real &OutValue);
};


%extend AppCont_Function {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor AppCont_LeastSquare;
class AppCont_LeastSquare {
	public:
		%feature("compactdefaultargs") AppCont_LeastSquare;
		%feature("autodoc", "	:param SSP:
	:type SSP: AppCont_Function &
	:param U0:
	:type U0: float
	:param U1:
	:type U1: float
	:param FirstCons:
	:type FirstCons: AppParCurves_Constraint
	:param LastCons:
	:type LastCons: AppParCurves_Constraint
	:param Deg:
	:type Deg: int
	:param NbPoints:
	:type NbPoints: int
	:rtype: None
") AppCont_LeastSquare;
		 AppCont_LeastSquare (const AppCont_Function & SSP,const Standard_Real U0,const Standard_Real U1,const AppParCurves_Constraint FirstCons,const AppParCurves_Constraint LastCons,const Standard_Integer Deg,const Standard_Integer NbPoints);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: AppParCurves_MultiCurve
") Value;
		const AppParCurves_MultiCurve & Value ();
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "	:param F:
	:type F: float &
	:param MaxE3d:
	:type MaxE3d: float &
	:param MaxE2d:
	:type MaxE2d: float &
	:rtype: None
") Error;
		void Error (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "	:rtype: bool
") IsDone;
		Standard_Boolean IsDone ();
};


%extend AppCont_LeastSquare {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
