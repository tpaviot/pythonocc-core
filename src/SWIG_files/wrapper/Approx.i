/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

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
%define APPROXDOCSTRING
"Approx module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_approx.html"
%enddef
%module (package="OCC.Core", docstring=APPROXDOCSTRING) Approx


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


%{
#include<Approx_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Adaptor2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<Geom2d_module.hxx>
#include<Geom_module.hxx>
#include<AppCont_module.hxx>
#include<AppParCurves_module.hxx>
#include<TColgp_module.hxx>
#include<gp_module.hxx>
#include<FEmTool_module.hxx>
#include<Adaptor2d_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import Adaptor3d.i
%import Adaptor2d.i
%import GeomAbs.i
%import Geom2d.i
%import Geom.i
%import AppCont.i
%import AppParCurves.i
%import TColgp.i
%import gp.i
/* public enums */
enum Approx_Status {
	Approx_PointsAdded = 0,
	Approx_NoPointsAdded = 1,
	Approx_NoApproximation = 2,
};

enum Approx_ParametrizationType {
	Approx_ChordLength = 0,
	Approx_Centripetal = 1,
	Approx_IsoParametric = 2,
};

/* end public enums declaration */

/* handles */
%wrap_handle(Approx_CurvlinFunc)
%wrap_handle(Approx_SweepFunction)
%wrap_handle(Approx_HArray1OfGTrsf2d)
%wrap_handle(Approx_HArray1OfAdHSurface)
/* end handles declaration */

/* templates */
%template(Approx_SequenceOfHArray1OfReal) NCollection_Sequence <opencascade::handle <TColStd_HArray1OfReal>>;
%template(Approx_Array1OfGTrsf2d) NCollection_Array1 <gp_GTrsf2d>;

%extend NCollection_Array1 <gp_GTrsf2d> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Approx_Array1OfAdHSurface) NCollection_Array1 <opencascade::handle <Adaptor3d_HSurface>>;

%extend NCollection_Array1 <opencascade::handle <Adaptor3d_HSurface>> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
/* end templates declaration */

/* typedefs */
typedef NCollection_Sequence <opencascade::handle <TColStd_HArray1OfReal>> Approx_SequenceOfHArray1OfReal;
typedef NCollection_Array1 <gp_GTrsf2d> Approx_Array1OfGTrsf2d;
typedef NCollection_Array1 <opencascade::handle <Adaptor3d_HSurface>> Approx_Array1OfAdHSurface;
/* end typedefs declaration */

