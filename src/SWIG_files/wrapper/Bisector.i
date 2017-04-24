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
%module (package="OCC") Bisector

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


%include Bisector_headers.i


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

%rename(bisector) Bisector;
class Bisector {
	public:
		%feature("compactdefaultargs") IsConvex;
		%feature("autodoc", "	:param Cu:
	:type Cu: Handle_Geom2d_Curve &
	:param Sign:
	:type Sign: float
	:rtype: bool
") IsConvex;
		static Standard_Boolean IsConvex (const Handle_Geom2d_Curve & Cu,const Standard_Real Sign);
};


%extend Bisector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Bisector_Bisec;
class Bisector_Bisec {
	public:
		%feature("compactdefaultargs") Bisector_Bisec;
		%feature("autodoc", "	:rtype: None
") Bisector_Bisec;
		 Bisector_Bisec ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the bisecting line between the curves <Cu1> and <Cu2>. <oncurve> is True if the point <P> is common to <Cu1> and <Cu2>.

	:param Cu1:
	:type Cu1: Handle_Geom2d_Curve &
	:param Cu2:
	:type Cu2: Handle_Geom2d_Curve &
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param ajointype:
	:type ajointype: GeomAbs_JoinType
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu1,const Handle_Geom2d_Curve & Cu2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const GeomAbs_JoinType ajointype,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the bisecting line between the curve <Cu1> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.

	:param Cu:
	:type Cu: Handle_Geom2d_Curve &
	:param Pnt:
	:type Pnt: Handle_Geom2d_Point &
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu,const Handle_Geom2d_Point & Pnt,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the bisecting line between the curve <Cu> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.

	:param Pnt:
	:type Pnt: Handle_Geom2d_Point &
	:param Cu:
	:type Cu: Handle_Geom2d_Curve &
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Point & Pnt,const Handle_Geom2d_Curve & Cu,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the bisecting line between the two points <Pnt1> and <Pnt2>.

	:param Pnt1:
	:type Pnt1: Handle_Geom2d_Point &
	:param Pnt2:
	:type Pnt2: Handle_Geom2d_Point &
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance: default value is 0.0
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Point & Pnt1,const Handle_Geom2d_Point & Pnt2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance = 0.0,const Standard_Boolean oncurve = Standard_True);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Returns the Curve of <self>.

	:rtype: Handle_Geom2d_TrimmedCurve
") Value;
		Handle_Geom2d_TrimmedCurve Value ();
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	* Returns the Curve of <self>.

