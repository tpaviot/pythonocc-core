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
%module (package="OCC") GCPnts

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

%include GCPnts_headers.i

/* typedefs */
/* end typedefs declaration */

/* public enums */
enum GCPnts_AbscissaType {
	GCPnts_LengthParametrized = 0,
	GCPnts_Parametrized = 1,
	GCPnts_AbsComposite = 2,
};

enum GCPnts_DeflectionType {
	GCPnts_Linear = 0,
	GCPnts_Circular = 1,
	GCPnts_Curved = 2,
	GCPnts_DefComposite = 3,
};

/* end public enums declaration */

%nodefaultctor GCPnts_AbscissaPoint;
class GCPnts_AbscissaPoint {
	public:
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)

Returns:
	static Standard_Real

Computes the length of the Curve <C>.") Length;
		static Standard_Real Length (Adaptor3d_Curve & C);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)

Returns:
	static Standard_Real

Computes the length of the Curve <C>.") Length;
		static Standard_Real Length (Adaptor2d_Curve2d & C);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Tol(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C> with the given tolerance.") Length;
		static Standard_Real Length (Adaptor3d_Curve & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Tol(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C> with the given tolerance.") Length;
		static Standard_Real Length (Adaptor2d_Curve2d & C,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C>.") Length;
		static Standard_Real Length (Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C>.") Length;
		static Standard_Real Length (Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	U1(Standard_Real)
	U2(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C> with the given tolerance.") Length;
		static Standard_Real Length (Adaptor3d_Curve & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	U1(Standard_Real)
	U2(Standard_Real)
	Tol(Standard_Real)

Returns:
	static Standard_Real

Computes the length of the Curve <C> with the given tolerance.  Constructs an empty algorithm. This function is used  
only for initializing a framework to compute the length  
of a curve (or a series of curves).  
Warning  
The function IsDone will return the value false after the use of this function.") Length;
		static Standard_Real Length (Adaptor2d_Curve2d & C,const Standard_Real U1,const Standard_Real U2,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Abscissa(Standard_Real)
	U0(Standard_Real)

Returns:
	None

the algorithm computes a point on a curve <Curve> at the  
         distance <Abscissa> from the point of parameter <U0>.") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0);
		%feature("autodoc", "Args:
	Tol(Standard_Real)
	C(Adaptor3d_Curve)
	Abscissa(Standard_Real)
	U0(Standard_Real)

Returns:
	None

the  algorithm computes a point on  a curve <Curve> at  
          the distance  <Abscissa> from the  point of parameter  
         <U0> with the given  tolerance.") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (const Standard_Real Tol,Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0);
		%feature("autodoc", "Args:
	Tol(Standard_Real)
	C(Adaptor2d_Curve2d)
	Abscissa(Standard_Real)
	U0(Standard_Real)

Returns:
	None

the  algorithm computes a point on  a curve <Curve> at  
          the distance  <Abscissa> from the  point of parameter  
         <U0> with the given  tolerance.") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (const Standard_Real Tol,Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Abscissa(Standard_Real)
	U0(Standard_Real)

Returns:
	None

the algorithm computes a point on a curve <Curve> at the  
         distance <Abscissa> from the point of parameter <U0>.") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Ui(Standard_Real)

Returns:
	None

the algorithm computes a point on a curve <Curve> at the  
         distance <Abscissa> from the point of parameter <U0>.  
         <Ui> is the starting value used in the iterative process  
         which find the solution, it must be close to the final  
         solution") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Ui(Standard_Real)

Returns:
	None

the algorithm computes a point on a curve <Curve> at the  
         distance <Abscissa> from the point of parameter <U0>.  
         <Ui> is the starting value used in the iterative process  
         which find the solution, it must be closed to the final  
         solution") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Ui(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

the algorithm computes a point on a curve <Curve> at the  
         distance <Abscissa> from the point of parameter <U0>.  
         <Ui> is the starting value used in the iterative process  
         which find the solution, it must be close to the final  
         solution") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Tol);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Abscissa(Standard_Real)
	U0(Standard_Real)
	Ui(Standard_Real)
	Tol(Standard_Real)

Returns:
	None

the algorithm computes a point on a curve <Curve> at the  
         distance <Abscissa> from the point of parameter <U0>.  
         <Ui> is the starting value used in the iterative process  
         which find the solution, it must be close to the final  
         solution") GCPnts_AbscissaPoint;
		 GCPnts_AbscissaPoint (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U0,const Standard_Real Ui,const Standard_Real Tol);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

True if the computation was successful, False otherwise.  
  IsDone is a protection against:  
-   non-convergence of the algorithm  
-   querying the results before computation.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the parameter on the curve of the point  
solution of this algorithm.  
Exceptions  
StdFail_NotDone if the computation was not  
successful, or was not done.") Parameter;
		Standard_Real Parameter ();
};


%feature("shadow") GCPnts_AbscissaPoint::~GCPnts_AbscissaPoint %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCPnts_AbscissaPoint {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCPnts_QuasiUniformAbscissa;
class GCPnts_QuasiUniformAbscissa {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty algorithm. To define the problem  
to be solved, use the function Initialize.") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbPoints(Standard_Integer)

Returns:
	None

Computes a uniform abscissa distribution of points  
-   on the curve C where Abscissa is the curvilinear distance between  
two consecutive points of the distribution.") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa (Adaptor3d_Curve & C,const Standard_Integer NbPoints);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbPoints(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Computes a uniform abscissa distribution of points  
  on the part of curve C limited by the two parameter values U1 and U2,  
    where Abscissa is the curvilinear distance between  
two consecutive points of the distribution.  
The first point of the distribution is either the origin of  
curve C or the point of parameter U1. The following  
points are computed such that the curvilinear  
distance between two consecutive points is equal to Abscissa.  
The last point of the distribution is either the end  
point of curve C or the point of parameter U2.  
However the curvilinear distance between this last  
point and the point just preceding it in the distribution  
is, of course, generally not equal to Abscissa.  
Use the function IsDone to verify that the  
computation was successful, the function NbPoints  
to obtain the number of points of the computed  
distribution, and the function Parameter to read the  
parameter of each point.  
Warning  
The roles of U1 and U2 are inverted if U1 > U2 .  
Warning  
C is an adapted curve, that is, an object which is an  
interface between:  
-   the services provided by either a 2D curve from  
  the package Geom2d (in the case of an  
  Adaptor2d_Curve2d curve) or a 3D curve from  
  the package Geom (in the case of an Adaptor3d_Curve curve),  
-   and those required on the curve by the computation algorithm.") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbPoints(Standard_Integer)

Returns:
	None

Initialize the algoritms with <C>, <NbPoints> and") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Integer NbPoints);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbPoints(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Initialize the algoritms with <C>, <Abscissa>, <U1>,  
         <U2>.") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbPoints(Standard_Integer)

Returns:
	None

Computes a uniform abscissa distribution of points on  
 the Curve2d <C>.  
 <NbPoints> defines the nomber of desired points.") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbPoints(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Computes a Uniform abscissa distribution of points  
 on a part of the Curve2d <C>.") GCPnts_QuasiUniformAbscissa;
		 GCPnts_QuasiUniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbPoints(Standard_Integer)

Returns:
	None

Initialize the algoritms with <C>, <NbPoints> and") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbPoints(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)

Returns:
	None

Initialize the algoritms with <C>, <Abscissa>, <U1>,  
         <U2>.") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the computation was successful.  
IsDone is a protection against:  
-   non-convergence of the algorithm  
-   querying the results before computation.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of points of the distribution  
computed by this algorithm.  
This value is either:  
-   the one imposed on the algorithm at the time of  
  construction (or initialization), or  
-   the one computed by the algorithm when the  
  curvilinear distance between two consecutive  
  points of the distribution is imposed on the  
  algorithm at the time of construction (or initialization).  
  Exceptions  
StdFail_NotDone if this algorithm has not been  
initialized, or if the computation was not successful.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the parameter of the point of index Index in  
the distribution computed by this algorithm.  
Warning  
Index must be greater than or equal to 1, and less  
than or equal to the number of points of the  
distribution. However, pay particular attention as this  
condition is not checked by this function.  
Exceptions  
StdFail_NotDone if this algorithm has not been  
initialized, or if the computation was not successful.") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);
};


%feature("shadow") GCPnts_QuasiUniformAbscissa::~GCPnts_QuasiUniformAbscissa %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCPnts_QuasiUniformAbscissa {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCPnts_QuasiUniformDeflection;
class GCPnts_QuasiUniformDeflection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty algorithm. To define the problem  
to be solved, use the function Initialize.") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Computes  a QuasiUniform Deflection distribution  
 of points on the Curve <C>.") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection (Adaptor3d_Curve & C,const Standard_Real Deflection,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Computes  a QuasiUniform Deflection distribution  
 of points on the Curve <C>.") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Computes a QuasiUniform Deflection distribution  
 of points on a part of the Curve <C>.") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Computes  a QuasiUniform Deflection distribution  
 of points on a part of the Curve <C>.  
This and the above algorithms compute a distribution of points:  
-   on the curve C, or  
-   on the part of curve C limited by the two  
  parameter values U1 and U2,  
where the deflection resulting from the distributed  
points is not greater than Deflection.  
The first point of the distribution is either the origin of  
curve C or the point of parameter U1. The last point  
of the distribution is either the end point of curve C or  
the point of parameter U2.  
Intermediate points of the distribution are built such  
that the deflection is not greater than Deflection.  
Using the following evaluation of the deflection:  
if Pi and Pj are two consecutive points of the  
distribution, respectively of parameter ui and uj on  
the curve, the deflection is the distance between:  
-   the mid-point of Pi and Pj (the center of the  
  chord joining these two points)  
-   and the point of mid-parameter of these two  
  points (the point of parameter [(ui+uj) / 2 ] on curve C).  
  Continuity, defaulted to GeomAbs_C1, gives the  
  degree of continuity of the curve C. (Note that C is an  
Adaptor3d_Curve or an Adaptor2d_Curve2d  
object, and does not know the degree of continuity of  
the underlying curve).  
Use the function IsDone to verify that the  
computation was successful, the function NbPoints  
to obtain the number of points of the computed  
distribution, and the function Parameter to read the  
parameter of each point.  
Warning  
-   The roles of U1 and U2 are inverted if U1 > U2.  
-   Derivative functions on the curve are called  
  according to Continuity. An error may occur if  
  Continuity is greater than the real degree of  
  continuity of the curve.  
Warning  
C is an adapted curve, i.e. an object which is an  
interface between:  
-   the services provided by either a 2D curve from  
  the package Geom2d (in the case of an  
  Adaptor2d_Curve2d curve) or a 3D curve from  
  the package Geom (in the case of an  
  Adaptor3d_Curve curve),  
-   and those required on the curve by the  
  computation algorithm.") GCPnts_QuasiUniformDeflection;
		 GCPnts_QuasiUniformDeflection (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Initialize the algoritms with <C>, <Deflection>") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Deflection,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Initialize the algoritms with <C>, <Deflection>") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Initialize the algoritms with <C>, <Deflection>,  
         <U1>,<U2>") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Continuity(GeomAbs_Shape)=GeomAbs_C1

Returns:
	None

Initialize  the  algoritms with <C>, <Deflection>,  
         -- <U1>,<U2>  
   This and the above algorithms initialize (or reinitialize)  
       this algorithm and compute a distribution of points:  
-   on the curve C, or  
-   on the part of curve C limited by the two  
  parameter values U1 and U2,  
where the deflection resulting from the distributed  
points is not greater than Deflection.  
The first point of the distribution is either the origin  
of curve C or the point of parameter U1. The last  
point of the distribution is either the end point of  
curve C or the point of parameter U2.  
Intermediate points of the distribution are built in  
such a way that the deflection is not greater than  
Deflection. Using the following evaluation of the deflection:  
if Pi and Pj are two consecutive points of the  
distribution, respectively of parameter ui and uj  
on the curve, the deflection is the distance between:  
-   the mid-point of Pi and Pj (the center of the  
  chord joining these two points)  
-   and the point of mid-parameter of these two  
  points (the point of parameter [(ui+uj) / 2 ] on curve C).  
  Continuity, defaulted to GeomAbs_C1, gives the  
degree of continuity of the curve C. (Note that C is  
an Adaptor3d_Curve or an  
Adaptor2d_Curve2d object, and does not know  
the degree of continuity of the underlying curve).  
Use the function IsDone to verify that the  
computation was successful, the function NbPoints  
to obtain the number of points of the computed  
distribution, and the function Parameter to read  
the parameter of each point.  
Warning  
-   The roles of U1 and U2 are inverted if U1 > U2.  
-   Derivative functions on the curve are called  
  according to Continuity. An error may occur if  
  Continuity is greater than the real degree of  
  continuity of the curve.  
Warning  
C is an adapted curve, i.e. an object which is an  
interface between:  
-   the services provided by either a 2D curve from  
  the package Geom2d (in the case of an  
  Adaptor2d_Curve2d curve) or a 3D curve from  
  the package Geom (in the case of an Adaptor3d_Curve curve),  
and those required on the curve by the computation algorithm.") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const GeomAbs_Shape Continuity = GeomAbs_C1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the computation was successful.  
IsDone is a protection against:  
-   non-convergence of the algorithm  
-   querying the results before computation.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of points of the distribution  
computed by this algorithm.  
Exceptions  
StdFail_NotDone if this algorithm has not been  
initialized, or if the computation was not successful.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the parameter of the point of index Index in  
the distribution computed by this algorithm.  
Warning  
Index must be greater than or equal to 1, and less  
than or equal to the number of points of the  
distribution. However, pay particular attention as this  
condition is not checked by this function.  
Exceptions  
StdFail_NotDone if this algorithm has not been  
initialized, or if the computation was not successful.") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

Returns the point of index Index in the distribution  
computed by this algorithm.  
Warning  
Index must be greater than or equal to 1, and less  
than or equal to the number of points of the  
distribution. However, pay particular attention as this  
condition is not checked by this function.  
Exceptions  
StdFail_NotDone if this algorithm has not been  
initialized, or if the computation was not successful.") Value;
		gp_Pnt Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the deflection between the curve and the  
polygon resulting from the points of the distribution  
computed by this algorithm.  
This is the value given to the algorithm at the time  
of construction (or initialization).  
Exceptions  
StdFail_NotDone if this algorithm has not been  
initialized, or if the computation was not successful.") Deflection;
		Standard_Real Deflection ();
};


%feature("shadow") GCPnts_QuasiUniformDeflection::~GCPnts_QuasiUniformDeflection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCPnts_QuasiUniformDeflection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCPnts_TangentialDeflection;
class GCPnts_TangentialDeflection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

No detailed docstring for this function.") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	AngularDeflection(Standard_Real)
	CurvatureDeflection(Standard_Real)
	MinimumOfPoints(Standard_Integer)=2
	UTol(Standard_Real)=1.0e-9

Returns:
	None

No detailed docstring for this function.") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection (const Adaptor3d_Curve & C,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	FirstParameter(Standard_Real)
	LastParameter(Standard_Real)
	AngularDeflection(Standard_Real)
	CurvatureDeflection(Standard_Real)
	MinimumOfPoints(Standard_Integer)=2
	UTol(Standard_Real)=1.0e-9

Returns:
	None

No detailed docstring for this function.") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection (const Adaptor3d_Curve & C,const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	AngularDeflection(Standard_Real)
	CurvatureDeflection(Standard_Real)
	MinimumOfPoints(Standard_Integer)=2
	UTol(Standard_Real)=1.0e-9

Returns:
	None

No detailed docstring for this function.") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection (const Adaptor2d_Curve2d & C,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	FirstParameter(Standard_Real)
	LastParameter(Standard_Real)
	AngularDeflection(Standard_Real)
	CurvatureDeflection(Standard_Real)
	MinimumOfPoints(Standard_Integer)=2
	UTol(Standard_Real)=1.0e-9

Returns:
	None

No detailed docstring for this function.") GCPnts_TangentialDeflection;
		 GCPnts_TangentialDeflection (const Adaptor2d_Curve2d & C,const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	AngularDeflection(Standard_Real)
	CurvatureDeflection(Standard_Real)
	MinimumOfPoints(Standard_Integer)=2
	UTol(Standard_Real)=1.0e-9

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	FirstParameter(Standard_Real)
	LastParameter(Standard_Real)
	AngularDeflection(Standard_Real)
	CurvatureDeflection(Standard_Real)
	MinimumOfPoints(Standard_Integer)=2
	UTol(Standard_Real)=1.0e-9

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor3d_Curve & C,const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	AngularDeflection(Standard_Real)
	CurvatureDeflection(Standard_Real)
	MinimumOfPoints(Standard_Integer)=2
	UTol(Standard_Real)=1.0e-9

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	FirstParameter(Standard_Real)
	LastParameter(Standard_Real)
	AngularDeflection(Standard_Real)
	CurvatureDeflection(Standard_Real)
	MinimumOfPoints(Standard_Integer)=2
	UTol(Standard_Real)=1.0e-9

Returns:
	None

No detailed docstring for this function.") Initialize;
		void Initialize (const Adaptor2d_Curve2d & C,const Standard_Real FirstParameter,const Standard_Real LastParameter,const Standard_Real AngularDeflection,const Standard_Real CurvatureDeflection,const Standard_Integer MinimumOfPoints = 2,const Standard_Real UTol = 1.0e-9);
		%feature("autodoc", "Args:
	thePnt(gp_Pnt)
	theParam(Standard_Real)
	theIsReplace(Standard_Boolean)=Standard_True

Returns:
	Standard_Integer

Add point to already calculated points (or replace existing)  
         Returns index of new added point  
          or founded with parametric tolerance (replaced if theIsReplace is true)") AddPoint;
		Standard_Integer AddPoint (const gp_Pnt & thePnt,const Standard_Real theParam,const Standard_Boolean theIsReplace = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	Standard_Real

No detailed docstring for this function.") Parameter;
		Standard_Real Parameter (const Standard_Integer I);
		%feature("autodoc", "Args:
	I(Standard_Integer)

Returns:
	gp_Pnt

No detailed docstring for this function.") Value;
		gp_Pnt Value (const Standard_Integer I);
};


%feature("shadow") GCPnts_TangentialDeflection::~GCPnts_TangentialDeflection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCPnts_TangentialDeflection {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCPnts_UniformAbscissa;
class GCPnts_UniformAbscissa {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

creation of a indefinite UniformAbscissa") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Abscissa(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Computes a uniform abscissa distribution of points on  
 the Curve <C>. Parameter Toler is equal Precision::Confusion by default.  
 It Is used for more precise calculation of curve length") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Abscissa(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Computes a Uniform abscissa distribution of points  
 on a part of the Curve <C>. Parameter Toler is equal Precision::Confusion by default.  
 It Is used for more precise calculation of curve length") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbPoints(Standard_Integer)
	Toler(Standard_Real)=- 1

Returns:
	None

Computes a uniform abscissa distribution of points on  
 the Curve <C>.  
 <NbPoints> defines the nomber of desired points.  
 Parameter Toler is equal Precision::Confusion by default.  
 It Is used for more precise calculation of curve length") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbPoints(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Computes a Uniform abscissa distribution of points  
 on a part of the Curve <C>.  
 Parameter Toler is equal Precision::Confusion by default.  
 It Is used for more precise calculation of curve length") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Abscissa(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Initialize the algoritms with <C>, <Abscissa>, <Toler>") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Abscissa(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Initialize the algoritms with <C>, <Abscissa>, <U1>,  
         <U2>, <Toler>") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Abscissa,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbPoints(Standard_Integer)
	Toler(Standard_Real)=- 1

Returns:
	None

Initialize the algoritms with <C>, <NbPoints>, <Toler> and") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	NbPoints(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Initialize the algoritms with <C>, <Abscissa>, <U1>,  
         <U2>, <Toler>.") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Abscissa(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Computes a uniform abscissa distribution of points on  
 the Curve2d <C>.  
 Parameter Toler is equal Precision::Confusion by default.  
 It Is used for more precise calculation of curve length") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Abscissa(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Computes a Uniform abscissa distribution of points  
 on a part of the Curve2d <C>.  
 Parameter Toler is equal Precision::Confusion by default.  
 It Is used for more precise calculation of curve length") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbPoints(Standard_Integer)
	Toler(Standard_Real)=- 1

Returns:
	None

Computes a uniform abscissa distribution of points on  
 the Curve2d <C>.  
 <NbPoints> defines the nomber of desired points.  
 Parameter Toler is equal Precision::Confusion by default.  
 It Is used for more precise calculation of curve length") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbPoints(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Computes a Uniform abscissa distribution of points  
 on a part of the Curve2d <C>.  
 Parameter Toler is equal Precision::Confusion by default.  
 It Is used for more precise calculation of curve length") GCPnts_UniformAbscissa;
		 GCPnts_UniformAbscissa (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Abscissa(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Initialize the algoritms with <C>, <Abscissa>, <Toler>") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Abscissa(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Initialize the algoritms with <C>, <Abscissa>, <U1>,  
         <U2>, <Toler>") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Abscissa,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbPoints(Standard_Integer)
	Toler(Standard_Real)=- 1

Returns:
	None

Initialize the algoritms with <C>, <NbPoints>, <Toler> and") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	NbPoints(Standard_Integer)
	U1(Standard_Real)
	U2(Standard_Real)
	Toler(Standard_Real)=- 1

Returns:
	None

Initialize the algoritms with <C>, <Abscissa>, <U1>,  
         <U2>, <Toler>.") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Integer NbPoints,const Standard_Real U1,const Standard_Real U2,const Standard_Real Toler = - 1);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

No detailed docstring for this function.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

No detailed docstring for this function.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

returns the computed Parameter of index <Index>.") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

returne the current abscissa  
ie the distance between two consecutive points") Abscissa;
		Standard_Real Abscissa ();
};


%feature("shadow") GCPnts_UniformAbscissa::~GCPnts_UniformAbscissa %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCPnts_UniformAbscissa {
	void _kill_pointed() {
		delete $self;
	}
};
%nodefaultctor GCPnts_UniformDeflection;
class GCPnts_UniformDeflection {
	public:
		%feature("autodoc", "Args:
	None
Returns:
	None

Constructs an empty algorithm. To define the problem  
to be solved, use the function Initialize.") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection ();
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Computes a uniform Deflection distribution of points on  
 the Curve <C>.  
 if <WithControl> is True,the algorithm controls the estimate  
 deflection") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Computes a uniform Deflection distribution of points on  
 the Curve <C>.  
 if <WithControl> is True,the algorithm controls the estimate  
 deflection") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Computes a Uniform Deflection distribution of points  
 on a part of the Curve <C>.  
 if <WithControl> is True,the algorithm controls the estimate  
 deflection") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Computes a Uniform Deflection distribution of points  
 on a part of the Curve <C>.  
 if <WithControl> is True,the algorithm controls the estimate  
 deflection") GCPnts_UniformDeflection;
		 GCPnts_UniformDeflection (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Initialize the algoritms with <C>, <Deflection>") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Initialize the algoritms with <C>, <Deflection>") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	C(Adaptor3d_Curve)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Initialize the algoritms with <C>, <Deflection>,  
         <U1>,<U2>") Initialize;
		void Initialize (Adaptor3d_Curve & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	C(Adaptor2d_Curve2d)
	Deflection(Standard_Real)
	U1(Standard_Real)
	U2(Standard_Real)
	WithControl(Standard_Boolean)=Standard_True

Returns:
	None

Initialize the algoritms with <C>, <Deflection>,  
         <U1>,<U2>  
This and the above methods initialize (or reinitialize) this algorithm and  
compute a distribution of points:  
-   on the curve C, or  
-   on the part of curve C limited by the two  
  parameter values U1 and U2,  
where the maximum distance between C and the  
polygon that results from the points of the  
distribution is not greater than Deflection.  
The first point of the distribution is either the origin  
of curve C or the point of parameter U1. The last  
point of the distribution is either the end point of  
curve C or the point of parameter U2. Intermediate  
points of the distribution are built using  
interpolations of segments of the curve limited at  
the 2nd degree. The construction ensures, in a first  
step, that the chordal deviation for this  
interpolation of the curve is less than or equal to  
Deflection. However, it does not ensure that the  
chordal deviation for the curve itself is less than or  
equal to Deflection. To do this a check is  
necessary, which may generate (second step)  
additional intermediate points. This check is time  
consuming, and can be avoided by setting  
WithControl to false. Note that by default  
WithControl is true and check is performed.  
Use the function IsDone to verify that the  
computation was successful, the function NbPoints  
to obtain the number of points of the computed  
distribution, and the function Parameter to read  
the parameter of each point.  
Warning  
-   C is necessary, 'C2' continuous. This property is  
  not checked at construction time.  
-   The roles of U1 and U2 are inverted if U1 > U2.  
  Warning  
C is an adapted curve, i.e. an object which is an interface between:  
-   the services provided by either a 2D curve from  
  the package Geom2d (in the case of an  
  Adaptor2d_Curve2d curve) or a 3D curve from  
  the package Geom (in the case of an Adaptor3d_Curve curve),  
-   and those required on the curve by the computation algorithm.") Initialize;
		void Initialize (Adaptor2d_Curve2d & C,const Standard_Real Deflection,const Standard_Real U1,const Standard_Real U2,const Standard_Boolean WithControl = Standard_True);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Boolean

Returns true if the computation was successful.  
IsDone is a protection against:  
-   non-convergence of the algorithm  
-   querying the results before computation.") IsDone;
		Standard_Boolean IsDone ();
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Integer

Returns the number of points of the distribution  
computed by this algorithm.  
Exceptions  
StdFail_NotDone if this algorithm has not been  
initialized, or if the computation was not successful.") NbPoints;
		Standard_Integer NbPoints ();
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	Standard_Real

Returns the parameter of the point of index Index in  
the distribution computed by this algorithm.  
Warning  
Index must be greater than or equal to 1, and less  
than or equal to the number of points of the  
distribution. However, pay particular attention as this  
condition is not checked by this function.  
Exceptions  
StdFail_NotDone if this algorithm has not been  
initialized, or if the computation was not successful.") Parameter;
		Standard_Real Parameter (const Standard_Integer Index);
		%feature("autodoc", "Args:
	Index(Standard_Integer)

Returns:
	gp_Pnt

Returns the point of index Index in the distribution  
computed by this algorithm.  
Warning  
Index must be greater than or equal to 1, and less  
than or equal to the number of points of the  
distribution. However, pay particular attention as this  
condition is not checked by this function.  
Exceptions  
StdFAil_NotDone if this algorithm has not been  
initialized, or if the computation was not successful.") Value;
		gp_Pnt Value (const Standard_Integer Index);
		%feature("autodoc", "Args:
	None
Returns:
	Standard_Real

Returns the deflection between the curve and the  
polygon resulting from the points of the distribution  
computed by this algorithm.  
This value is the one given to the algorithm at the  
time of construction (or initialization).  
Exceptions  
StdFail_NotDone if this algorithm has not been  
initialized, or if the computation was not successful.") Deflection;
		Standard_Real Deflection ();
};


%feature("shadow") GCPnts_UniformDeflection::~GCPnts_UniformDeflection %{
def __del__(self):
	try:
		self.thisown = False
		GarbageCollector.garbage.collect_object(self)
	except:
		pass
%}

%extend GCPnts_UniformDeflection {
	void _kill_pointed() {
		delete $self;
	}
};
