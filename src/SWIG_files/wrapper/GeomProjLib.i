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
%module (package="OCC") GeomProjLib

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


%include GeomProjLib_headers.i


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

%rename(geomprojlib) GeomProjLib;
class GeomProjLib {
	public:
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	* gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ) The 3dCurve is taken between the parametrization range [First, Last] <Tolerance> is used as input if the projection needs an approximation. In this case, the reached tolerance is set in <Tolerance> as output. WARNING : if the projection has failed, this method returns a null Handle.

	:param C:
	:type C: Handle_Geom_Curve &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param S:
	:type S: Handle_Geom_Surface &
	:param UFirst:
	:type UFirst: float
	:param ULast:
	:type ULast: float
	:param VFirst:
	:type VFirst: float
	:param VLast:
	:type VLast: float
	:param Tolerance:
	:type Tolerance: float &
	:rtype: Handle_Geom2d_Curve
") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Standard_Real First,const Standard_Real Last,const Handle_Geom_Surface & S,const Standard_Real UFirst,const Standard_Real ULast,const Standard_Real VFirst,const Standard_Real VLast,Standard_Real &OutValue);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	* gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ) The 3dCurve is taken between the parametrization range [First, Last] <Tolerance> is used as input if the projection needs an approximation. In this case, the reached tolerance is set in <Tolerance> as output. WARNING : if the projection has failed, this method returns a null Handle.

	:param C:
	:type C: Handle_Geom_Curve &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param S:
	:type S: Handle_Geom_Surface &
	:param Tolerance:
	:type Tolerance: float &
	:rtype: Handle_Geom2d_Curve
") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Standard_Real First,const Standard_Real Last,const Handle_Geom_Surface & S,Standard_Real &OutValue);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	* gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ) The 3dCurve is taken between the parametrization range [First, Last] If the projection needs an approximation, Precision::PApproximation() is used. WARNING : if the projection has failed, this method returns a null Handle.

	:param C:
	:type C: Handle_Geom_Curve &
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: Handle_Geom2d_Curve
") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Standard_Real First,const Standard_Real Last,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	* gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ). If the projection needs an approximation, Precision::PApproximation() is used. WARNING : if the projection has failed, this method returns a null Handle.

	:param C:
	:type C: Handle_Geom_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: Handle_Geom2d_Curve
") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	* gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ). If the projection needs an approximation, Precision::PApproximation() is used. WARNING : if the projection has failed, this method returns a null Handle. can expand a little the bounds of surface

	:param C:
	:type C: Handle_Geom_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param UDeb:
	:type UDeb: float
	:param UFin:
	:type UFin: float
	:param VDeb:
	:type VDeb: float
	:param VFin:
	:type VFin: float
	:rtype: Handle_Geom2d_Curve
") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S,const Standard_Real UDeb,const Standard_Real UFin,const Standard_Real VDeb,const Standard_Real VFin);
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "	* gives the 2d-curve of a 3d-curve lying on a surface ( uses GeomProjLib_ProjectedCurve ). If the projection needs an approximation, Precision::PApproximation() is used. WARNING : if the projection has failed, this method returns a null Handle. can expand a little the bounds of surface

	:param C:
	:type C: Handle_Geom_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:param UDeb:
	:type UDeb: float
	:param UFin:
	:type UFin: float
	:param VDeb:
	:type VDeb: float
	:param VFin:
	:type VFin: float
	:param Tolerance:
	:type Tolerance: float &
	:rtype: Handle_Geom2d_Curve
") Curve2d;
		static Handle_Geom2d_Curve Curve2d (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S,const Standard_Real UDeb,const Standard_Real UFin,const Standard_Real VDeb,const Standard_Real VFin,Standard_Real &OutValue);
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "	* Constructs the 3d-curve from the normal projection of the Curve <C> on the surface <S>. WARNING : if the projection has failes returns a null Handle.

	:param C:
	:type C: Handle_Geom_Curve &
	:param S:
	:type S: Handle_Geom_Surface &
	:rtype: Handle_Geom_Curve
") Project;
		static Handle_Geom_Curve Project (const Handle_Geom_Curve & C,const Handle_Geom_Surface & S);
		%feature("compactdefaultargs") ProjectOnPlane;
		%feature("autodoc", "	* Constructs the 3d-curves from the projection of the curve <Curve> on the plane <Plane> along the direction <Dir>. If <KeepParametrization> is true, the parametrization of the Projected Curve <PC> will be the same as the parametrization of the initial curve <C>. It meens: proj(C(u)) = PC(u) for each u. Otherwize, the parametrization may change.

	:param Curve:
	:type Curve: Handle_Geom_Curve &
	:param Plane:
	:type Plane: Handle_Geom_Plane &
	:param Dir:
	:type Dir: gp_Dir
	:param KeepParametrization:
	:type KeepParametrization: bool
	:rtype: Handle_Geom_Curve
") ProjectOnPlane;
		static Handle_Geom_Curve ProjectOnPlane (const Handle_Geom_Curve & Curve,const Handle_Geom_Plane & Plane,const gp_Dir & Dir,const Standard_Boolean KeepParametrization);
};


%extend GeomProjLib {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