/***********************
* class Approx_Curve2d *
***********************/
class Approx_Curve2d {
	public:
		/****************** Approx_Curve2d ******************/
		%feature("compactdefaultargs") Approx_Curve2d;
		%feature("autodoc", ":param C2D:
	:type C2D: Adaptor2d_HCurve2d
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: int
	:param MaxSegments:
	:type MaxSegments: int
	:rtype: None") Approx_Curve2d;
		 Approx_Curve2d (const opencascade::handle<Adaptor2d_HCurve2d> & C2D,const Standard_Real First,const Standard_Real Last,const Standard_Real TolU,const Standard_Real TolV,const GeomAbs_Shape Continuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_BSplineCurve>") Curve;
		opencascade::handle<Geom2d_BSplineCurve> Curve ();

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", ":rtype: bool") HasResult;
		Standard_Boolean HasResult ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** MaxError2dU ******************/
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", ":rtype: float") MaxError2dU;
		Standard_Real MaxError2dU ();

		/****************** MaxError2dV ******************/
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", ":rtype: float") MaxError2dV;
		Standard_Real MaxError2dV ();

};


%extend Approx_Curve2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class Approx_Curve3d *
***********************/
class Approx_Curve3d {
	public:
		/****************** Approx_Curve3d ******************/
		%feature("compactdefaultargs") Approx_Curve3d;
		%feature("autodoc", "* Approximation of a curve with respect of the requiered tolerance Tol3D.
	:param Curve:
	:type Curve: Adaptor3d_HCurve
	:param Tol3d:
	:type Tol3d: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxSegments:
	:type MaxSegments: int
	:param MaxDegree:
	:type MaxDegree: int
	:rtype: None") Approx_Curve3d;
		 Approx_Curve3d (const opencascade::handle<Adaptor3d_HCurve> & Curve,const Standard_Real Tol3d,const GeomAbs_Shape Order,const Standard_Integer MaxSegments,const Standard_Integer MaxDegree);

		/****************** Curve ******************/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") Curve;
		opencascade::handle<Geom_BSplineCurve> Curve ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", "* returns Standard_True if the approximation did come out with a result that is not NECESSARELY within the required tolerance
	:rtype: bool") HasResult;
		Standard_Boolean HasResult ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns Standard_True if the approximation has been done within requiered tolerance
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** MaxError ******************/
		%feature("compactdefaultargs") MaxError;
		%feature("autodoc", "* returns the Maximum Error (>0 when an approximation has been done, 0 if no approximation)
	:rtype: float") MaxError;
		Standard_Real MaxError ();

};


%extend Approx_Curve3d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Approx_CurveOnSurface *
******************************/
class Approx_CurveOnSurface {
	public:
		/****************** Approx_CurveOnSurface ******************/
		%feature("compactdefaultargs") Approx_CurveOnSurface;
		%feature("autodoc", ":param C2D:
	:type C2D: Adaptor2d_HCurve2d
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:param Continuity:
	:type Continuity: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: int
	:param MaxSegments:
	:type MaxSegments: int
	:param Only3d: default value is Standard_False
	:type Only3d: bool
	:param Only2d: default value is Standard_False
	:type Only2d: bool
	:rtype: None") Approx_CurveOnSurface;
		 Approx_CurveOnSurface (const opencascade::handle<Adaptor2d_HCurve2d> & C2D,const opencascade::handle<Adaptor3d_HSurface> & Surf,const Standard_Real First,const Standard_Real Last,const Standard_Real Tol,const GeomAbs_Shape Continuity,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments,const Standard_Boolean Only3d = Standard_False,const Standard_Boolean Only2d = Standard_False);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", ":rtype: opencascade::handle<Geom2d_BSplineCurve>") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d ();

		/****************** Curve3d ******************/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", ":rtype: opencascade::handle<Geom_BSplineCurve>") Curve3d;
		opencascade::handle<Geom_BSplineCurve> Curve3d ();

		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", ":rtype: bool") HasResult;
		Standard_Boolean HasResult ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** MaxError2dU ******************/
		%feature("compactdefaultargs") MaxError2dU;
		%feature("autodoc", ":rtype: float") MaxError2dU;
		Standard_Real MaxError2dU ();

		/****************** MaxError2dV ******************/
		%feature("compactdefaultargs") MaxError2dV;
		%feature("autodoc", "* returns the maximum errors relativly to the U component or the V component of the 2d Curve
	:rtype: float") MaxError2dV;
		Standard_Real MaxError2dV ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", ":rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

};


%extend Approx_CurveOnSurface {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class Approx_CurvilinearParameter *
************************************/
class Approx_CurvilinearParameter {
	public:
		/****************** Approx_CurvilinearParameter ******************/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "* case of a free 3D curve
	:param C3D:
	:type C3D: Adaptor3d_HCurve
	:param Tol:
	:type Tol: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: int
	:param MaxSegments:
	:type MaxSegments: int
	:rtype: None") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const opencascade::handle<Adaptor3d_HCurve> & C3D,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);

		/****************** Approx_CurvilinearParameter ******************/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "* case of a curve on one surface
	:param C2D:
	:type C2D: Adaptor2d_HCurve2d
	:param Surf:
	:type Surf: Adaptor3d_HSurface
	:param Tol:
	:type Tol: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: int
	:param MaxSegments:
	:type MaxSegments: int
	:rtype: None") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const opencascade::handle<Adaptor2d_HCurve2d> & C2D,const opencascade::handle<Adaptor3d_HSurface> & Surf,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);

		/****************** Approx_CurvilinearParameter ******************/
		%feature("compactdefaultargs") Approx_CurvilinearParameter;
		%feature("autodoc", "* case of a curve on two surfaces
	:param C2D1:
	:type C2D1: Adaptor2d_HCurve2d
	:param Surf1:
	:type Surf1: Adaptor3d_HSurface
	:param C2D2:
	:type C2D2: Adaptor2d_HCurve2d
	:param Surf2:
	:type Surf2: Adaptor3d_HSurface
	:param Tol:
	:type Tol: float
	:param Order:
	:type Order: GeomAbs_Shape
	:param MaxDegree:
	:type MaxDegree: int
	:param MaxSegments:
	:type MaxSegments: int
	:rtype: None") Approx_CurvilinearParameter;
		 Approx_CurvilinearParameter (const opencascade::handle<Adaptor2d_HCurve2d> & C2D1,const opencascade::handle<Adaptor3d_HSurface> & Surf1,const opencascade::handle<Adaptor2d_HCurve2d> & C2D2,const opencascade::handle<Adaptor3d_HSurface> & Surf2,const Standard_Real Tol,const GeomAbs_Shape Order,const Standard_Integer MaxDegree,const Standard_Integer MaxSegments);

		/****************** Curve2d1 ******************/
		%feature("compactdefaultargs") Curve2d1;
		%feature("autodoc", "* returns the BsplineCurve representing the reparametrized 2D curve on the first surface (case of a curve on one or two surfaces)
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") Curve2d1;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d1 ();

		/****************** Curve2d2 ******************/
		%feature("compactdefaultargs") Curve2d2;
		%feature("autodoc", "* returns the BsplineCurve representing the reparametrized 2D curve on the second surface (case of a curve on two surfaces)
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") Curve2d2;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d2 ();

		/****************** Curve3d ******************/
		%feature("compactdefaultargs") Curve3d;
		%feature("autodoc", "* returns the Bspline curve corresponding to the reparametrized 3D curve
	:rtype: opencascade::handle<Geom_BSplineCurve>") Curve3d;
		opencascade::handle<Geom_BSplineCurve> Curve3d ();


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** HasResult ******************/
		%feature("compactdefaultargs") HasResult;
		%feature("autodoc", ":rtype: bool") HasResult;
		Standard_Boolean HasResult ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** MaxError2d1 ******************/
		%feature("compactdefaultargs") MaxError2d1;
		%feature("autodoc", "* returns the maximum error on the first reparametrized 2D curve
	:rtype: float") MaxError2d1;
		Standard_Real MaxError2d1 ();

		/****************** MaxError2d2 ******************/
		%feature("compactdefaultargs") MaxError2d2;
		%feature("autodoc", "* returns the maximum error on the second reparametrized 2D curve
	:rtype: float") MaxError2d2;
		Standard_Real MaxError2d2 ();

		/****************** MaxError3d ******************/
		%feature("compactdefaultargs") MaxError3d;
		%feature("autodoc", "* returns the maximum error on the reparametrized 3D curve
	:rtype: float") MaxError3d;
		Standard_Real MaxError3d ();

};


%extend Approx_CurvilinearParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class Approx_CurvlinFunc *
***************************/
class Approx_CurvlinFunc : public Standard_Transient {
	public:
		/****************** Approx_CurvlinFunc ******************/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", ":param C:
	:type C: Adaptor3d_HCurve
	:param Tol:
	:type Tol: float
	:rtype: None") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const opencascade::handle<Adaptor3d_HCurve> & C,const Standard_Real Tol);

		/****************** Approx_CurvlinFunc ******************/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", ":param C2D:
	:type C2D: Adaptor2d_HCurve2d
	:param S:
	:type S: Adaptor3d_HSurface
	:param Tol:
	:type Tol: float
	:rtype: None") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const opencascade::handle<Adaptor2d_HCurve2d> & C2D,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real Tol);

		/****************** Approx_CurvlinFunc ******************/
		%feature("compactdefaultargs") Approx_CurvlinFunc;
		%feature("autodoc", ":param C2D1:
	:type C2D1: Adaptor2d_HCurve2d
	:param C2D2:
	:type C2D2: Adaptor2d_HCurve2d
	:param S1:
	:type S1: Adaptor3d_HSurface
	:param S2:
	:type S2: Adaptor3d_HSurface
	:param Tol:
	:type Tol: float
	:rtype: None") Approx_CurvlinFunc;
		 Approx_CurvlinFunc (const opencascade::handle<Adaptor2d_HCurve2d> & C2D1,const opencascade::handle<Adaptor2d_HCurve2d> & C2D2,const opencascade::handle<Adaptor3d_HSurface> & S1,const opencascade::handle<Adaptor3d_HSurface> & S2,const Standard_Real Tol);

		/****************** EvalCase1 ******************/
		%feature("compactdefaultargs") EvalCase1;
		%feature("autodoc", "* if myCase != 1
	:param S:
	:type S: float
	:param Order:
	:type Order: int
	:param Result:
	:type Result: TColStd_Array1OfReal
	:rtype: bool") EvalCase1;
		Standard_Boolean EvalCase1 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);

		/****************** EvalCase2 ******************/
		%feature("compactdefaultargs") EvalCase2;
		%feature("autodoc", "* if myCase != 2
	:param S:
	:type S: float
	:param Order:
	:type Order: int
	:param Result:
	:type Result: TColStd_Array1OfReal
	:rtype: bool") EvalCase2;
		Standard_Boolean EvalCase2 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);

		/****************** EvalCase3 ******************/
		%feature("compactdefaultargs") EvalCase3;
		%feature("autodoc", "* if myCase != 3
	:param S:
	:type S: float
	:param Order:
	:type Order: int
	:param Result:
	:type Result: TColStd_Array1OfReal
	:rtype: bool") EvalCase3;
		Standard_Boolean EvalCase3 (const Standard_Real S,const Standard_Integer Order,TColStd_Array1OfReal & Result);

		/****************** FirstParameter ******************/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", ":rtype: float") FirstParameter;
		Standard_Real FirstParameter ();

		/****************** GetLength ******************/
		%feature("compactdefaultargs") GetLength;
		%feature("autodoc", ":rtype: float") GetLength;
		Standard_Real GetLength ();

		/****************** GetSParameter ******************/
		%feature("compactdefaultargs") GetSParameter;
		%feature("autodoc", "* returns original parameter correponding S.
	:param U:
	:type U: float
	:rtype: float") GetSParameter;
		Standard_Real GetSParameter (const Standard_Real U);

		/****************** GetUParameter ******************/
		%feature("compactdefaultargs") GetUParameter;
		%feature("autodoc", "* returns original parameter correponding S. if Case == 1 computation is performed on myC2D1 and mySurf1, otherwise it is done on myC2D2 and mySurf2.
	:param C:
	:type C: Adaptor3d_Curve
	:param S:
	:type S: float
	:param NumberOfCurve:
	:type NumberOfCurve: int
	:rtype: float") GetUParameter;
		Standard_Real GetUParameter (Adaptor3d_Curve & C,const Standard_Real S,const Standard_Integer NumberOfCurve);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: None") Intervals;
		void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** LastParameter ******************/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", ":rtype: float") LastParameter;
		Standard_Real LastParameter ();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes length of the curve.
	:rtype: None") Length;
		void Length ();

		/****************** Length ******************/
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "* Computes length of the curve segment.
	:param C:
	:type C: Adaptor3d_Curve
	:param FirstU:
	:type FirstU: float
	:param LasrU:
	:type LasrU: float
	:rtype: float") Length;
		Standard_Real Length (Adaptor3d_Curve & C,const Standard_Real FirstU,const Standard_Real LasrU);

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** SetTol ******************/
		%feature("compactdefaultargs") SetTol;
		%feature("autodoc", "* ---Purpose Update the tolerance to used
	:param Tol:
	:type Tol: float
	:rtype: None") SetTol;
		void SetTol (const Standard_Real Tol);

		/****************** Trim ******************/
		%feature("compactdefaultargs") Trim;
		%feature("autodoc", "* if First < 0 or Last > 1
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol:
	:type Tol: float
	:rtype: None") Trim;
		void Trim (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol);

};


%make_alias(Approx_CurvlinFunc)

%extend Approx_CurvlinFunc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class Approx_FitAndDivide *
****************************/
class Approx_FitAndDivide {
	public:
		/****************** Approx_FitAndDivide ******************/
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True.
	:param Line:
	:type Line: AppCont_Function
	:param degreemin: default value is 3
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-5
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-5
	:type Tolerance2d: float
	:param cutting: default value is Standard_False
	:type cutting: bool
	:param FirstC: default value is AppParCurves_TangencyPoint
	:type FirstC: AppParCurves_Constraint
	:param LastC: default value is AppParCurves_TangencyPoint
	:type LastC: AppParCurves_Constraint
	:rtype: None") Approx_FitAndDivide;
		 Approx_FitAndDivide (const AppCont_Function & Line,const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-5,const Standard_Real Tolerance2d = 1.0e-5,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Approx_FitAndDivide ******************/
		%feature("compactdefaultargs") Approx_FitAndDivide;
		%feature("autodoc", "* Initializes the fields of the algorithm.
	:param degreemin: default value is 3
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-05
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-05
	:type Tolerance2d: float
	:param cutting: default value is Standard_False
	:type cutting: bool
	:param FirstC: default value is AppParCurves_TangencyPoint
	:type FirstC: AppParCurves_Constraint
	:param LastC: default value is AppParCurves_TangencyPoint
	:type LastC: AppParCurves_Constraint
	:rtype: None") Approx_FitAndDivide;
		 Approx_FitAndDivide (const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-05,const Standard_Real Tolerance2d = 1.0e-05,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the tolerances 2d and 3d of the <Index> MultiCurve.
	:param Index:
	:type Index: int
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: None") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsAllApproximated ******************/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "* returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
	:rtype: bool") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();

		/****************** IsToleranceReached ******************/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "* returns False if the status NoPointsAdded has been sent.
	:rtype: bool") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();

		/****************** NbMultiCurves ******************/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "* Returns the number of MultiCurve doing the approximation of the MultiLine.
	:rtype: int") NbMultiCurves;
		Standard_Integer NbMultiCurves ();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param firstp:
	:type firstp: float
	:param lastp:
	:type lastp: float
	:rtype: None") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* runs the algorithm after having initialized the fields.
	:param Line:
	:type Line: AppCont_Function
	:rtype: None") Perform;
		void Perform (const AppCont_Function & Line);

		/****************** SetConstraints ******************/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "* Changes the constraints of the approximation.
	:param FirstC:
	:type FirstC: AppParCurves_Constraint
	:param LastC:
	:type LastC: AppParCurves_Constraint
	:rtype: None") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);

		/****************** SetDegrees ******************/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "* changes the degrees of the approximation.
	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);

		/****************** SetInvOrder ******************/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "* Set inverse order of degree selection: if theInvOrdr = true, current degree is chosen by inverse order - from maxdegree to mindegree. By default inverse order is used.
	:param theInvOrder:
	:type theInvOrder: bool
	:rtype: None") SetInvOrder;
		void SetInvOrder (const Standard_Boolean theInvOrder);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "* Changes the max number of segments, which is allowed for cutting.
	:param theMaxSegments:
	:type theMaxSegments: int
	:rtype: None") SetMaxSegments;
		void SetMaxSegments (const Standard_Integer theMaxSegments);

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "* Changes the tolerances of the approximation.
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the approximation MultiCurve of range <Index>.
	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);

};


%extend Approx_FitAndDivide {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class Approx_FitAndDivide2d *
******************************/
class Approx_FitAndDivide2d {
	public:
		/****************** Approx_FitAndDivide2d ******************/
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "* The MultiLine <Line> will be approximated until tolerances will be reached. The approximation will be done from degreemin to degreemax with a cutting if the corresponding boolean is True.
	:param Line:
	:type Line: AppCont_Function
	:param degreemin: default value is 3
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-5
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-5
	:type Tolerance2d: float
	:param cutting: default value is Standard_False
	:type cutting: bool
	:param FirstC: default value is AppParCurves_TangencyPoint
	:type FirstC: AppParCurves_Constraint
	:param LastC: default value is AppParCurves_TangencyPoint
	:type LastC: AppParCurves_Constraint
	:rtype: None") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d (const AppCont_Function & Line,const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-5,const Standard_Real Tolerance2d = 1.0e-5,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Approx_FitAndDivide2d ******************/
		%feature("compactdefaultargs") Approx_FitAndDivide2d;
		%feature("autodoc", "* Initializes the fields of the algorithm.
	:param degreemin: default value is 3
	:type degreemin: int
	:param degreemax: default value is 8
	:type degreemax: int
	:param Tolerance3d: default value is 1.0e-05
	:type Tolerance3d: float
	:param Tolerance2d: default value is 1.0e-05
	:type Tolerance2d: float
	:param cutting: default value is Standard_False
	:type cutting: bool
	:param FirstC: default value is AppParCurves_TangencyPoint
	:type FirstC: AppParCurves_Constraint
	:param LastC: default value is AppParCurves_TangencyPoint
	:type LastC: AppParCurves_Constraint
	:rtype: None") Approx_FitAndDivide2d;
		 Approx_FitAndDivide2d (const Standard_Integer degreemin = 3,const Standard_Integer degreemax = 8,const Standard_Real Tolerance3d = 1.0e-05,const Standard_Real Tolerance2d = 1.0e-05,const Standard_Boolean cutting = Standard_False,const AppParCurves_Constraint FirstC = AppParCurves_TangencyPoint,const AppParCurves_Constraint LastC = AppParCurves_TangencyPoint);

		/****************** Error ******************/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "* returns the tolerances 2d and 3d of the <Index> MultiCurve.
	:param Index:
	:type Index: int
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: None") Error;
		void Error (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** IsAllApproximated ******************/
		%feature("compactdefaultargs") IsAllApproximated;
		%feature("autodoc", "* returns False if at a moment of the approximation, the status NoApproximation has been sent by the user when more points were needed.
	:rtype: bool") IsAllApproximated;
		Standard_Boolean IsAllApproximated ();

		/****************** IsToleranceReached ******************/
		%feature("compactdefaultargs") IsToleranceReached;
		%feature("autodoc", "* returns False if the status NoPointsAdded has been sent.
	:rtype: bool") IsToleranceReached;
		Standard_Boolean IsToleranceReached ();

		/****************** NbMultiCurves ******************/
		%feature("compactdefaultargs") NbMultiCurves;
		%feature("autodoc", "* Returns the number of MultiCurve doing the approximation of the MultiLine.
	:rtype: int") NbMultiCurves;
		Standard_Integer NbMultiCurves ();

		/****************** Parameters ******************/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param firstp:
	:type firstp: float
	:param lastp:
	:type lastp: float
	:rtype: None") Parameters;
		void Parameters (const Standard_Integer Index,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* runs the algorithm after having initialized the fields.
	:param Line:
	:type Line: AppCont_Function
	:rtype: None") Perform;
		void Perform (const AppCont_Function & Line);

		/****************** SetConstraints ******************/
		%feature("compactdefaultargs") SetConstraints;
		%feature("autodoc", "* Changes the constraints of the approximation.
	:param FirstC:
	:type FirstC: AppParCurves_Constraint
	:param LastC:
	:type LastC: AppParCurves_Constraint
	:rtype: None") SetConstraints;
		void SetConstraints (const AppParCurves_Constraint FirstC,const AppParCurves_Constraint LastC);

		/****************** SetDegrees ******************/
		%feature("compactdefaultargs") SetDegrees;
		%feature("autodoc", "* changes the degrees of the approximation.
	:param degreemin:
	:type degreemin: int
	:param degreemax:
	:type degreemax: int
	:rtype: None") SetDegrees;
		void SetDegrees (const Standard_Integer degreemin,const Standard_Integer degreemax);

		/****************** SetInvOrder ******************/
		%feature("compactdefaultargs") SetInvOrder;
		%feature("autodoc", "* Set inverse order of degree selection: if theInvOrdr = true, current degree is chosen by inverse order - from maxdegree to mindegree. By default inverse order is used.
	:param theInvOrder:
	:type theInvOrder: bool
	:rtype: None") SetInvOrder;
		void SetInvOrder (const Standard_Boolean theInvOrder);

		/****************** SetMaxSegments ******************/
		%feature("compactdefaultargs") SetMaxSegments;
		%feature("autodoc", "* Changes the max number of segments, which is allowed for cutting.
	:param theMaxSegments:
	:type theMaxSegments: int
	:rtype: None") SetMaxSegments;
		void SetMaxSegments (const Standard_Integer theMaxSegments);

		/****************** SetTolerances ******************/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "* Changes the tolerances of the approximation.
	:param Tolerance3d:
	:type Tolerance3d: float
	:param Tolerance2d:
	:type Tolerance2d: float
	:rtype: None") SetTolerances;
		void SetTolerances (const Standard_Real Tolerance3d,const Standard_Real Tolerance2d);

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* returns the approximation MultiCurve of range <Index>.
	:param Index: default value is 1
	:type Index: int
	:rtype: AppParCurves_MultiCurve") Value;
		AppParCurves_MultiCurve Value (const Standard_Integer Index = 1);

};


%extend Approx_FitAndDivide2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class Approx_MCurvesToBSpCurve *
*********************************/
class Approx_MCurvesToBSpCurve {
	public:
		/****************** Append ******************/
		%feature("compactdefaultargs") Append;
		%feature("autodoc", ":param MC:
	:type MC: AppParCurves_MultiCurve
	:rtype: None") Append;
		void Append (const AppParCurves_MultiCurve & MC);

		/****************** Approx_MCurvesToBSpCurve ******************/
		%feature("compactdefaultargs") Approx_MCurvesToBSpCurve;
		%feature("autodoc", ":rtype: None") Approx_MCurvesToBSpCurve;
		 Approx_MCurvesToBSpCurve ();

		/****************** ChangeValue ******************/
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "* return the composite MultiCurves as a MultiBSpCurve.
	:rtype: AppParCurves_MultiBSpCurve") ChangeValue;
		const AppParCurves_MultiBSpCurve & ChangeValue ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":rtype: None") Perform;
		void Perform ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", ":param TheSeq:
	:type TheSeq: AppParCurves_SequenceOfMultiCurve
	:rtype: None") Perform;
		void Perform (const AppParCurves_SequenceOfMultiCurve & TheSeq);

		/****************** Reset ******************/
		%feature("compactdefaultargs") Reset;
		%feature("autodoc", ":rtype: None") Reset;
		void Reset ();

		/****************** Value ******************/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "* return the composite MultiCurves as a MultiBSpCurve.
	:rtype: AppParCurves_MultiBSpCurve") Value;
		const AppParCurves_MultiBSpCurve & Value ();

};


%extend Approx_MCurvesToBSpCurve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Approx_SameParameter *
*****************************/
class Approx_SameParameter {
	public:
		/****************** Approx_SameParameter ******************/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "* Warning: the C3D and C2D must have the same parametric domain.
	:param C3D:
	:type C3D: Geom_Curve
	:param C2D:
	:type C2D: Geom2d_Curve
	:param S:
	:type S: Geom_Surface
	:param Tol:
	:type Tol: float
	:rtype: None") Approx_SameParameter;
		 Approx_SameParameter (const opencascade::handle<Geom_Curve> & C3D,const opencascade::handle<Geom2d_Curve> & C2D,const opencascade::handle<Geom_Surface> & S,const Standard_Real Tol);

		/****************** Approx_SameParameter ******************/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", ":param C3D:
	:type C3D: Adaptor3d_HCurve
	:param C2D:
	:type C2D: Geom2d_Curve
	:param S:
	:type S: Adaptor3d_HSurface
	:param Tol:
	:type Tol: float
	:rtype: None") Approx_SameParameter;
		 Approx_SameParameter (const opencascade::handle<Adaptor3d_HCurve> & C3D,const opencascade::handle<Geom2d_Curve> & C2D,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real Tol);

		/****************** Approx_SameParameter ******************/
		%feature("compactdefaultargs") Approx_SameParameter;
		%feature("autodoc", "* Warning: the C3D and C2D must have the same parametric domain.
	:param C3D:
	:type C3D: Adaptor3d_HCurve
	:param C2D:
	:type C2D: Adaptor2d_HCurve2d
	:param S:
	:type S: Adaptor3d_HSurface
	:param Tol:
	:type Tol: float
	:rtype: None") Approx_SameParameter;
		 Approx_SameParameter (const opencascade::handle<Adaptor3d_HCurve> & C3D,const opencascade::handle<Adaptor2d_HCurve2d> & C2D,const opencascade::handle<Adaptor3d_HSurface> & S,const Standard_Real Tol);

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", "* Returns the 2D curve that has the same parameter as the 3D curve once evaluated on the surface up to the specified tolerance
	:rtype: opencascade::handle<Geom2d_BSplineCurve>") Curve2d;
		opencascade::handle<Geom2d_BSplineCurve> Curve2d ();

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", ":rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** IsSameParameter ******************/
		%feature("compactdefaultargs") IsSameParameter;
		%feature("autodoc", "* Tells whether the original data had already the same parameter up to the tolerance : in that case nothing is done.
	:rtype: bool") IsSameParameter;
		Standard_Boolean IsSameParameter ();

		/****************** TolReached ******************/
		%feature("compactdefaultargs") TolReached;
		%feature("autodoc", ":rtype: float") TolReached;
		Standard_Real TolReached ();

};


%extend Approx_SameParameter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************************
* class Approx_SweepApproximation *
**********************************/
class Approx_SweepApproximation {
	public:
		/****************** Approx_SweepApproximation ******************/
		%feature("compactdefaultargs") Approx_SweepApproximation;
		%feature("autodoc", ":param Func:
	:type Func: Approx_SweepFunction
	:rtype: None") Approx_SweepApproximation;
		 Approx_SweepApproximation (const opencascade::handle<Approx_SweepFunction> & Func);

		/****************** Average2dError ******************/
		%feature("compactdefaultargs") Average2dError;
		%feature("autodoc", "* returns the average error of the <Index> 2d curve approximation.
	:param Index:
	:type Index: int
	:rtype: float") Average2dError;
		Standard_Real Average2dError (const Standard_Integer Index);

		/****************** AverageErrorOnSurf ******************/
		%feature("compactdefaultargs") AverageErrorOnSurf;
		%feature("autodoc", "* returns the average error in the suface approximation.
	:rtype: float") AverageErrorOnSurf;
		Standard_Real AverageErrorOnSurf ();

		/****************** Curve2d ******************/
		%feature("compactdefaultargs") Curve2d;
		%feature("autodoc", ":param Index:
	:type Index: int
	:param TPoles:
	:type TPoles: TColgp_Array1OfPnt2d
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal
	:param TMults:
	:type TMults: TColStd_Array1OfInteger
	:rtype: None") Curve2d;
		void Curve2d (const Standard_Integer Index,TColgp_Array1OfPnt2d & TPoles,TColStd_Array1OfReal & TKnots,TColStd_Array1OfInteger & TMults);

		/****************** Curve2dPoles ******************/
		%feature("compactdefaultargs") Curve2dPoles;
		%feature("autodoc", ":param Index:
	:type Index: int
	:rtype: TColgp_Array1OfPnt2d") Curve2dPoles;
		const TColgp_Array1OfPnt2d & Curve2dPoles (const Standard_Integer Index);

		/****************** Curves2dDegree ******************/
		%feature("compactdefaultargs") Curves2dDegree;
		%feature("autodoc", ":rtype: int") Curves2dDegree;
		Standard_Integer Curves2dDegree ();

		/****************** Curves2dKnots ******************/
		%feature("compactdefaultargs") Curves2dKnots;
		%feature("autodoc", ":rtype: TColStd_Array1OfReal") Curves2dKnots;
		const TColStd_Array1OfReal & Curves2dKnots ();

		/****************** Curves2dMults ******************/
		%feature("compactdefaultargs") Curves2dMults;
		%feature("autodoc", ":rtype: TColStd_Array1OfInteger") Curves2dMults;
		const TColStd_Array1OfInteger & Curves2dMults ();

		/****************** Curves2dShape ******************/
		%feature("compactdefaultargs") Curves2dShape;
		%feature("autodoc", ":param Degree:
	:type Degree: int
	:param NbPoles:
	:type NbPoles: int
	:param NbKnots:
	:type NbKnots: int
	:rtype: None") Curves2dShape;
		void Curves2dShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);


        %feature("autodoc", "1");
        %extend{
            std::string DumpToString() {
            std::stringstream s;
            self->Dump(s);
            return s.str();}
        };
        		/****************** Eval ******************/
		%feature("compactdefaultargs") Eval;
		%feature("autodoc", "* The EvaluatorFunction from AdvApprox;
	:param Parameter:
	:type Parameter: float
	:param DerivativeRequest:
	:type DerivativeRequest: int
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Result:
	:type Result: float
	:rtype: int") Eval;
		Standard_Integer Eval (const Standard_Real Parameter,const Standard_Integer DerivativeRequest,const Standard_Real First,const Standard_Real Last,Standard_Real &OutValue);

		/****************** IsDone ******************/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "* returns if we have an result
	:rtype: bool") IsDone;
		Standard_Boolean IsDone ();

		/****************** Max2dError ******************/
		%feature("compactdefaultargs") Max2dError;
		%feature("autodoc", "* returns the maximum error of the <Index> 2d curve approximation.
	:param Index:
	:type Index: int
	:rtype: float") Max2dError;
		Standard_Real Max2dError (const Standard_Integer Index);

		/****************** MaxErrorOnSurf ******************/
		%feature("compactdefaultargs") MaxErrorOnSurf;
		%feature("autodoc", "* returns the maximum error in the suface approximation.
	:rtype: float") MaxErrorOnSurf;
		Standard_Real MaxErrorOnSurf ();

		/****************** NbCurves2d ******************/
		%feature("compactdefaultargs") NbCurves2d;
		%feature("autodoc", ":rtype: int") NbCurves2d;
		Standard_Integer NbCurves2d ();

		/****************** Perform ******************/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "* Perform the Approximation [First, Last] : Approx_SweepApproximation.cdl Tol3d : Tolerance to surface approximation Tol2d : Tolerance used to perform curve approximation Normaly the 2d curve are approximated with a tolerance given by the resolution on support surfaces, but if this tolerance is too large Tol2d is used. TolAngular : Tolerance (in radian) to control the angle beetween tangents on the section law and tangent of iso-v on approximed surface Continuity : The continuity in v waiting on the surface Degmax : The maximum degree in v requiered on the surface Segmax : The maximum number of span in v requiered on the surface Warning : The continuity ci can be obtained only if Ft is Ci
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Tol3d:
	:type Tol3d: float
	:param BoundTol:
	:type BoundTol: float
	:param Tol2d:
	:type Tol2d: float
	:param TolAngular:
	:type TolAngular: float
	:param Continuity: default value is GeomAbs_C0
	:type Continuity: GeomAbs_Shape
	:param Degmax: default value is 11
	:type Degmax: int
	:param Segmax: default value is 50
	:type Segmax: int
	:rtype: None") Perform;
		void Perform (const Standard_Real First,const Standard_Real Last,const Standard_Real Tol3d,const Standard_Real BoundTol,const Standard_Real Tol2d,const Standard_Real TolAngular,const GeomAbs_Shape Continuity = GeomAbs_C0,const Standard_Integer Degmax = 11,const Standard_Integer Segmax = 50);

		/****************** SurfPoles ******************/
		%feature("compactdefaultargs") SurfPoles;
		%feature("autodoc", ":rtype: TColgp_Array2OfPnt") SurfPoles;
		const TColgp_Array2OfPnt & SurfPoles ();

		/****************** SurfShape ******************/
		%feature("compactdefaultargs") SurfShape;
		%feature("autodoc", ":param UDegree:
	:type UDegree: int
	:param VDegree:
	:type VDegree: int
	:param NbUPoles:
	:type NbUPoles: int
	:param NbVPoles:
	:type NbVPoles: int
	:param NbUKnots:
	:type NbUKnots: int
	:param NbVKnots:
	:type NbVKnots: int
	:rtype: None") SurfShape;
		void SurfShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** SurfUKnots ******************/
		%feature("compactdefaultargs") SurfUKnots;
		%feature("autodoc", ":rtype: TColStd_Array1OfReal") SurfUKnots;
		const TColStd_Array1OfReal & SurfUKnots ();

		/****************** SurfUMults ******************/
		%feature("compactdefaultargs") SurfUMults;
		%feature("autodoc", ":rtype: TColStd_Array1OfInteger") SurfUMults;
		const TColStd_Array1OfInteger & SurfUMults ();

		/****************** SurfVKnots ******************/
		%feature("compactdefaultargs") SurfVKnots;
		%feature("autodoc", ":rtype: TColStd_Array1OfReal") SurfVKnots;
		const TColStd_Array1OfReal & SurfVKnots ();

		/****************** SurfVMults ******************/
		%feature("compactdefaultargs") SurfVMults;
		%feature("autodoc", ":rtype: TColStd_Array1OfInteger") SurfVMults;
		const TColStd_Array1OfInteger & SurfVMults ();

		/****************** SurfWeights ******************/
		%feature("compactdefaultargs") SurfWeights;
		%feature("autodoc", ":rtype: TColStd_Array2OfReal") SurfWeights;
		const TColStd_Array2OfReal & SurfWeights ();

		/****************** Surface ******************/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", ":param TPoles:
	:type TPoles: TColgp_Array2OfPnt
	:param TWeights:
	:type TWeights: TColStd_Array2OfReal
	:param TUKnots:
	:type TUKnots: TColStd_Array1OfReal
	:param TVKnots:
	:type TVKnots: TColStd_Array1OfReal
	:param TUMults:
	:type TUMults: TColStd_Array1OfInteger
	:param TVMults:
	:type TVMults: TColStd_Array1OfInteger
	:rtype: None") Surface;
		void Surface (TColgp_Array2OfPnt & TPoles,TColStd_Array2OfReal & TWeights,TColStd_Array1OfReal & TUKnots,TColStd_Array1OfReal & TVKnots,TColStd_Array1OfInteger & TUMults,TColStd_Array1OfInteger & TVMults);

		/****************** TolCurveOnSurf ******************/
		%feature("compactdefaultargs") TolCurveOnSurf;
		%feature("autodoc", "* returns the maximum 3d error of the <Index> 2d curve approximation on the Surface.
	:param Index:
	:type Index: int
	:rtype: float") TolCurveOnSurf;
		Standard_Real TolCurveOnSurf (const Standard_Integer Index);

		/****************** UDegree ******************/
		%feature("compactdefaultargs") UDegree;
		%feature("autodoc", ":rtype: int") UDegree;
		Standard_Integer UDegree ();

		/****************** VDegree ******************/
		%feature("compactdefaultargs") VDegree;
		%feature("autodoc", ":rtype: int") VDegree;
		Standard_Integer VDegree ();

};


%extend Approx_SweepApproximation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class Approx_SweepFunction *
*****************************/
%nodefaultctor Approx_SweepFunction;
class Approx_SweepFunction : public Standard_Transient {
	public:
		/****************** BarycentreOfSurf ******************/
		%feature("compactdefaultargs") BarycentreOfSurf;
		%feature("autodoc", "* Get the barycentre of Surface. An very poor estimation is sufficent. This information is usefull to perform well conditioned rational approximation. Warning: Used only if <self> IsRational
	:rtype: gp_Pnt") BarycentreOfSurf;
		virtual gp_Pnt BarycentreOfSurf ();

		/****************** D0 ******************/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "* compute the section for v = param
	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal
	:rtype: bool") D0;
		virtual Standard_Boolean D0 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfPnt2d & Poles2d,TColStd_Array1OfReal & Weigths);

		/****************** D1 ******************/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "* compute the first derivative in v direction of the section for v = param Warning : It used only for C1 or C2 aproximation
	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal
	:rtype: bool") D1;
		virtual Standard_Boolean D1 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths);

		/****************** D2 ******************/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "* compute the second derivative in v direction of the section for v = param Warning : It used only for C2 aproximation
	:param Param:
	:type Param: float
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:param Poles:
	:type Poles: TColgp_Array1OfPnt
	:param DPoles:
	:type DPoles: TColgp_Array1OfVec
	:param D2Poles:
	:type D2Poles: TColgp_Array1OfVec
	:param Poles2d:
	:type Poles2d: TColgp_Array1OfPnt2d
	:param DPoles2d:
	:type DPoles2d: TColgp_Array1OfVec2d
	:param D2Poles2d:
	:type D2Poles2d: TColgp_Array1OfVec2d
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal
	:param DWeigths:
	:type DWeigths: TColStd_Array1OfReal
	:param D2Weigths:
	:type D2Weigths: TColStd_Array1OfReal
	:rtype: bool") D2;
		virtual Standard_Boolean D2 (const Standard_Real Param,const Standard_Real First,const Standard_Real Last,TColgp_Array1OfPnt & Poles,TColgp_Array1OfVec & DPoles,TColgp_Array1OfVec & D2Poles,TColgp_Array1OfPnt2d & Poles2d,TColgp_Array1OfVec2d & DPoles2d,TColgp_Array1OfVec2d & D2Poles2d,TColStd_Array1OfReal & Weigths,TColStd_Array1OfReal & DWeigths,TColStd_Array1OfReal & D2Weigths);

		/****************** GetMinimalWeight ******************/
		%feature("compactdefaultargs") GetMinimalWeight;
		%feature("autodoc", "* Compute the minimal value of weight for each poles in all sections. This information is usefull to control error in rational approximation. Warning: Used only if <self> IsRational
	:param Weigths:
	:type Weigths: TColStd_Array1OfReal
	:rtype: void") GetMinimalWeight;
		virtual void GetMinimalWeight (TColStd_Array1OfReal & Weigths);

		/****************** GetTolerance ******************/
		%feature("compactdefaultargs") GetTolerance;
		%feature("autodoc", "* Returns the tolerance to reach in approximation to satisfy. BoundTol error at the Boundary AngleTol tangent error at the Boundary (in radian) SurfTol error inside the surface.
	:param BoundTol:
	:type BoundTol: float
	:param SurfTol:
	:type SurfTol: float
	:param AngleTol:
	:type AngleTol: float
	:param Tol3d:
	:type Tol3d: TColStd_Array1OfReal
	:rtype: void") GetTolerance;
		virtual void GetTolerance (const Standard_Real BoundTol,const Standard_Real SurfTol,const Standard_Real AngleTol,TColStd_Array1OfReal & Tol3d);

		/****************** Intervals ******************/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "* Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accomodate for the parameters. i.e. T.Length() > NbIntervals()
	:param T:
	:type T: TColStd_Array1OfReal
	:param S:
	:type S: GeomAbs_Shape
	:rtype: void") Intervals;
		virtual void Intervals (TColStd_Array1OfReal & T,const GeomAbs_Shape S);

		/****************** IsRational ******************/
		%feature("compactdefaultargs") IsRational;
		%feature("autodoc", "* Returns if the sections are rationnal or not
	:rtype: bool") IsRational;
		virtual Standard_Boolean IsRational ();

		/****************** Knots ******************/
		%feature("compactdefaultargs") Knots;
		%feature("autodoc", "* get the Knots of the section
	:param TKnots:
	:type TKnots: TColStd_Array1OfReal
	:rtype: void") Knots;
		virtual void Knots (TColStd_Array1OfReal & TKnots);

		/****************** MaximalSection ******************/
		%feature("compactdefaultargs") MaximalSection;
		%feature("autodoc", "* Returns the length of the greater section. This information is usefull to G1's control. Warning: With an little value, approximation can be slower.
	:rtype: float") MaximalSection;
		virtual Standard_Real MaximalSection ();

		/****************** Mults ******************/
		%feature("compactdefaultargs") Mults;
		%feature("autodoc", "* get the Multplicities of the section
	:param TMults:
	:type TMults: TColStd_Array1OfInteger
	:rtype: void") Mults;
		virtual void Mults (TColStd_Array1OfInteger & TMults);

		/****************** Nb2dCurves ******************/
		%feature("compactdefaultargs") Nb2dCurves;
		%feature("autodoc", "* get the number of 2d curves to approximate.
	:rtype: int") Nb2dCurves;
		virtual Standard_Integer Nb2dCurves ();

		/****************** NbIntervals ******************/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "* Returns the number of intervals for continuity <S>. May be one if Continuity(me) >= <S>
	:param S:
	:type S: GeomAbs_Shape
	:rtype: int") NbIntervals;
		virtual Standard_Integer NbIntervals (const GeomAbs_Shape S);

		/****************** Resolution ******************/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "* Returns the resolutions in the sub-space 2d <Index> This information is usfull to find an good tolerance in 2d approximation.
	:param Index:
	:type Index: int
	:param Tol:
	:type Tol: float
	:param TolU:
	:type TolU: float
	:param TolV:
	:type TolV: float
	:rtype: void") Resolution;
		virtual void Resolution (const Standard_Integer Index,const Standard_Real Tol,Standard_Real &OutValue,Standard_Real &OutValue);

		/****************** SectionShape ******************/
		%feature("compactdefaultargs") SectionShape;
		%feature("autodoc", "* get the format of an section
	:param NbPoles:
	:type NbPoles: int
	:param NbKnots:
	:type NbKnots: int
	:param Degree:
	:type Degree: int
	:rtype: void") SectionShape;
		virtual void SectionShape (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);

		/****************** SetInterval ******************/
		%feature("compactdefaultargs") SetInterval;
		%feature("autodoc", "* Sets the bounds of the parametric interval on the fonction This determines the derivatives in these values if the function is not Cn.
	:param First:
	:type First: float
	:param Last:
	:type Last: float
	:rtype: void") SetInterval;
		virtual void SetInterval (const Standard_Real First,const Standard_Real Last);

		/****************** SetTolerance ******************/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "* Is usefull, if (me) have to run numerical algorithm to perform D0, D1 or D2
	:param Tol3d:
	:type Tol3d: float
	:param Tol2d:
	:type Tol2d: float
	:rtype: void") SetTolerance;
		virtual void SetTolerance (const Standard_Real Tol3d,const Standard_Real Tol2d);

};


%make_alias(Approx_SweepFunction)

%extend Approx_SweepFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */
class Approx_HArray1OfGTrsf2d : public  Approx_Array1OfGTrsf2d, public Standard_Transient {
  public:
    Approx_HArray1OfGTrsf2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Approx_HArray1OfGTrsf2d(const Standard_Integer theLower, const Standard_Integer theUpper, const  Approx_Array1OfGTrsf2d::value_type& theValue);
    Approx_HArray1OfGTrsf2d(const  Approx_Array1OfGTrsf2d& theOther);
    const  Approx_Array1OfGTrsf2d& Array1();
     Approx_Array1OfGTrsf2d& ChangeArray1();
};
%make_alias(Approx_HArray1OfGTrsf2d)


class Approx_HArray1OfAdHSurface : public  Approx_Array1OfAdHSurface, public Standard_Transient {
  public:
    Approx_HArray1OfAdHSurface(const Standard_Integer theLower, const Standard_Integer theUpper);
    Approx_HArray1OfAdHSurface(const Standard_Integer theLower, const Standard_Integer theUpper, const  Approx_Array1OfAdHSurface::value_type& theValue);
    Approx_HArray1OfAdHSurface(const  Approx_Array1OfAdHSurface& theOther);
    const  Approx_Array1OfAdHSurface& Array1();
     Approx_Array1OfAdHSurface& ChangeArray1();
};
%make_alias(Approx_HArray1OfAdHSurface)


/* harray2 classes */
/* hsequence classes */