	:rtype: Handle_Geom2d_TrimmedCurve
") ChangeValue;
		Handle_Geom2d_TrimmedCurve ChangeValue ();
};


%extend Bisector_Bisec {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Bisector_Curve;
class Bisector_Curve : public Geom2d_Curve {
	public:
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		virtual Standard_Real Parameter (const gp_Pnt2d & P);
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "	:rtype: bool
") IsExtendAtStart;
		virtual Standard_Boolean IsExtendAtStart ();
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "	:rtype: bool
") IsExtendAtEnd;
		virtual Standard_Boolean IsExtendAtEnd ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.

	:rtype: int
") NbIntervals;
		virtual Standard_Integer NbIntervals ();
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "	* Returns the first parameter of the current interval.

	:param Index:
	:type Index: int
	:rtype: float
") IntervalFirst;
		virtual Standard_Real IntervalFirst (const Standard_Integer Index);
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "	* Returns the last parameter of the current interval.

	:param Index:
	:type Index: int
	:rtype: float
") IntervalLast;
		virtual Standard_Real IntervalLast (const Standard_Integer Index);
};


%extend Bisector_Curve {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Bisector_Curve(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Bisector_Curve::Handle_Bisector_Curve %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Bisector_Curve;
class Handle_Bisector_Curve : public Handle_Geom2d_Curve {

    public:
        // constructors
        Handle_Bisector_Curve();
        Handle_Bisector_Curve(const Handle_Bisector_Curve &aHandle);
        Handle_Bisector_Curve(const Bisector_Curve *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bisector_Curve DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bisector_Curve {
    Bisector_Curve* _get_reference() {
    return (Bisector_Curve*)$self->Access();
    }
};

%extend Handle_Bisector_Curve {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Bisector_Curve {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Bisector_FunctionH;
class Bisector_FunctionH : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Bisector_FunctionH;
		%feature("autodoc", "	:param C2:
	:type C2: Handle_Geom2d_Curve &
	:param P1:
	:type P1: gp_Pnt2d
	:param T1:
	:type T1: gp_Vec2d
	:rtype: None
") Bisector_FunctionH;
		 Bisector_FunctionH (const Handle_Geom2d_Curve & C2,const gp_Pnt2d & P1,const gp_Vec2d & T1);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the values of the Functions for the variable <X>.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the values of the functions and the derivatives for the variable <X>.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Bisector_FunctionH {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Bisector_FunctionInter;
class Bisector_FunctionInter : public math_FunctionWithDerivative {
	public:
		%feature("compactdefaultargs") Bisector_FunctionInter;
		%feature("autodoc", "	:rtype: None
") Bisector_FunctionInter;
		 Bisector_FunctionInter ();
		%feature("compactdefaultargs") Bisector_FunctionInter;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Bis1:
	:type Bis1: Handle_Bisector_Curve &
	:param Bis2:
	:type Bis2: Handle_Bisector_Curve &
	:rtype: None
") Bisector_FunctionInter;
		 Bisector_FunctionInter (const Handle_Geom2d_Curve & C,const Handle_Bisector_Curve & Bis1,const Handle_Bisector_Curve & Bis2);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:param Bis1:
	:type Bis1: Handle_Bisector_Curve &
	:param Bis2:
	:type Bis2: Handle_Bisector_Curve &
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Curve & C,const Handle_Bisector_Curve & Bis1,const Handle_Bisector_Curve & Bis2);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	* Computes the values of the Functions for the variable <X>.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:rtype: bool
") Value;
		Standard_Boolean Value (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "	:param X:
	:type X: float
	:param D:
	:type D: float &
	:rtype: bool
") Derivative;
		Standard_Boolean Derivative (const Standard_Real X,Standard_Real &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the values of the functions and the derivatives for the variable <X>.

	:param X:
	:type X: float
	:param F:
	:type F: float &
	:param D:
	:type D: float &
	:rtype: bool
") Values;
		Standard_Boolean Values (const Standard_Real X,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Bisector_FunctionInter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Bisector_Inter;
class Bisector_Inter : public IntRes2d_Intersection {
	public:
		%feature("compactdefaultargs") Bisector_Inter;
		%feature("autodoc", "	:rtype: None
") Bisector_Inter;
		 Bisector_Inter ();
		%feature("compactdefaultargs") Bisector_Inter;
		%feature("autodoc", "	* Intersection between 2 curves. C1 separates the element A and B. C2 separates the elements C et D. If B an C have the same geometry. <ComunElement> Has to be True. It Permits an optimiztion of the computation.

	:param C1:
	:type C1: Bisector_Bisec &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: Bisector_Bisec &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:param ComunElement:
	:type ComunElement: bool
	:rtype: None
") Bisector_Inter;
		 Bisector_Inter (const Bisector_Bisec & C1,const IntRes2d_Domain & D1,const Bisector_Bisec & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol,const Standard_Boolean ComunElement);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Intersection between 2 curves. C1 separates the element A and B. C2 separates the elements C et D. If B an C have the same geometry. <ComunElement> Has to be True. It Permits an optimiztion of the computation.

	:param C1:
	:type C1: Bisector_Bisec &
	:param D1:
	:type D1: IntRes2d_Domain &
	:param C2:
	:type C2: Bisector_Bisec &
	:param D2:
	:type D2: IntRes2d_Domain &
	:param TolConf:
	:type TolConf: float
	:param Tol:
	:type Tol: float
	:param ComunElement:
	:type ComunElement: bool
	:rtype: None
") Perform;
		void Perform (const Bisector_Bisec & C1,const IntRes2d_Domain & D1,const Bisector_Bisec & C2,const IntRes2d_Domain & D2,const Standard_Real TolConf,const Standard_Real Tol,const Standard_Boolean ComunElement);
};


%extend Bisector_Inter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Bisector_PointOnBis;
class Bisector_PointOnBis {
	public:
		%feature("compactdefaultargs") Bisector_PointOnBis;
		%feature("autodoc", "	:rtype: None
") Bisector_PointOnBis;
		 Bisector_PointOnBis ();
		%feature("compactdefaultargs") Bisector_PointOnBis;
		%feature("autodoc", "	:param Param1:
	:type Param1: float
	:param Param2:
	:type Param2: float
	:param ParamBis:
	:type ParamBis: float
	:param Distance:
	:type Distance: float
	:param Point:
	:type Point: gp_Pnt2d
	:rtype: None
") Bisector_PointOnBis;
		 Bisector_PointOnBis (const Standard_Real Param1,const Standard_Real Param2,const Standard_Real ParamBis,const Standard_Real Distance,const gp_Pnt2d & Point);
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") ParamOnC1;
		void ParamOnC1 (const Standard_Real Param);
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") ParamOnC2;
		void ParamOnC2 (const Standard_Real Param);
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", "	:param Param:
	:type Param: float
	:rtype: None
") ParamOnBis;
		void ParamOnBis (const Standard_Real Param);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:param Distance:
	:type Distance: float
	:rtype: None
") Distance;
		void Distance (const Standard_Real Distance);
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "	:param Infinite:
	:type Infinite: bool
	:rtype: None
") IsInfinite;
		void IsInfinite (const Standard_Boolean Infinite);
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") Point;
		void Point (const gp_Pnt2d & P);
		%feature("compactdefaultargs") ParamOnC1;
		%feature("autodoc", "	:rtype: float
") ParamOnC1;
		Standard_Real ParamOnC1 ();
		%feature("compactdefaultargs") ParamOnC2;
		%feature("autodoc", "	:rtype: float
") ParamOnC2;
		Standard_Real ParamOnC2 ();
		%feature("compactdefaultargs") ParamOnBis;
		%feature("autodoc", "	:rtype: float
") ParamOnBis;
		Standard_Real ParamOnBis ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	:rtype: float
") Distance;
		Standard_Real Distance ();
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "	:rtype: gp_Pnt2d
") Point;
		gp_Pnt2d Point ();
		%feature("compactdefaultargs") IsInfinite;
		%feature("autodoc", "	:rtype: bool
") IsInfinite;
		Standard_Boolean IsInfinite ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:rtype: None
") Dump;
		void Dump ();
};


%extend Bisector_PointOnBis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Bisector_PolyBis;
class Bisector_PolyBis {
	public:
		%feature("compactdefaultargs") Bisector_PolyBis;
		%feature("autodoc", "	:rtype: None
") Bisector_PolyBis;
		 Bisector_PolyBis ();
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param Point:
	:type Point: Bisector_PointOnBis &
	:rtype: None
") Append;
		void Append (const Bisector_PointOnBis & Point);
		%feature("compactdefaultargs") Length;
		%feature("autodoc", "	:rtype: int
") Length;
		Standard_Integer Length ();
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: Bisector_PointOnBis
") Value;
		const Bisector_PointOnBis & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: Bisector_PointOnBis
") First;
		const Bisector_PointOnBis & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: Bisector_PointOnBis
") Last;
		const Bisector_PointOnBis & Last ();
		%feature("compactdefaultargs") Interval;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: int
") Interval;
		Standard_Integer Interval (const Standard_Real U);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
};


%extend Bisector_PolyBis {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Bisector_BisecAna;
class Bisector_BisecAna : public Bisector_Curve {
	public:
		%feature("compactdefaultargs") Bisector_BisecAna;
		%feature("autodoc", "	:rtype: None
") Bisector_BisecAna;
		 Bisector_BisecAna ();
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the bisecting line between the curves <Cu1> and <Cu2>. <oncurve> is True if the point <P> is common to <Cu1> and <Cu2>.

	:param Cu1:
	:type Cu1: Handle_Geom2d_Curve &
	:param Cu2:
	:type Cu2: Handle_Geom2d_Curve &
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param jointype:
	:type jointype: GeomAbs_JoinType
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu1,const Handle_Geom2d_Curve & Cu2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const GeomAbs_JoinType jointype,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the bisecting line between the curve <Cu1> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.

	:param Cu:
	:type Cu: Handle_Geom2d_Curve &
	:param Pnt:
	:type Pnt: Handle_Geom2d_Point &
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu,const Handle_Geom2d_Point & Pnt,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the bisecting line between the curve <Cu> and the point <Pnt>. <oncurve> is True if the point <P> is the point <Pnt>.

	:param Pnt:
	:type Pnt: Handle_Geom2d_Point &
	:param Cu:
	:type Cu: Handle_Geom2d_Curve &
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance:
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Point & Pnt,const Handle_Geom2d_Curve & Cu,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance,const Standard_Boolean oncurve = Standard_True);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the bisecting line between the two points <Pnt1> and <Pnt2>.

	:param Pnt1:
	:type Pnt1: Handle_Geom2d_Point &
	:param Pnt2:
	:type Pnt2: Handle_Geom2d_Point &
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param Sense:
	:type Sense: float
	:param Tolerance: default value is 0.0
	:type Tolerance: float
	:param oncurve: default value is Standard_True
	:type oncurve: bool
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Point & Pnt1,const Handle_Geom2d_Point & Pnt2,const gp_Pnt2d & P,const gp_Vec2d & V1,const gp_Vec2d & V2,const Standard_Real Sense,const Standard_Real Tolerance = 0.0,const Standard_Boolean oncurve = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param bisector:
	:type bisector: Handle_Geom2d_TrimmedCurve &
	:rtype: None
") Init;
		void Init (const Handle_Geom2d_TrimmedCurve & bisector);
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "	:rtype: bool
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart ();
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "	:rtype: bool
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd ();
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "	* Trim <self> by a domain defined by the curve <Cu>. This domain is the set of the points which are nearest from <Cu> than the extremitis of <Cu>.

	:param Cu:
	:type Cu: Handle_Geom2d_Curve &
	:rtype: None
") SetTrim;
		void SetTrim (const Handle_Geom2d_Curve & Cu);
		%feature("compactdefaultargs") SetTrim;
		%feature("autodoc", "	* Trim <self> by a domain defined by uf and ul

	:param uf:
	:type uf: float
	:param ul:
	:type ul: float
	:rtype: None
") SetTrim;
		void SetTrim (const Standard_Real uf,const Standard_Real ul);
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "	* Returns the order of continuity of the curve. Raised if N < 0.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Geometry
") Copy;
		Handle_Geom2d_Geometry Copy ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Geom2dCurve;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Curve
") Geom2dCurve;
		Handle_Geom2d_Curve Geom2dCurve ();
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		Standard_Real Parameter (const gp_Pnt2d & P);
		%feature("compactdefaultargs") ParameterOfStartPoint;
		%feature("autodoc", "	:rtype: float
") ParameterOfStartPoint;
		Standard_Real ParameterOfStartPoint ();
		%feature("compactdefaultargs") ParameterOfEndPoint;
		%feature("autodoc", "	:rtype: float
") ParameterOfEndPoint;
		Standard_Real ParameterOfEndPoint ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.

	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "	* Returns the first parameter of the current interval.

	:param Index:
	:type Index: int
	:rtype: float
") IntervalFirst;
		Standard_Real IntervalFirst (const Standard_Integer Index);
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "	* Returns the last parameter of the current interval.

	:param Index:
	:type Index: int
	:rtype: float
") IntervalLast;
		Standard_Real IntervalLast (const Standard_Integer Index);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param Deep: default value is 0
	:type Deep: int
	:param Offset: default value is 0
	:type Offset: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);
};


%extend Bisector_BisecAna {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Bisector_BisecAna(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Bisector_BisecAna::Handle_Bisector_BisecAna %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Bisector_BisecAna;
class Handle_Bisector_BisecAna : public Handle_Bisector_Curve {

    public:
        // constructors
        Handle_Bisector_BisecAna();
        Handle_Bisector_BisecAna(const Handle_Bisector_BisecAna &aHandle);
        Handle_Bisector_BisecAna(const Bisector_BisecAna *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bisector_BisecAna DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bisector_BisecAna {
    Bisector_BisecAna* _get_reference() {
    return (Bisector_BisecAna*)$self->Access();
    }
};

%extend Handle_Bisector_BisecAna {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Bisector_BisecAna {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Bisector_BisecCC;
class Bisector_BisecCC : public Bisector_Curve {
	public:
		%feature("compactdefaultargs") Bisector_BisecCC;
		%feature("autodoc", "	:rtype: None
") Bisector_BisecCC;
		 Bisector_BisecCC ();
		%feature("compactdefaultargs") Bisector_BisecCC;
		%feature("autodoc", "	* Constructs the bisector between the curves <Cu1> and <Cu2>. //! <Side1> (resp <Side2>) = 1 if the bisector curve is on the left of <Cu1> (resp <Cu2>) else <Side1> (resp <Side2>) = -1. //! the Bisector is trimmed by the Point <Origin>. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.

	:param Cu1:
	:type Cu1: Handle_Geom2d_Curve &
	:param Cu2:
	:type Cu2: Handle_Geom2d_Curve &
	:param Side1:
	:type Side1: float
	:param Side2:
	:type Side2: float
	:param Origin:
	:type Origin: gp_Pnt2d
	:param DistMax: default value is 500
	:type DistMax: float
	:rtype: None
") Bisector_BisecCC;
		 Bisector_BisecCC (const Handle_Geom2d_Curve & Cu1,const Handle_Geom2d_Curve & Cu2,const Standard_Real Side1,const Standard_Real Side2,const gp_Pnt2d & Origin,const Standard_Real DistMax = 500);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Computes the bisector between the curves <Cu1> and <Cu2>. //! <Side1> (resp <Side2>) = 1 if the bisector curve is on the left of <Cu1> (resp <Cu2>) else <Side1> (resp <Side2>) = -1. //! the Bisector is trimmed by the Point <Origin>. //! <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.

	:param Cu1:
	:type Cu1: Handle_Geom2d_Curve &
	:param Cu2:
	:type Cu2: Handle_Geom2d_Curve &
	:param Side1:
	:type Side1: float
	:param Side2:
	:type Side2: float
	:param Origin:
	:type Origin: gp_Pnt2d
	:param DistMax: default value is 500
	:type DistMax: float
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu1,const Handle_Geom2d_Curve & Cu2,const Standard_Real Side1,const Standard_Real Side2,const gp_Pnt2d & Origin,const Standard_Real DistMax = 500);
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "	:rtype: bool
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart ();
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "	:rtype: bool
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "	* Returns the order of continuity of the curve. Raised if N < 0.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("compactdefaultargs") ChangeGuide;
		%feature("autodoc", "	* The parameter on <self> is linked to the parameter on the first curve. This method creates the same bisector where the curves are inversed.

	:rtype: Handle_Bisector_BisecCC
") ChangeGuide;
		Handle_Bisector_BisecCC ChangeGuide ();
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Geometry
") Copy;
		Handle_Geom2d_Geometry Copy ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Transformation of a geometric object. This tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.

	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "	* Returns the first parameter of the current interval.

	:param Index:
	:type Index: int
	:rtype: float
") IntervalFirst;
		Standard_Real IntervalFirst (const Standard_Integer Index);
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "	* Returns the last parameter of the current interval.

	:param Index:
	:type Index: int
	:rtype: float
") IntervalLast;
		Standard_Real IntervalLast (const Standard_Integer Index);
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity ();
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") ValueAndDist;
		%feature("autodoc", "	* Returns the point of parameter U. Computes the distance between the current point and the two curves I separate. Computes the parameters on each curve corresponding of the projection of the current point.

	:param U:
	:type U: float
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:param Distance:
	:type Distance: float &
	:rtype: gp_Pnt2d
") ValueAndDist;
		gp_Pnt2d ValueAndDist (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") ValueByInt;
		%feature("autodoc", "	* Returns the point of parameter U. Computes the distance between the current point and the two curves I separate. Computes the parameters on each curve corresponding of the projection of the current point.

	:param U:
	:type U: float
	:param U1:
	:type U1: float &
	:param U2:
	:type U2: float &
	:param Distance:
	:type Distance: float &
	:rtype: gp_Pnt2d
") ValueByInt;
		gp_Pnt2d ValueByInt (const Standard_Real U,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
		%feature("compactdefaultargs") LinkBisCurve;
		%feature("autodoc", "	* Returns the parameter on the curve1 of the projection of the point of parameter U on <self>.

	:param U:
	:type U: float
	:rtype: float
") LinkBisCurve;
		Standard_Real LinkBisCurve (const Standard_Real U);
		%feature("compactdefaultargs") LinkCurveBis;
		%feature("autodoc", "	* Returns the reciproque of LinkBisCurve.

	:param U:
	:type U: float
	:rtype: float
") LinkCurveBis;
		Standard_Real LinkCurveBis (const Standard_Real U);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		Standard_Real Parameter (const gp_Pnt2d & P);
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "	:param IndCurve:
	:type IndCurve: int
	:rtype: Handle_Geom2d_Curve
") Curve;
		Handle_Geom2d_Curve Curve (const Standard_Integer IndCurve);
		%feature("compactdefaultargs") Polygon;
		%feature("autodoc", "	:rtype: Bisector_PolyBis
") Polygon;
		const Bisector_PolyBis & Polygon ();
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param Deep: default value is 0
	:type Deep: int
	:param Offset: default value is 0
	:type Offset: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);
};


%extend Bisector_BisecCC {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Bisector_BisecCC(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Bisector_BisecCC::Handle_Bisector_BisecCC %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Bisector_BisecCC;
class Handle_Bisector_BisecCC : public Handle_Bisector_Curve {

    public:
        // constructors
        Handle_Bisector_BisecCC();
        Handle_Bisector_BisecCC(const Handle_Bisector_BisecCC &aHandle);
        Handle_Bisector_BisecCC(const Bisector_BisecCC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bisector_BisecCC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bisector_BisecCC {
    Bisector_BisecCC* _get_reference() {
    return (Bisector_BisecCC*)$self->Access();
    }
};

%extend Handle_Bisector_BisecCC {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Bisector_BisecCC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Bisector_BisecPC;
class Bisector_BisecPC : public Bisector_Curve {
	public:
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "	:rtype: None
") Bisector_BisecPC;
		 Bisector_BisecPC ();
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "	* Constructs the bisector between the point <P> and the curve <Cu>. <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.

	:param Cu:
	:type Cu: Handle_Geom2d_Curve &
	:param P:
	:type P: gp_Pnt2d
	:param Side:
	:type Side: float
	:param DistMax: default value is 500
	:type DistMax: float
	:rtype: None
") Bisector_BisecPC;
		 Bisector_BisecPC (const Handle_Geom2d_Curve & Cu,const gp_Pnt2d & P,const Standard_Real Side,const Standard_Real DistMax = 500);
		%feature("compactdefaultargs") Bisector_BisecPC;
		%feature("autodoc", "	* Constructs the bisector between the point <P> and the curve <Cu> Trimmed by <UMin> and <UMax> <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. Warning: the bisector is supposed all over defined between <UMin> and <UMax>.

	:param Cu:
	:type Cu: Handle_Geom2d_Curve &
	:param P:
	:type P: gp_Pnt2d
	:param Side:
	:type Side: float
	:param UMin:
	:type UMin: float
	:param UMax:
	:type UMax: float
	:rtype: None
") Bisector_BisecPC;
		 Bisector_BisecPC (const Handle_Geom2d_Curve & Cu,const gp_Pnt2d & P,const Standard_Real Side,const Standard_Real UMin,const Standard_Real UMax);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Construct the bisector between the point <P> and the curve <Cu>. <Side> = 1. if the bisector curve is on the Left of <Cu> else <Side> = -1. <DistMax> is used to trim the bisector.The distance between the points of the bisector and <Cu> is smaller than <DistMax>.

	:param Cu:
	:type Cu: Handle_Geom2d_Curve &
	:param P:
	:type P: gp_Pnt2d
	:param Side:
	:type Side: float
	:param DistMax: default value is 500
	:type DistMax: float
	:rtype: None
") Perform;
		void Perform (const Handle_Geom2d_Curve & Cu,const gp_Pnt2d & P,const Standard_Real Side,const Standard_Real DistMax = 500);
		%feature("compactdefaultargs") IsExtendAtStart;
		%feature("autodoc", "	* Returns True if the bisector is extended at start.

	:rtype: bool
") IsExtendAtStart;
		Standard_Boolean IsExtendAtStart ();
		%feature("compactdefaultargs") IsExtendAtEnd;
		%feature("autodoc", "	* Returns True if the bisector is extended at end.

	:rtype: bool
") IsExtendAtEnd;
		Standard_Boolean IsExtendAtEnd ();
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "	* Changes the direction of parametrization of <self>. The orientation of the curve is modified. If the curve is bounded the StartPoint of the initial curve becomes the EndPoint of the reversed curve and the EndPoint of the initial curve becomes the StartPoint of the reversed curve.

	:rtype: None
") Reverse;
		void Reverse ();
		%feature("compactdefaultargs") ReversedParameter;
		%feature("autodoc", "	* Returns the parameter on the reversed curve for the point of parameter U on <self>.

	:param U:
	:type U: float
	:rtype: float
") ReversedParameter;
		Standard_Real ReversedParameter (const Standard_Real U);
		%feature("compactdefaultargs") Copy;
		%feature("autodoc", "	:rtype: Handle_Geom2d_Geometry
") Copy;
		Handle_Geom2d_Geometry Copy ();
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Transformation of a geometric object. This tansformation can be a translation, a rotation, a symmetry, a scaling or a complex transformation obtained by combination of the previous elementaries transformations.

	:param T:
	:type T: gp_Trsf2d
	:rtype: None
") Transform;
		void Transform (const gp_Trsf2d & T);
		%feature("compactdefaultargs") IsCN;
		%feature("autodoc", "	* Returns the order of continuity of the curve. Raised if N < 0.

	:param N:
	:type N: int
	:rtype: bool
") IsCN;
		Standard_Boolean IsCN (const Standard_Integer N);
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "	* Value of the first parameter.

	:rtype: float
") FirstParameter;
		Standard_Real FirstParameter ();
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "	* Value of the last parameter.

	:rtype: float
") LastParameter;
		Standard_Real LastParameter ();
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") Continuity;
		GeomAbs_Shape Continuity ();
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "	* If necessary, breaks the curve in intervals of continuity <C1>. And returns the number of intervals.

	:rtype: int
") NbIntervals;
		Standard_Integer NbIntervals ();
		%feature("compactdefaultargs") IntervalFirst;
		%feature("autodoc", "	* Returns the first parameter of the current interval.

	:param Index:
	:type Index: int
	:rtype: float
") IntervalFirst;
		Standard_Real IntervalFirst (const Standard_Integer Index);
		%feature("compactdefaultargs") IntervalLast;
		%feature("autodoc", "	* Returns the last parameter of the current interval.

	:param Index:
	:type Index: int
	:rtype: float
") IntervalLast;
		Standard_Real IntervalLast (const Standard_Integer Index);
		%feature("compactdefaultargs") IntervalContinuity;
		%feature("autodoc", "	:rtype: GeomAbs_Shape
") IntervalContinuity;
		GeomAbs_Shape IntervalContinuity ();
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "	:rtype: bool
") IsClosed;
		Standard_Boolean IsClosed ();
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "	:rtype: bool
") IsPeriodic;
		Standard_Boolean IsPeriodic ();
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Returns the distance between the point of parameter U on <self> and my point or my curve.

	:param U:
	:type U: float
	:rtype: float
") Distance;
		Standard_Real Distance (const Standard_Real U);
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:rtype: None
") D0;
		void D0 (const Standard_Real U,gp_Pnt2d & P);
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V:
	:type V: gp_Vec2d
	:rtype: None
") D1;
		void D1 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V);
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:rtype: None
") D2;
		void D2 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2);
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "	:param U:
	:type U: float
	:param P:
	:type P: gp_Pnt2d
	:param V1:
	:type V1: gp_Vec2d
	:param V2:
	:type V2: gp_Vec2d
	:param V3:
	:type V3: gp_Vec2d
	:rtype: None
") D3;
		void D3 (const Standard_Real U,gp_Pnt2d & P,gp_Vec2d & V1,gp_Vec2d & V2,gp_Vec2d & V3);
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "	:param U:
	:type U: float
	:param N:
	:type N: int
	:rtype: gp_Vec2d
") DN;
		gp_Vec2d DN (const Standard_Real U,const Standard_Integer N);
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "	:param Deep: default value is 0
	:type Deep: int
	:param Offset: default value is 0
	:type Offset: int
	:rtype: None
") Dump;
		void Dump (const Standard_Integer Deep = 0,const Standard_Integer Offset = 0);
		%feature("compactdefaultargs") LinkBisCurve;
		%feature("autodoc", "	* Returns the parameter on the curve1 of the projection of the point of parameter U on <self>.

	:param U:
	:type U: float
	:rtype: float
") LinkBisCurve;
		Standard_Real LinkBisCurve (const Standard_Real U);
		%feature("compactdefaultargs") LinkCurveBis;
		%feature("autodoc", "	* Returns the reciproque of LinkBisCurve.

	:param U:
	:type U: float
	:rtype: float
") LinkCurveBis;
		Standard_Real LinkCurveBis (const Standard_Real U);
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "	* Returns the parameter on <self> corresponding to <P>.

	:param P:
	:type P: gp_Pnt2d
	:rtype: float
") Parameter;
		Standard_Real Parameter (const gp_Pnt2d & P);
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "	* Returns <True> if the bisector is empty.

	:rtype: bool
") IsEmpty;
		Standard_Boolean IsEmpty ();
};


%extend Bisector_BisecPC {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Bisector_BisecPC(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Bisector_BisecPC::Handle_Bisector_BisecPC %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Bisector_BisecPC;
class Handle_Bisector_BisecPC : public Handle_Bisector_Curve {

    public:
        // constructors
        Handle_Bisector_BisecPC();
        Handle_Bisector_BisecPC(const Handle_Bisector_BisecPC &aHandle);
        Handle_Bisector_BisecPC(const Bisector_BisecPC *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Bisector_BisecPC DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Bisector_BisecPC {
    Bisector_BisecPC* _get_reference() {
    return (Bisector_BisecPC*)$self->Access();
    }
};

%extend Handle_Bisector_BisecPC {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Bisector_BisecPC {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
