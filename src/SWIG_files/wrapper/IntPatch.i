/*
Copyright 2008-2025 Thomas Paviot (tpaviot@gmail.com)

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
%define INTPATCHDOCSTRING
"IntPatch module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_intpatch.html"
%enddef
%module (package="OCC.Core", docstring=INTPATCHDOCSTRING) IntPatch


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/EnumTemplates.i
%include ../common/Operators.i
%include ../common/OccHandle.i
%include ../common/IOStream.i
%include ../common/ArrayMacros.i


%{
#include<IntPatch_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<Intf_module.hxx>
#include<Adaptor3d_module.hxx>
#include<math_module.hxx>
#include<Adaptor2d_module.hxx>
#include<gp_module.hxx>
#include<IntSurf_module.hxx>
#include<BVH_module.hxx>
#include<Geom2d_module.hxx>
#include<GeomAbs_module.hxx>
#include<TColStd_module.hxx>
#include<Bnd_module.hxx>
#include<IntAna_module.hxx>
#include<Geom_module.hxx>
#include<Adaptor3d_module.hxx>
#include<Message_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import Intf.i
%import Adaptor3d.i
%import math.i
%import Adaptor2d.i
%import gp.i
%import IntSurf.i
%import BVH.i
%import Geom2d.i
%import GeomAbs.i
%import TColStd.i
%import Bnd.i
%import IntAna.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
enum IntPatch_IType {
	IntPatch_Lin = 0,
	IntPatch_Circle = 1,
	IntPatch_Ellipse = 2,
	IntPatch_Parabola = 3,
	IntPatch_Hyperbola = 4,
	IntPatch_Analytic = 5,
	IntPatch_Walking = 6,
	IntPatch_Restriction = 7,
};

enum IntPatch_SpecPntType {
	IntPatch_SPntNone = 0,
	IntPatch_SPntSeamU = 1,
	IntPatch_SPntSeamV = 2,
	IntPatch_SPntSeamUV = 3,
	IntPatch_SPntPoleSeamU = 4,
	IntPatch_SPntPole = 5,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IntPatch_IType(IntEnum):
	IntPatch_Lin = 0
	IntPatch_Circle = 1
	IntPatch_Ellipse = 2
	IntPatch_Parabola = 3
	IntPatch_Hyperbola = 4
	IntPatch_Analytic = 5
	IntPatch_Walking = 6
	IntPatch_Restriction = 7
IntPatch_Lin = IntPatch_IType.IntPatch_Lin
IntPatch_Circle = IntPatch_IType.IntPatch_Circle
IntPatch_Ellipse = IntPatch_IType.IntPatch_Ellipse
IntPatch_Parabola = IntPatch_IType.IntPatch_Parabola
IntPatch_Hyperbola = IntPatch_IType.IntPatch_Hyperbola
IntPatch_Analytic = IntPatch_IType.IntPatch_Analytic
IntPatch_Walking = IntPatch_IType.IntPatch_Walking
IntPatch_Restriction = IntPatch_IType.IntPatch_Restriction

class IntPatch_SpecPntType(IntEnum):
	IntPatch_SPntNone = 0
	IntPatch_SPntSeamU = 1
	IntPatch_SPntSeamV = 2
	IntPatch_SPntSeamUV = 3
	IntPatch_SPntPoleSeamU = 4
	IntPatch_SPntPole = 5
IntPatch_SPntNone = IntPatch_SpecPntType.IntPatch_SPntNone
IntPatch_SPntSeamU = IntPatch_SpecPntType.IntPatch_SPntSeamU
IntPatch_SPntSeamV = IntPatch_SpecPntType.IntPatch_SPntSeamV
IntPatch_SPntSeamUV = IntPatch_SpecPntType.IntPatch_SPntSeamUV
IntPatch_SPntPoleSeamU = IntPatch_SpecPntType.IntPatch_SPntPoleSeamU
IntPatch_SPntPole = IntPatch_SpecPntType.IntPatch_SPntPole
};
/* end python proxy for enums */

/* handles */
%wrap_handle(IntPatch_Line)
%wrap_handle(IntPatch_TheIWLineOfTheIWalking)
%wrap_handle(IntPatch_ALine)
%wrap_handle(IntPatch_GLine)
%wrap_handle(IntPatch_PointLine)
%wrap_handle(IntPatch_RLine)
%wrap_handle(IntPatch_WLine)
/* end handles declaration */

/* templates */
%template(IntPatch_SequenceOfIWLineOfTheIWalking) NCollection_Sequence<opencascade::handle<IntPatch_TheIWLineOfTheIWalking>>;

%extend NCollection_Sequence<opencascade::handle<IntPatch_TheIWLineOfTheIWalking>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntPatch_SequenceOfLine) NCollection_Sequence<opencascade::handle<IntPatch_Line>>;

%extend NCollection_Sequence<opencascade::handle<IntPatch_Line>> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntPatch_SequenceOfPathPointOfTheSOnBounds) NCollection_Sequence<IntPatch_ThePathPointOfTheSOnBounds>;

%extend NCollection_Sequence<IntPatch_ThePathPointOfTheSOnBounds> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntPatch_SequenceOfPoint) NCollection_Sequence<IntPatch_Point>;

%extend NCollection_Sequence<IntPatch_Point> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
%template(IntPatch_SequenceOfSegmentOfTheSOnBounds) NCollection_Sequence<IntPatch_TheSegmentOfTheSOnBounds>;

%extend NCollection_Sequence<IntPatch_TheSegmentOfTheSOnBounds> {
    // occt-800: NCollection_BaseSequence methods are not wrapped through
    // SWIG (its inner SeqNode has private new/delete). Re-export them per
    // instantiation so Python code can call .Size(), .Length(), .IsEmpty()
    // and use len() on every NCollection_Sequence<...>.
    size_t Size() const noexcept { return $self->Size(); }
    int Length() const noexcept { return $self->Length(); }
    bool IsEmpty() const noexcept { return $self->IsEmpty(); }
    %pythoncode {
    def __len__(self):
        return self.Size()
    }
};
/* end templates declaration */

/* typedefs */
typedef Intf_InterferencePolygon2d IntPatch_SearchPnt;
typedef NCollection_Sequence<opencascade::handle<IntPatch_TheIWLineOfTheIWalking>> IntPatch_SequenceOfIWLineOfTheIWalking;
typedef NCollection_Sequence<opencascade::handle<IntPatch_Line>> IntPatch_SequenceOfLine;
typedef NCollection_Sequence<IntPatch_ThePathPointOfTheSOnBounds> IntPatch_SequenceOfPathPointOfTheSOnBounds;
typedef NCollection_Sequence<IntPatch_Point> IntPatch_SequenceOfPoint;
typedef NCollection_Sequence<IntPatch_TheSegmentOfTheSOnBounds> IntPatch_SequenceOfSegmentOfTheSOnBounds;
/* end typedefs declaration */

/******************************
* class IntPatch_ALineToWLine *
******************************/
class IntPatch_ALineToWLine {
	public:
		/****** IntPatch_ALineToWLine::IntPatch_ALineToWLine ******/
		/****** md5 signature: 87d1f1fcb6ea732530fd1bd5fc44f31d ******/
		%feature("compactdefaultargs") IntPatch_ALineToWLine;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface
theNbPoints: int (optional, default to 200)

Return
-------
None

Description
-----------
Constructor.
") IntPatch_ALineToWLine;
		 IntPatch_ALineToWLine(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_Surface> & theS2, const int theNbPoints = 200);

		/****** IntPatch_ALineToWLine::MakeWLine ******/
		/****** md5 signature: f062bcbd1d605bff279a8df30247e297 ******/
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "
Parameters
----------
aline: IntPatch_ALine
theLines: IntPatch_Line

Return
-------
None

Description
-----------
Converts aline to the set of Walking-lines and adds them in theLines.
") MakeWLine;
		void MakeWLine(const opencascade::handle<IntPatch_ALine> & aline, NCollection_Sequence<opencascade::handle<IntPatch_Line>> & theLines);

		/****** IntPatch_ALineToWLine::MakeWLine ******/
		/****** md5 signature: fd3a2c5687d1a93fe0e3f5253151ab1a ******/
		%feature("compactdefaultargs") MakeWLine;
		%feature("autodoc", "
Parameters
----------
aline: IntPatch_ALine
paraminf: double
paramsup: double
theLines: IntPatch_Line

Return
-------
None

Description
-----------
Converts aline (limited by paraminf and paramsup) to the set of Walking-lines and adds them in theLines.
") MakeWLine;
		void MakeWLine(const opencascade::handle<IntPatch_ALine> & aline, const double paraminf, const double paramsup, NCollection_Sequence<opencascade::handle<IntPatch_Line>> & theLines);

		/****** IntPatch_ALineToWLine::SetTol3D ******/
		/****** md5 signature: 5d857c1ad9fdbc857081f6a5ac8f9f1a ******/
		%feature("compactdefaultargs") SetTol3D;
		%feature("autodoc", "
Parameters
----------
aT: double

Return
-------
None

Description
-----------
No available documentation.
") SetTol3D;
		void SetTol3D(const double aT);

		/****** IntPatch_ALineToWLine::SetTolOpenDomain ******/
		/****** md5 signature: 0ca430e774067f9c1ff6093f55e67f35 ******/
		%feature("compactdefaultargs") SetTolOpenDomain;
		%feature("autodoc", "
Parameters
----------
aT: double

Return
-------
None

Description
-----------
No available documentation.
") SetTolOpenDomain;
		void SetTolOpenDomain(const double aT);

		/****** IntPatch_ALineToWLine::SetTolTransition ******/
		/****** md5 signature: 811fe2bf1f71769ed36fbd8ae75ddd23 ******/
		%feature("compactdefaultargs") SetTolTransition;
		%feature("autodoc", "
Parameters
----------
aT: double

Return
-------
None

Description
-----------
No available documentation.
") SetTolTransition;
		void SetTolTransition(const double aT);

		/****** IntPatch_ALineToWLine::Tol3D ******/
		/****** md5 signature: cf50da21efbed6fecf997c2344f8a213 ******/
		%feature("compactdefaultargs") Tol3D;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tol3D;
		double Tol3D();

		/****** IntPatch_ALineToWLine::TolOpenDomain ******/
		/****** md5 signature: e5929702f7ecaed1bbba7662e382449a ******/
		%feature("compactdefaultargs") TolOpenDomain;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") TolOpenDomain;
		double TolOpenDomain();

		/****** IntPatch_ALineToWLine::TolTransition ******/
		/****** md5 signature: 689aed7d120906e01df5356c21010164 ******/
		%feature("compactdefaultargs") TolTransition;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") TolTransition;
		double TolTransition();

};


%extend IntPatch_ALineToWLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPatch_ArcFunction *
*****************************/
class IntPatch_ArcFunction : public math_FunctionWithDerivative {
	public:
		/****** IntPatch_ArcFunction::IntPatch_ArcFunction ******/
		/****** md5 signature: 3c48209a96a54328182da5862a3c6930 ******/
		%feature("compactdefaultargs") IntPatch_ArcFunction;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ArcFunction;
		 IntPatch_ArcFunction();

		/****** IntPatch_ArcFunction::Arc ******/
		/****** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****** IntPatch_ArcFunction::Derivative ******/
		/****** md5 signature: 5b661e723f14c67a734d7bc68bb6cabf ******/
		%feature("compactdefaultargs") Derivative;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
D: double

Description
-----------
No available documentation.
") Derivative;
		bool Derivative(const double X, Standard_Real &OutValue);

		/****** IntPatch_ArcFunction::GetStateNumber ******/
		/****** md5 signature: 476bd80c2b35cb038599a2aed9b23901 ******/
		%feature("compactdefaultargs") GetStateNumber;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") GetStateNumber;
		int GetStateNumber();

		/****** IntPatch_ArcFunction::LastComputedPoint ******/
		/****** md5 signature: 151ab65e948ef31dff9bbbd66f058a30 ******/
		%feature("compactdefaultargs") LastComputedPoint;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the point, which has been computed while the last calling Value() method.
") LastComputedPoint;
		const gp_Pnt LastComputedPoint();

		/****** IntPatch_ArcFunction::NbSamples ******/
		/****** md5 signature: 2fabaf64e989ab636a03df74249efff3 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		int NbSamples();

		/****** IntPatch_ArcFunction::Quadric ******/
		/****** md5 signature: 412540fe449bd77bf89b8085f1fe1701 ******/
		%feature("compactdefaultargs") Quadric;
		%feature("autodoc", "Return
-------
IntSurf_Quadric

Description
-----------
No available documentation.
") Quadric;
		const IntSurf_Quadric & Quadric();

		/****** IntPatch_ArcFunction::Set ******/
		/****** md5 signature: 70ab888f546bf04b92c8032f862436af ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_ArcFunction::Set ******/
		/****** md5 signature: fe1f4e54b6d838c88f545f7975616591 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_ArcFunction::SetQuadric ******/
		/****** md5 signature: d5b0476ad1478596d5971650634ac6de ******/
		%feature("compactdefaultargs") SetQuadric;
		%feature("autodoc", "
Parameters
----------
Q: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") SetQuadric;
		void SetQuadric(const IntSurf_Quadric & Q);

		/****** IntPatch_ArcFunction::Surface ******/
		/****** md5 signature: d36dc8d293d03901e5a1cace2e167115 ******/
		%feature("compactdefaultargs") Surface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") Surface;
		const opencascade::handle<Adaptor3d_Surface> & Surface();

		/****** IntPatch_ArcFunction::Valpoint ******/
		/****** md5 signature: 99bddfd2a1889564e4bfb796166a1e65 ******/
		%feature("compactdefaultargs") Valpoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Valpoint;
		const gp_Pnt Valpoint(const int Index);

		/****** IntPatch_ArcFunction::Value ******/
		/****** md5 signature: 2fdd0f48acb4882f76bbbe432a18ac3a ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double

Description
-----------
No available documentation.
") Value;
		bool Value(const double X, Standard_Real &OutValue);

		/****** IntPatch_ArcFunction::Values ******/
		/****** md5 signature: 44ea1ebbd1c996779e93f28435817e28 ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: double

Return
-------
F: double
D: double

Description
-----------
No available documentation.
") Values;
		bool Values(const double X, Standard_Real &OutValue, Standard_Real &OutValue);

};


%extend IntPatch_ArcFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPatch_BVHTraversal *
******************************/
class IntPatch_BVHTraversal : public BVH_PairTraverse<double,3> {
	public:
		class TrianglePair {};
		/****** IntPatch_BVHTraversal::IntPatch_BVHTraversal ******/
		/****** md5 signature: 8fcdc1d556078dc876d3b7c34954b448 ******/
		%feature("compactdefaultargs") IntPatch_BVHTraversal;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty traversal object.
") IntPatch_BVHTraversal;
		 IntPatch_BVHTraversal();

		/****** IntPatch_BVHTraversal::Accept ******/
		/****** md5 signature: 4eb443563ab2aeadcca7dcc66efe9424 ******/
		%feature("compactdefaultargs") Accept;
		%feature("autodoc", "
Parameters
----------
theIndex1: int
theIndex2: int

Return
-------
bool

Description
-----------
Accepts a pair of leaf elements and stores their original indices. 
Input parameter: theIndex1 0-based index in the first BVH set 
Input parameter: theIndex2 0-based index in the second BVH set 
Return: true (always accepts the pair).
") Accept;
		virtual bool Accept(const int theIndex1, const int theIndex2);

		/****** IntPatch_BVHTraversal::Clear ******/
		/****** md5 signature: 75abd67f132413fc11c19201aabf1126 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the collected pairs.
") Clear;
		void Clear();

		/****** IntPatch_BVHTraversal::Pairs ******/
		/****** md5 signature: 75dbd8310ba74eb76bf5f6b741a3985a ******/
		%feature("compactdefaultargs") Pairs;
		%feature("autodoc", "Return
-------
NCollection_DynamicArray<TrianglePair>

Description
-----------
Returns the collected triangle pairs.
") Pairs;
		const NCollection_DynamicArray<TrianglePair> & Pairs();

		/****** IntPatch_BVHTraversal::Perform ******/
		/****** md5 signature: 5dcc08fc8b28b02793d4ba0a4093dd66 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
theSet1: IntPatch_PolyhedronBVH
theSet2: IntPatch_PolyhedronBVH
theSelfInterference: bool (optional, default to false)

Return
-------
int

Description
-----------
Performs BVH traversal and collects candidate triangle pairs. 
Input parameter: theSet1 BVH set for the first polyhedron 
Input parameter: theSet2 BVH set for the second polyhedron 
Input parameter: theSelfInterference if true, skip pairs where first index >= second index (used for self-intersection where we don't want to test same pair twice) 
Return: number of collected pairs.
") Perform;
		int Perform(IntPatch_PolyhedronBVH & theSet1, IntPatch_PolyhedronBVH & theSet2, bool theSelfInterference = false);

		/****** IntPatch_BVHTraversal::RejectNode ******/
		/****** md5 signature: 2fe89c633e9600dde9e0e67c0b83d31b ******/
		%feature("compactdefaultargs") RejectNode;
		%feature("autodoc", "
Parameters
----------
theCMin1: BVH_Vec3d
theCMax1: BVH_Vec3d
theCMin2: BVH_Vec3d
theCMax2: BVH_Vec3d

Return
-------
theMetric: double

Description
-----------
Rejects pair of nodes if their bounding boxes don't overlap. 
Input parameter: theCMin1 minimum corner of the first node's bounding box 
Input parameter: theCMax1 maximum corner of the first node's bounding box 
Input parameter: theCMin2 minimum corner of the second node's bounding box 
Input parameter: theCMax2 maximum corner of the second node's bounding box @param[out] theMetric unused metric parameter 
Return: true if the pair should be rejected (no overlap), false otherwise.
") RejectNode;
		virtual bool RejectNode(const BVH_Vec3d & theCMin1, const BVH_Vec3d & theCMax1, const BVH_Vec3d & theCMin2, const BVH_Vec3d & theCMax2, Standard_Real &OutValue);

};


%extend IntPatch_BVHTraversal {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPatch_CSFunction *
****************************/
class IntPatch_CSFunction : public math_FunctionSetWithDerivatives {
	public:
		/****** IntPatch_CSFunction::IntPatch_CSFunction ******/
		/****** md5 signature: 9e70dc8abfeefce3aafed780da3fdb0b ******/
		%feature("compactdefaultargs") IntPatch_CSFunction;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
C: Adaptor2d_Curve2d
S2: Adaptor3d_Surface

Return
-------
None

Description
-----------
S1 is the surface on which the intersection is searched. C is a curve on the surface S2.
") IntPatch_CSFunction;
		 IntPatch_CSFunction(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor2d_Curve2d> & C, const opencascade::handle<Adaptor3d_Surface> & S2);

		/****** IntPatch_CSFunction::AuxillarCurve ******/
		/****** md5 signature: 147cf00266b63350d4a9e7d2edb61e1b ******/
		%feature("compactdefaultargs") AuxillarCurve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") AuxillarCurve;
		const opencascade::handle<Adaptor2d_Curve2d> & AuxillarCurve();

		/****** IntPatch_CSFunction::AuxillarSurface ******/
		/****** md5 signature: b291a5935dc6f37ed5922990c14f0acd ******/
		%feature("compactdefaultargs") AuxillarSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") AuxillarSurface;
		const opencascade::handle<Adaptor3d_Surface> & AuxillarSurface();

		/****** IntPatch_CSFunction::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** IntPatch_CSFunction::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		int NbEquations();

		/****** IntPatch_CSFunction::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** IntPatch_CSFunction::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		const gp_Pnt Point();

		/****** IntPatch_CSFunction::Root ******/
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Root;
		double Root();

		/****** IntPatch_CSFunction::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** IntPatch_CSFunction::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend IntPatch_CSFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPatch_CurvIntSurf *
*****************************/
class IntPatch_CurvIntSurf {
	public:
		/****** IntPatch_CurvIntSurf::IntPatch_CurvIntSurf ******/
		/****** md5 signature: 81d075556cf5e01f4df98af832aba7db ******/
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
W: double
F: IntPatch_CSFunction
TolTangency: double
MarginCoef: double (optional, default to 0.0)

Return
-------
None

Description
-----------
compute the solution point with the close point MarginCoef is the coefficient for extension of UV bounds. Ex., UFirst -= MarginCoef*(ULast-UFirst).
") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf(const double U, const double V, const double W, const IntPatch_CSFunction & F, const double TolTangency, const double MarginCoef = 0.0);

		/****** IntPatch_CurvIntSurf::IntPatch_CurvIntSurf ******/
		/****** md5 signature: 3e8479644088d3a73b64ee723c86f58d ******/
		%feature("compactdefaultargs") IntPatch_CurvIntSurf;
		%feature("autodoc", "
Parameters
----------
F: IntPatch_CSFunction
TolTangency: double

Return
-------
None

Description
-----------
initialize the parameters to compute the solution.
") IntPatch_CurvIntSurf;
		 IntPatch_CurvIntSurf(const IntPatch_CSFunction & F, const double TolTangency);

		/****** IntPatch_CurvIntSurf::Function ******/
		/****** md5 signature: 14b4caa41fcc22a8994bca1ef859d9cb ******/
		%feature("compactdefaultargs") Function;
		%feature("autodoc", "Return
-------
IntPatch_CSFunction

Description
-----------
return the math function which is used to compute the intersection.
") Function;
		IntPatch_CSFunction & Function();

		/****** IntPatch_CurvIntSurf::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the creation completed without failure.
") IsDone;
		bool IsDone();

		/****** IntPatch_CurvIntSurf::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsEmpty;
		bool IsEmpty();

		/****** IntPatch_CurvIntSurf::ParameterOnCurve ******/
		/****** md5 signature: 57f5295e1d0243d744a43fcea3cf7388 ******/
		%feature("compactdefaultargs") ParameterOnCurve;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") ParameterOnCurve;
		double ParameterOnCurve();

		/****** IntPatch_CurvIntSurf::ParameterOnSurface ******/
		/****** md5 signature: 7f31eb7c473aecf695130da66c37cc8a ******/
		%feature("compactdefaultargs") ParameterOnSurface;
		%feature("autodoc", "
Parameters
----------

Return
-------
U: double
V: double

Description
-----------
No available documentation.
") ParameterOnSurface;
		void ParameterOnSurface(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_CurvIntSurf::Perform ******/
		/****** md5 signature: 32414faba82bb6739429b692c1146008 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
U: double
V: double
W: double
Rsnld: math_FunctionSetRoot
u0: double
v0: double
u1: double
v1: double
w0: double
w1: double

Return
-------
None

Description
-----------
compute the solution it's possible to write to optimize: IntImp_IntCS inter(S1,C1,Toltangency) math_FunctionSetRoot rsnld(Inter.function()) while ...{ u=... v=... w=... inter.Perform(u,v,w,rsnld) } or IntImp_IntCS inter(Toltangency) inter.SetSurface(S); math_FunctionSetRoot rsnld(Inter.function()) while ...{ C=... inter.SetCurve(C); u=... v=... w=... inter.Perform(u,v,w,rsnld) }.
") Perform;
		void Perform(const double U, const double V, const double W, math_FunctionSetRoot & Rsnld, const double u0, const double v0, const double u1, const double v1, const double w0, const double w1);

		/****** IntPatch_CurvIntSurf::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
returns the intersection point The exception NotDone is raised if IsDone is false. The exception DomainError is raised if IsEmpty is true.
") Point;
		const gp_Pnt Point();

};


%extend IntPatch_CurvIntSurf {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPatch_HCurve2dTool *
******************************/
class IntPatch_HCurve2dTool {
	public:
		/****** IntPatch_HCurve2dTool::BSpline ******/
		/****** md5 signature: 1151b84776305bc0a5c8aaee6f50252d ******/
		%feature("compactdefaultargs") BSpline;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BSplineCurve>

Description
-----------
No available documentation.
") BSpline;
		static opencascade::handle<Geom2d_BSplineCurve> BSpline(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Bezier ******/
		/****** md5 signature: 55afc4c0fc79e07de6077214558af461 ******/
		%feature("compactdefaultargs") Bezier;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
opencascade::handle<Geom2d_BezierCurve>

Description
-----------
No available documentation.
") Bezier;
		static opencascade::handle<Geom2d_BezierCurve> Bezier(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Circle ******/
		/****** md5 signature: 3e4b216e090c5747e712418f4fa66d2c ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Circ2d

Description
-----------
No available documentation.
") Circle;
		static gp_Circ2d Circle(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Continuity ******/
		/****** md5 signature: 93cd5f75c1ce867aba7a7f12421275f0 ******/
		%feature("compactdefaultargs") Continuity;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
GeomAbs_Shape

Description
-----------
No available documentation.
") Continuity;
		static GeomAbs_Shape Continuity(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::D0 ******/
		/****** md5 signature: 647414f13617b3951aae630a40485c89 ******/
		%feature("compactdefaultargs") D0;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve.
") D0;
		static void D0(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P);

		/****** IntPatch_HCurve2dTool::D1 ******/
		/****** md5 signature: 4cb67a5cf245485839e9a70d333c71a4 ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d
V: gp_Vec2d

Return
-------
None

Description
-----------
Computes the point of parameter U on the curve with its first derivative. Raised if the continuity of the current interval is not C1.
") D1;
		static void D1(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P, gp_Vec2d & V);

		/****** IntPatch_HCurve2dTool::D2 ******/
		/****** md5 signature: 7c8af9f7178b95531f0269176827b3b6 ******/
		%feature("compactdefaultargs") D2;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first and second derivatives V1 and V2. Raised if the continuity of the current interval is not C2.
") D2;
		static void D2(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2);

		/****** IntPatch_HCurve2dTool::D3 ******/
		/****** md5 signature: 0d5beba8194fcecf902b3af0a6115ccc ******/
		%feature("compactdefaultargs") D3;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
P: gp_Pnt2d
V1: gp_Vec2d
V2: gp_Vec2d
V3: gp_Vec2d

Return
-------
None

Description
-----------
Returns the point P of parameter U, the first, the second and the third derivative. Raised if the continuity of the current interval is not C3.
") D3;
		static void D3(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, gp_Pnt2d & P, gp_Vec2d & V1, gp_Vec2d & V2, gp_Vec2d & V3);

		/****** IntPatch_HCurve2dTool::DN ******/
		/****** md5 signature: c6ea8b27aa6fb1aef473b0dca6417f7f ******/
		%feature("compactdefaultargs") DN;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double
N: int

Return
-------
gp_Vec2d

Description
-----------
The returned vector gives the value of the derivative for the order of derivation N. Raised if the continuity of the current interval is not CN. Raised if N < 1.
") DN;
		static gp_Vec2d DN(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U, const int N);

		/****** IntPatch_HCurve2dTool::Ellipse ******/
		/****** md5 signature: 9ddecf68838c4598b17a43e7ee186e6e ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Elips2d

Description
-----------
No available documentation.
") Ellipse;
		static gp_Elips2d Ellipse(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::FirstParameter ******/
		/****** md5 signature: ba7dcc17bbcf3ad13ca428fccb4ee295 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") FirstParameter;
		static double FirstParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::GetType ******/
		/****** md5 signature: 29ec5067d7e913f214c553444ec99b6a ******/
		%feature("compactdefaultargs") GetType;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
GeomAbs_CurveType

Description
-----------
Returns the type of the curve in the current interval: Line, Circle, Ellipse, Hyperbola, Parabola, BezierCurve, BSplineCurve, OtherCurve.
") GetType;
		static GeomAbs_CurveType GetType(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Hyperbola ******/
		/****** md5 signature: d710d90c07a9bd6c6e8e1ba3fc1c92bf ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Hypr2d

Description
-----------
No available documentation.
") Hyperbola;
		static gp_Hypr2d Hyperbola(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Intervals ******/
		/****** md5 signature: f078f296545d3dd38144048dfca10469 ******/
		%feature("compactdefaultargs") Intervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
T: TColStd_Array1OfReal
S: GeomAbs_Shape

Return
-------
None

Description
-----------
Stores in <T> the parameters bounding the intervals of continuity <S>. //! The array must provide enough room to accommodate for the parameters. i.e. T.Length() > NbIntervals().
") Intervals;
		static void Intervals(const opencascade::handle<Adaptor2d_Curve2d> & C, TColStd_Array1OfReal & T, const GeomAbs_Shape S);

		/****** IntPatch_HCurve2dTool::IsClosed ******/
		/****** md5 signature: 2e919d2de6d38bdb8500e5fc59dfa301 ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsClosed;
		static bool IsClosed(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::IsPeriodic ******/
		/****** md5 signature: 758f5d32a3e81a7d0cac59086cea6b55 ******/
		%feature("compactdefaultargs") IsPeriodic;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
No available documentation.
") IsPeriodic;
		static bool IsPeriodic(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::LastParameter ******/
		/****** md5 signature: c3783a6df82a0f461b6597f54b9d3b85 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") LastParameter;
		static double LastParameter(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Line ******/
		/****** md5 signature: cc50bf5bbcfff1340d1951ad804f481d ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Lin2d

Description
-----------
No available documentation.
") Line;
		static gp_Lin2d Line(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::NbIntervals ******/
		/****** md5 signature: f892a17175c7690de7e2ba8d55659419 ******/
		%feature("compactdefaultargs") NbIntervals;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
S: GeomAbs_Shape

Return
-------
int

Description
-----------
Returns the number of intervals for continuity <S>. May be one if Continuity(myclass) >= <S>.
") NbIntervals;
		static int NbIntervals(const opencascade::handle<Adaptor2d_Curve2d> & C, const GeomAbs_Shape S);

		/****** IntPatch_HCurve2dTool::NbSamples ******/
		/****** md5 signature: 1f8960c481dbbc037f35e98ce7810cf6 ******/
		%feature("compactdefaultargs") NbSamples;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U0: double
U1: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamples;
		static int NbSamples(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U0, const double U1);

		/****** IntPatch_HCurve2dTool::Parabola ******/
		/****** md5 signature: 638d7ecde6dd9f67180eadf45347f22e ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
gp_Parab2d

Description
-----------
No available documentation.
") Parabola;
		static gp_Parab2d Parabola(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Period ******/
		/****** md5 signature: d675e32257b292584f21996f45e5f086 ******/
		%feature("compactdefaultargs") Period;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
No available documentation.
") Period;
		static double Period(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HCurve2dTool::Resolution ******/
		/****** md5 signature: cc00f63e5558970ed6d6f4b56109c915 ******/
		%feature("compactdefaultargs") Resolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
R3d: double

Return
-------
double

Description
-----------
Returns the parametric resolution corresponding to the real space resolution <R3d>.
") Resolution;
		static double Resolution(const opencascade::handle<Adaptor2d_Curve2d> & C, const double R3d);

		/****** IntPatch_HCurve2dTool::Value ******/
		/****** md5 signature: 7945b3785f38356578b9cc7bd81af491 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
U: double

Return
-------
gp_Pnt2d

Description
-----------
Computes the point of parameter U on the curve.
") Value;
		static gp_Pnt2d Value(const opencascade::handle<Adaptor2d_Curve2d> & C, const double U);

};


%extend IntPatch_HCurve2dTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPatch_HInterTool *
****************************/
class IntPatch_HInterTool {
	public:
		/****** IntPatch_HInterTool::IntPatch_HInterTool ******/
		/****** md5 signature: a36982be4506681216df42cd27bbd921 ******/
		%feature("compactdefaultargs") IntPatch_HInterTool;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_HInterTool;
		 IntPatch_HInterTool();

		/****** IntPatch_HInterTool::Bounds ******/
		/****** md5 signature: 07986cc0e0af847c43b39e0235c77229 ******/
		%feature("compactdefaultargs") Bounds;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
Ufirst: double
Ulast: double

Description
-----------
Returns the parametric limits on the arc C. These limits must be finite: they are either the real limits of the arc, for a finite arc, or a bounding box for an infinite arc.
") Bounds;
		static void Bounds(const opencascade::handle<Adaptor2d_Curve2d> & C, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_HInterTool::HasBeenSeen ******/
		/****** md5 signature: 44bbf4fbff6c28b3475ddb0f3449c036 ******/
		%feature("compactdefaultargs") HasBeenSeen;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
Returns True if all the intersection point and edges are known on the Arc. The intersection point are given as vertices. The intersection edges are given as intervals between two vertices.
") HasBeenSeen;
		static bool HasBeenSeen(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::HasFirstPoint ******/
		/****** md5 signature: 360ca3bc3b2f75f5e2f258b2876ce518 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int

Return
-------
IndFirst: int

Description
-----------
Returns True when the segment of range Index is not open at the left side. In that case, IndFirst is the range in the list intersection points (see NbPoints) of the one which defines the left bound of the segment. Otherwise, the method has to return False, and IndFirst has no meaning.
") HasFirstPoint;
		static bool HasFirstPoint(const opencascade::handle<Adaptor2d_Curve2d> & C, const int Index, Standard_Integer &OutValue);

		/****** IntPatch_HInterTool::HasLastPoint ******/
		/****** md5 signature: 91704bbc1a9ed32af7a65ea023df717b ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int

Return
-------
IndLast: int

Description
-----------
Returns True when the segment of range Index is not open at the right side. In that case, IndLast is the range in the list intersection points (see NbPoints) of the one which defines the right bound of the segment. Otherwise, the method has to return False, and IndLast has no meaning.
") HasLastPoint;
		static bool HasLastPoint(const opencascade::handle<Adaptor2d_Curve2d> & C, const int Index, Standard_Integer &OutValue);

		/****** IntPatch_HInterTool::IsAllSolution ******/
		/****** md5 signature: e7a3425bf7c6c5a502fec8afcc168f27 ******/
		%feature("compactdefaultargs") IsAllSolution;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
bool

Description
-----------
Returns True when the whole restriction is solution of the intersection problem.
") IsAllSolution;
		static bool IsAllSolution(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::IsVertex ******/
		/****** md5 signature: d6d7896c9b46a0a6b548ec3ad2a4cdcc ******/
		%feature("compactdefaultargs") IsVertex;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int

Return
-------
bool

Description
-----------
Returns True if the intersection point of range Index corresponds with a vertex on the arc A.
") IsVertex;
		static bool IsVertex(const opencascade::handle<Adaptor2d_Curve2d> & C, const int Index);

		/****** IntPatch_HInterTool::NbPoints ******/
		/****** md5 signature: c43cb411d56d25ce2289f3e953f120ca ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
Returns the number of intersection points on the arc A.
") NbPoints;
		static int NbPoints(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::NbSamplePoints ******/
		/****** md5 signature: 41d1149d171870cea84c2e92a78e7f72 ******/
		%feature("compactdefaultargs") NbSamplePoints;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
int

Description
-----------
No available documentation.
") NbSamplePoints;
		int NbSamplePoints(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_HInterTool::NbSamplesOnArc ******/
		/****** md5 signature: 0b53e931233dc5eb5aa65c4f03845afa ******/
		%feature("compactdefaultargs") NbSamplesOnArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
returns the number of points which is used to make a sample on the arc. this number is a function of the Surface and the CurveOnSurface complexity.
") NbSamplesOnArc;
		static int NbSamplesOnArc(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_HInterTool::NbSamplesU ******/
		/****** md5 signature: 113907439d309bff36ab3cf1a00b7ae6 ******/
		%feature("compactdefaultargs") NbSamplesU;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
u1: double
u2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesU;
		static int NbSamplesU(const opencascade::handle<Adaptor3d_Surface> & S, const double u1, const double u2);

		/****** IntPatch_HInterTool::NbSamplesV ******/
		/****** md5 signature: 42faef83bc52935522b9fdcc450fc180 ******/
		%feature("compactdefaultargs") NbSamplesV;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
v1: double
v2: double

Return
-------
int

Description
-----------
No available documentation.
") NbSamplesV;
		static int NbSamplesV(const opencascade::handle<Adaptor3d_Surface> & S, const double v1, const double v2);

		/****** IntPatch_HInterTool::NbSegments ******/
		/****** md5 signature: 144290e30d5b239e3af183aa76065809 ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d

Return
-------
int

Description
-----------
returns the number of part of A solution of the of intersection problem.
") NbSegments;
		static int NbSegments(const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::Parameter ******/
		/****** md5 signature: 6593de7f4de76920e836e4d4047f9327 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
Returns the parameter of the vertex V on the arc A.
") Parameter;
		static double Parameter(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::Project ******/
		/****** md5 signature: de37e061758c52b426c6f7fc05237d2b ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
P: gp_Pnt2d
Ptproj: gp_Pnt2d

Return
-------
Paramproj: double

Description
-----------
Projects the point P on the arc C. If the methods returns true, the projection is successful, and Paramproj is the parameter on the arc of the projected point, Ptproj is the projected Point. If the method returns false, Param proj and Ptproj are not significant.
") Project;
		static bool Project(const opencascade::handle<Adaptor2d_Curve2d> & C, const gp_Pnt2d & P, Standard_Real &OutValue, gp_Pnt2d & Ptproj);

		/****** IntPatch_HInterTool::SamplePoint ******/
		/****** md5 signature: 10e2fc82f10a4b1c6c8d5c48f6567da1 ******/
		%feature("compactdefaultargs") SamplePoint;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface
Index: int

Return
-------
U: double
V: double

Description
-----------
No available documentation.
") SamplePoint;
		void SamplePoint(const opencascade::handle<Adaptor3d_Surface> & S, const int Index, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_HInterTool::SingularOnUMax ******/
		/****** md5 signature: 4f54c43e05a022062f5dae59aa53b2a3 ******/
		%feature("compactdefaultargs") SingularOnUMax;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnUMax;
		static bool SingularOnUMax(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_HInterTool::SingularOnUMin ******/
		/****** md5 signature: 4432145ebd8b7c72e21f91ef86429cd2 ******/
		%feature("compactdefaultargs") SingularOnUMin;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnUMin;
		static bool SingularOnUMin(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_HInterTool::SingularOnVMax ******/
		/****** md5 signature: a104bdbc9f32212518d1a88ba798b15b ******/
		%feature("compactdefaultargs") SingularOnVMax;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnVMax;
		static bool SingularOnVMax(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_HInterTool::SingularOnVMin ******/
		/****** md5 signature: 62f48f4556ef4706c851883d17d15447 ******/
		%feature("compactdefaultargs") SingularOnVMin;
		%feature("autodoc", "
Parameters
----------
S: Adaptor3d_Surface

Return
-------
bool

Description
-----------
No available documentation.
") SingularOnVMin;
		static bool SingularOnVMin(const opencascade::handle<Adaptor3d_Surface> & S);

		/****** IntPatch_HInterTool::Tolerance ******/
		/****** md5 signature: beb7b43970562219d76d014b4930500a ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "
Parameters
----------
V: Adaptor3d_HVertex
C: Adaptor2d_Curve2d

Return
-------
double

Description
-----------
Returns the parametric tolerance used to consider that the vertex and another point meet, i-e if std::abs(parameter(Vertex) - parameter(OtherPnt))<= Tolerance, the points are 'merged'.
") Tolerance;
		static double Tolerance(const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & C);

		/****** IntPatch_HInterTool::Value ******/
		/****** md5 signature: 72d5dd4b5c066803b5473cc3246c3937 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int
Pt: gp_Pnt

Return
-------
Tol: double
U: double

Description
-----------
Returns the value (Pt), the tolerance (Tol), and the parameter (U) on the arc A , of the intersection point of range Index.
") Value;
		static void Value(const opencascade::handle<Adaptor2d_Curve2d> & C, const int Index, gp_Pnt & Pt, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_HInterTool::Vertex ******/
		/****** md5 signature: a4c82e9cd894b1e9d2cd8b98c44bfb71 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
C: Adaptor2d_Curve2d
Index: int
V: Adaptor3d_HVertex

Return
-------
None

Description
-----------
When IsVertex returns True, this method returns the vertex on the arc A.
") Vertex;
		static void Vertex(const opencascade::handle<Adaptor2d_Curve2d> & C, const int Index, opencascade::handle<Adaptor3d_HVertex> & V);

};


%extend IntPatch_HInterTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IntPatch_ImpImpIntersection *
************************************/
class IntPatch_ImpImpIntersection {
	public:
/* public enums */
enum IntStatus {
	IntStatus_OK = 0,
	IntStatus_InfiniteSectionCurve = 1,
	IntStatus_Fail = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IntStatus(IntEnum):
	IntStatus_OK = 0
	IntStatus_InfiniteSectionCurve = 1
	IntStatus_Fail = 2
IntStatus_OK = IntStatus.IntStatus_OK
IntStatus_InfiniteSectionCurve = IntStatus.IntStatus_InfiniteSectionCurve
IntStatus_Fail = IntStatus.IntStatus_Fail
};
/* end python proxy for enums */

		/****** IntPatch_ImpImpIntersection::IntPatch_ImpImpIntersection ******/
		/****** md5 signature: 7be4587ea1735d9431b285e164d246f4 ******/
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection();

		/****** IntPatch_ImpImpIntersection::IntPatch_ImpImpIntersection ******/
		/****** md5 signature: cb7c47c355c0a6edecbd209450641eb2 ******/
		%feature("compactdefaultargs") IntPatch_ImpImpIntersection;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: double
TolTang: double
theIsReqToKeepRLine: bool (optional, default to false)

Return
-------
None

Description
-----------
Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided.
") IntPatch_ImpImpIntersection;
		 IntPatch_ImpImpIntersection(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const double TolArc, const double TolTang, const bool theIsReqToKeepRLine = false);

		/****** IntPatch_ImpImpIntersection::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the calculus was successful.
") IsDone;
		bool IsDone();

		/****** IntPatch_ImpImpIntersection::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the is no intersection.
") IsEmpty;
		bool IsEmpty();

		/****** IntPatch_ImpImpIntersection::Line ******/
		/****** md5 signature: 923de215ae03053b2e452a192ebdd240 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const int Index);

		/****** IntPatch_ImpImpIntersection::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection lines.
") NbLines;
		int NbLines();

		/****** IntPatch_ImpImpIntersection::NbPnts ******/
		/****** md5 signature: 62ca8b9c803953d23e1f278d77f7b8f6 ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 'single' points.
") NbPnts;
		int NbPnts();

		/****** IntPatch_ImpImpIntersection::OppositeFaces ******/
		/****** md5 signature: 73ee26fa1f688b9b5e962f87fc415d4c ******/
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the TangentFaces returns True and the normal vectors evaluated at a point on the first and the second surface are opposite. The exception DomainError is raised if TangentFaces returns False.
") OppositeFaces;
		bool OppositeFaces();

		/****** IntPatch_ImpImpIntersection::Perform ******/
		/****** md5 signature: 63a4ead196c04001eb63c1f332ba9d68 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: double
TolTang: double
theIsReqToKeepRLine: bool (optional, default to false)

Return
-------
None

Description
-----------
Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const double TolArc, const double TolTang, const bool theIsReqToKeepRLine = false);

		/****** IntPatch_ImpImpIntersection::Point ******/
		/****** md5 signature: d44a90010f7d4526516418bc03e31bcc ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.
") Point;
		const IntPatch_Point & Point(const int Index);

		/****** IntPatch_ImpImpIntersection::TangentFaces ******/
		/****** md5 signature: a3b282b2f15e5f2571f5a9e4b5225aac ******/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two patches are considered as entirely tangent, i.e every restriction arc of one patch is inside the geometric base of the other patch.
") TangentFaces;
		bool TangentFaces();

};


%extend IntPatch_ImpImpIntersection {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def GetStatus(self):
		pass
	}
};

/************************************
* class IntPatch_ImpPrmIntersection *
************************************/
class IntPatch_ImpPrmIntersection {
	public:
		/****** IntPatch_ImpPrmIntersection::IntPatch_ImpPrmIntersection ******/
		/****** md5 signature: f4cbcc97498f2df01053a929c676a290 ******/
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection();

		/****** IntPatch_ImpPrmIntersection::IntPatch_ImpPrmIntersection ******/
		/****** md5 signature: df0107259c72896aa7c3bbb9bca9d4a1 ******/
		%feature("compactdefaultargs") IntPatch_ImpPrmIntersection;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
Surf2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: double
TolTang: double
Fleche: double
Pas: double

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ImpPrmIntersection;
		 IntPatch_ImpPrmIntersection(const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & Surf2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const double TolArc, const double TolTang, const double Fleche, const double Pas);

		/****** IntPatch_ImpPrmIntersection::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the calculus was successful.
") IsDone;
		bool IsDone();

		/****** IntPatch_ImpPrmIntersection::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the is no intersection.
") IsEmpty;
		bool IsEmpty();

		/****** IntPatch_ImpPrmIntersection::Line ******/
		/****** md5 signature: 923de215ae03053b2e452a192ebdd240 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const int Index);

		/****** IntPatch_ImpPrmIntersection::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection lines.
") NbLines;
		int NbLines();

		/****** IntPatch_ImpPrmIntersection::NbPnts ******/
		/****** md5 signature: 62ca8b9c803953d23e1f278d77f7b8f6 ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 'single' points.
") NbPnts;
		int NbPnts();

		/****** IntPatch_ImpPrmIntersection::Perform ******/
		/****** md5 signature: 8f52ca7096fd795a69c3cfd1c06138de ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Surf1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
Surf2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: double
TolTang: double
Fleche: double
Pas: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Surf1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & Surf2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const double TolArc, const double TolTang, const double Fleche, const double Pas);

		/****** IntPatch_ImpPrmIntersection::Point ******/
		/****** md5 signature: d44a90010f7d4526516418bc03e31bcc ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.
") Point;
		const IntPatch_Point & Point(const int Index);

		/****** IntPatch_ImpPrmIntersection::SetStartPoint ******/
		/****** md5 signature: 196485c26454dc3bf2be1b097859ad9e ******/
		%feature("compactdefaultargs") SetStartPoint;
		%feature("autodoc", "
Parameters
----------
U: double
V: double

Return
-------
None

Description
-----------
to search for solution from the given point.
") SetStartPoint;
		void SetStartPoint(const double U, const double V);

};


%extend IntPatch_ImpPrmIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IntPatch_InterferencePolyhedron *
****************************************/
class IntPatch_InterferencePolyhedron : public Intf_Interference {
	public:
		/****** IntPatch_InterferencePolyhedron::IntPatch_InterferencePolyhedron ******/
		/****** md5 signature: bcee18160a018abbc7ca10edfe73faa4 ******/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty interference of Polyhedron.
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron();

		/****** IntPatch_InterferencePolyhedron::IntPatch_InterferencePolyhedron ******/
		/****** md5 signature: ed21209d5e9fc41ef785686ba9b5f4bb ******/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "
Parameters
----------
Obje1: IntPatch_Polyhedron
Obje2: IntPatch_Polyhedron

Return
-------
None

Description
-----------
Constructs and computes an interference between the two Polyhedra.
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron(const IntPatch_Polyhedron & Obje1, const IntPatch_Polyhedron & Obje2);

		/****** IntPatch_InterferencePolyhedron::IntPatch_InterferencePolyhedron ******/
		/****** md5 signature: 89cc662e47a55daf2f93f54136eca955 ******/
		%feature("compactdefaultargs") IntPatch_InterferencePolyhedron;
		%feature("autodoc", "
Parameters
----------
Obje: IntPatch_Polyhedron

Return
-------
None

Description
-----------
Constructs and computes the self interference of a Polyhedron.
") IntPatch_InterferencePolyhedron;
		 IntPatch_InterferencePolyhedron(const IntPatch_Polyhedron & Obje);

		/****** IntPatch_InterferencePolyhedron::Perform ******/
		/****** md5 signature: d26a979a3b5dc9db5e86d919e93c0744 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Obje1: IntPatch_Polyhedron
Obje2: IntPatch_Polyhedron

Return
-------
None

Description
-----------
Computes the interference between the two Polyhedra.
") Perform;
		void Perform(const IntPatch_Polyhedron & Obje1, const IntPatch_Polyhedron & Obje2);

		/****** IntPatch_InterferencePolyhedron::Perform ******/
		/****** md5 signature: 6767f6104458aca7d72b27f1876ffecf ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Obje: IntPatch_Polyhedron

Return
-------
None

Description
-----------
Computes the self interference of a Polyhedron.
") Perform;
		void Perform(const IntPatch_Polyhedron & Obje);

};


%extend IntPatch_InterferencePolyhedron {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPatch_Intersection *
******************************/
class IntPatch_Intersection {
	public:
		/****** IntPatch_Intersection::IntPatch_Intersection ******/
		/****** md5 signature: b7b64295e34218cccd078e59a46a390e ******/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_Intersection;
		 IntPatch_Intersection();

		/****** IntPatch_Intersection::IntPatch_Intersection ******/
		/****** md5 signature: 145e876aa88d3a41932c6b80d3722e96 ******/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: double
TolTang: double

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_Intersection;
		 IntPatch_Intersection(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const double TolArc, const double TolTang);

		/****** IntPatch_Intersection::IntPatch_Intersection ******/
		/****** md5 signature: 02e535bf82d8236b41b1551014ed6ba6 ******/
		%feature("compactdefaultargs") IntPatch_Intersection;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
TolArc: double
TolTang: double

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_Intersection;
		 IntPatch_Intersection(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const double TolArc, const double TolTang);

		/****** IntPatch_Intersection::CheckSingularPoints ******/
		/****** md5 signature: 816089eacf0708f2a4d29534f23248d2 ******/
		%feature("compactdefaultargs") CheckSingularPoints;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theD1: Adaptor3d_TopolTool
theS2: Adaptor3d_Surface

Return
-------
theDist: double

Description
-----------
Checks if surface theS1 has degenerated boundary (dS/du or dS/dv = 0) and calculates minimal distance between corresponding singular points and surface theS2 If singular point exists the method returns 'true' and stores minimal distance in theDist.
") CheckSingularPoints;
		static bool CheckSingularPoints(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_TopolTool> & theD1, const opencascade::handle<Adaptor3d_Surface> & theS2, Standard_Real &OutValue);

		/****** IntPatch_Intersection::DefineUVMaxStep ******/
		/****** md5 signature: 365c27cd23627bc475e9a96f78c43a46 ******/
		%feature("compactdefaultargs") DefineUVMaxStep;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theD1: Adaptor3d_TopolTool
theS2: Adaptor3d_Surface
theD2: Adaptor3d_TopolTool

Return
-------
double

Description
-----------
Calculates recommended value for myUVMaxStep depending on surfaces and their domains.
") DefineUVMaxStep;
		static double DefineUVMaxStep(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_TopolTool> & theD1, const opencascade::handle<Adaptor3d_Surface> & theS2, const opencascade::handle<Adaptor3d_TopolTool> & theD2);

		/****** IntPatch_Intersection::Dump ******/
		/****** md5 signature: 2822096f0de204e60e8d788d67811297 ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
Mode: int
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool

Return
-------
None

Description
-----------
Dump of each result line. Mode for more accurate dumps.
") Dump;
		void Dump(const int Mode, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2);

		/****** IntPatch_Intersection::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the calculus was successful.
") IsDone;
		bool IsDone();

		/****** IntPatch_Intersection::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the is no intersection.
") IsEmpty;
		bool IsEmpty();

		/****** IntPatch_Intersection::Line ******/
		/****** md5 signature: 923de215ae03053b2e452a192ebdd240 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const int Index);

		/****** IntPatch_Intersection::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection lines.
") NbLines;
		int NbLines();

		/****** IntPatch_Intersection::NbPnts ******/
		/****** md5 signature: 62ca8b9c803953d23e1f278d77f7b8f6 ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of 'single' points.
") NbPnts;
		int NbPnts();

		/****** IntPatch_Intersection::OppositeFaces ******/
		/****** md5 signature: 73ee26fa1f688b9b5e962f87fc415d4c ******/
		%feature("compactdefaultargs") OppositeFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True when the TangentFaces returns True and the normal vectors evaluated at a point on the first and the second surface are opposite. The exception DomainError is raised if TangentFaces returns False.
") OppositeFaces;
		bool OppositeFaces();

		/****** IntPatch_Intersection::Perform ******/
		/****** md5 signature: 232eb738c7163f3e429b6a947be70723 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: double
TolTang: double
isGeomInt: bool (optional, default to true)
theIsReqToKeepRLine: bool (optional, default to false)
theIsReqToPostWLProc: bool (optional, default to true)

Return
-------
None

Description
-----------
Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided. Flag theIsReqToPostWLProc has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. If theIsReqToPostWLProc == False, then we will work with Walking-line obtained after intersection algorithm directly (without any post-processing).
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const double TolArc, const double TolTang, const bool isGeomInt = true, const bool theIsReqToKeepRLine = false, const bool theIsReqToPostWLProc = true);

		/****** IntPatch_Intersection::Perform ******/
		/****** md5 signature: 849e272b23eb298f8df00e4df58b226e ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
TolArc: double
TolTang: double
LOfPnts: NCollection_List<IntSurf_PntOn2S>
isGeomInt: bool (optional, default to true)
theIsReqToKeepRLine: bool (optional, default to false)
theIsReqToPostWLProc: bool (optional, default to true)

Return
-------
None

Description
-----------
If isGeomInt == false, then method Param-Param intersection will be used. Flag theIsReqToKeepRLine has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. When intersection result returns IntPatch_RLine and another IntPatch_Line (not restriction) we (in case of theIsReqToKeepRLine==True) will always keep both lines even if they are coincided. Flag theIsReqToPostWLProc has been entered only for compatibility with TopOpeBRep package. It shall be deleted after deleting TopOpeBRep. If theIsReqToPostWLProc == False, then we will work with Walking-line obtained after intersection algorithm directly (without any post-processing).
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const double TolArc, const double TolTang, NCollection_List<IntSurf_PntOn2S> & LOfPnts, const bool isGeomInt = true, const bool theIsReqToKeepRLine = false, const bool theIsReqToPostWLProc = true);

		/****** IntPatch_Intersection::Perform ******/
		/****** md5 signature: d9d4f1ed44916b182a18d5610a354049 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
U1: double
V1: double
U2: double
V2: double
TolArc: double
TolTang: double

Return
-------
None

Description
-----------
Perform with start point.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const double U1, const double V1, const double U2, const double V2, const double TolArc, const double TolTang);

		/****** IntPatch_Intersection::Perform ******/
		/****** md5 signature: 7e1a2e2c570554d9216151393122feeb ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
TolArc: double
TolTang: double

Return
-------
None

Description
-----------
Uses for finding self-intersected surfaces.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const double TolArc, const double TolTang);

		/****** IntPatch_Intersection::Point ******/
		/****** md5 signature: d44a90010f7d4526516418bc03e31bcc ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the point of range Index. An exception is raised if Index<=0 or Index>NbPnt.
") Point;
		const IntPatch_Point & Point(const int Index);

		/****** IntPatch_Intersection::PrepareSurfaces ******/
		/****** md5 signature: d20bda50f442c5bd7d7b4d040cf3e763 ******/
		%feature("compactdefaultargs") PrepareSurfaces;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theD1: Adaptor3d_TopolTool
theS2: Adaptor3d_Surface
theD2: Adaptor3d_TopolTool
Tol: double
theSeqHS1: Adaptor3d_Surface
theSeqHS2: Adaptor3d_Surface

Return
-------
None

Description
-----------
Prepares surfaces for intersection.
") PrepareSurfaces;
		static void PrepareSurfaces(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_TopolTool> & theD1, const opencascade::handle<Adaptor3d_Surface> & theS2, const opencascade::handle<Adaptor3d_TopolTool> & theD2, const double Tol, NCollection_DynamicArray<opencascade::handle<Adaptor3d_Surface>> & theSeqHS1, NCollection_DynamicArray<opencascade::handle<Adaptor3d_Surface>> & theSeqHS2);

		/****** IntPatch_Intersection::SequenceOfLine ******/
		/****** md5 signature: 61088f9b1aab32b1f92e7fdcd44022ac ******/
		%feature("compactdefaultargs") SequenceOfLine;
		%feature("autodoc", "Return
-------
NCollection_Sequence<opencascade::handle<IntPatch_Line>>

Description
-----------
No available documentation.
") SequenceOfLine;
		const NCollection_Sequence<opencascade::handle<IntPatch_Line>> & SequenceOfLine();

		/****** IntPatch_Intersection::SetTolerances ******/
		/****** md5 signature: 5dc530c658b69a3fc50188a2501992cc ******/
		%feature("compactdefaultargs") SetTolerances;
		%feature("autodoc", "
Parameters
----------
TolArc: double
TolTang: double
UVMaxStep: double
Fleche: double

Return
-------
None

Description
-----------
Set the tolerances used by the algorithms: --- Implicit - Parametric --- Parametric - Parametric --- Implicit - Implicit //! TolArc is used to compute the intersections between the restrictions of a surface and a walking line. //! TolTang is used to compute the points on a walking line, and in geometric algorithms. //! Fleche is a parameter used in the walking algorithms to provide small curvatures on a line. //! UVMaxStep is a parameter used in the walking algorithms to compute the distance between to points in their respective parametric spaces.
") SetTolerances;
		void SetTolerances(const double TolArc, const double TolTang, const double UVMaxStep, const double Fleche);

		/****** IntPatch_Intersection::TangentFaces ******/
		/****** md5 signature: a3b282b2f15e5f2571f5a9e4b5225aac ******/
		%feature("compactdefaultargs") TangentFaces;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the two patches are considered as entirely tangent, i-e every restriction arc of one patch is inside the geometric base of the other patch.
") TangentFaces;
		bool TangentFaces();

};


%extend IntPatch_Intersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**********************
* class IntPatch_Line *
**********************/
%nodefaultctor IntPatch_Line;
class IntPatch_Line : public Standard_Transient {
	public:
		/****** IntPatch_Line::ArcType ******/
		/****** md5 signature: 0a7455aa9cc33046fb13baf1f25a2b19 ******/
		%feature("compactdefaultargs") ArcType;
		%feature("autodoc", "Return
-------
IntPatch_IType

Description
-----------
Returns the type of geometry 3d (Line, Circle, Parabola, Hyperbola, Ellipse, Analytic, Walking, Restriction).
") ArcType;
		IntPatch_IType ArcType();

		/****** IntPatch_Line::IsTangent ******/
		/****** md5 signature: baca3d34e02c226d40f886fc1be3d673 ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is a line of tangency between the 2 patches.
") IsTangent;
		bool IsTangent();

		/****** IntPatch_Line::IsUIsoOnS1 ******/
		/****** md5 signature: dd1a185ba7f6e079353bfdf2ed0427fb ******/
		%feature("compactdefaultargs") IsUIsoOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is a U isoparametric curve on the first patch.
") IsUIsoOnS1;
		bool IsUIsoOnS1();

		/****** IntPatch_Line::IsUIsoOnS2 ******/
		/****** md5 signature: 8c10edd97f7f9cc65f63671382c00c3e ******/
		%feature("compactdefaultargs") IsUIsoOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is a U isoparametric curve on the second patch.
") IsUIsoOnS2;
		bool IsUIsoOnS2();

		/****** IntPatch_Line::IsVIsoOnS1 ******/
		/****** md5 signature: 4846ed6d2545875e513182d8b07eb1c2 ******/
		%feature("compactdefaultargs") IsVIsoOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is a V isoparametric curve on the first patch.
") IsVIsoOnS1;
		bool IsVIsoOnS1();

		/****** IntPatch_Line::IsVIsoOnS2 ******/
		/****** md5 signature: 96f80ba33f873481c6c5755be35f9608 ******/
		%feature("compactdefaultargs") IsVIsoOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is a V isoparametric curve on the second patch.
") IsVIsoOnS2;
		bool IsVIsoOnS2();

		/****** IntPatch_Line::SetValue ******/
		/****** md5 signature: 2d9d5ccdf5bda8673781fce5363c885b ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Uiso1: bool
Viso1: bool
Uiso2: bool
Viso2: bool

Return
-------
None

Description
-----------
To set the values returned by IsUIsoS1,.... The default values are False.
") SetValue;
		void SetValue(const bool Uiso1, const bool Viso1, const bool Uiso2, const bool Viso2);

		/****** IntPatch_Line::SituationS1 ******/
		/****** md5 signature: af2d2dd713ae3b820482546cf4a82d7b ******/
		%feature("compactdefaultargs") SituationS1;
		%feature("autodoc", "Return
-------
IntSurf_Situation

Description
-----------
Returns the situation (INSIDE/OUTSIDE/UNKNOWN) of the first patch compared to the second one, when TransitionOnS1 or TransitionOnS2 returns TOUCH. Otherwise, an exception is raised.
") SituationS1;
		IntSurf_Situation SituationS1();

		/****** IntPatch_Line::SituationS2 ******/
		/****** md5 signature: da9cc8795913744eb08fbe6bf499827b ******/
		%feature("compactdefaultargs") SituationS2;
		%feature("autodoc", "Return
-------
IntSurf_Situation

Description
-----------
Returns the situation (INSIDE/OUTSIDE/UNKNOWN) of the second patch compared to the first one, when TransitionOnS1 or TransitionOnS2 returns TOUCH. Otherwise, an exception is raised.
") SituationS2;
		IntSurf_Situation SituationS2();

		/****** IntPatch_Line::TransitionOnS1 ******/
		/****** md5 signature: 9de184f3b47c2902be7de5eb10743898 ******/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of the transition of the line for the first surface. The transition is 'constant' along the line. The transition is IN if the line is oriented in such a way that the system of vector (N1,N2,T) is right-handed, where N1 is the normal to the first surface at a point P, N2 is the normal to the second surface at a point P, T is the tangent to the intersection line at P. If the system of vector is left-handed, the transition is OUT. When N1 and N2 are colinear all along the intersection line, the transition will be - TOUCH, if it is possible to use the 2nd derivatives to determine the position of one surafce compared to the other (see Situation) - UNDECIDED otherwise. //! If one of the transition is TOUCH or UNDECIDED, the other one has got the same value.
") TransitionOnS1;
		IntSurf_TypeTrans TransitionOnS1();

		/****** IntPatch_Line::TransitionOnS2 ******/
		/****** md5 signature: aafa064949332278d0d49be3da4c6df2 ******/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Return
-------
IntSurf_TypeTrans

Description
-----------
Returns the type of the transition of the line for the second surface. The transition is 'constant' along the line.
") TransitionOnS2;
		IntSurf_TypeTrans TransitionOnS2();

};


%make_alias(IntPatch_Line)

%extend IntPatch_Line {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPatch_LineConstructor *
*********************************/
class IntPatch_LineConstructor {
	public:
		/****** IntPatch_LineConstructor::IntPatch_LineConstructor ******/
		/****** md5 signature: 2beff296db457f4beafd60234b1ca8c6 ******/
		%feature("compactdefaultargs") IntPatch_LineConstructor;
		%feature("autodoc", "
Parameters
----------
mode: int

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_LineConstructor;
		 IntPatch_LineConstructor(const int mode);

		/****** IntPatch_LineConstructor::Line ******/
		/****** md5 signature: 6175c62ca5f699bc60da2e4f2974fe90 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
index: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
No available documentation.
") Line;
		opencascade::handle<IntPatch_Line> Line(const int index);

		/****** IntPatch_LineConstructor::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbLines;
		int NbLines();

		/****** IntPatch_LineConstructor::Perform ******/
		/****** md5 signature: 9d860fe80ef7ac010468613d301dab94 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
SL: IntPatch_Line
L: IntPatch_Line
S1: Adaptor3d_Surface
D1: Adaptor3d_TopolTool
S2: Adaptor3d_Surface
D2: Adaptor3d_TopolTool
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const NCollection_Sequence<opencascade::handle<IntPatch_Line>> & SL, const opencascade::handle<IntPatch_Line> & L, const opencascade::handle<Adaptor3d_Surface> & S1, const opencascade::handle<Adaptor3d_TopolTool> & D1, const opencascade::handle<Adaptor3d_Surface> & S2, const opencascade::handle<Adaptor3d_TopolTool> & D2, const double Tol);

};


%extend IntPatch_LineConstructor {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_Point *
***********************/
class IntPatch_Point {
	public:
		/****** IntPatch_Point::IntPatch_Point ******/
		/****** md5 signature: 03a05de988af7a0fed88ace5649e482b ******/
		%feature("compactdefaultargs") IntPatch_Point;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntPatch_Point;
		 IntPatch_Point();

		/****** IntPatch_Point::ArcOnS1 ******/
		/****** md5 signature: 85135db99004c68167f0f6d4c3e12e08 ******/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the arc of restriction containing the vertex. The exception DomainError is raised if IsOnDomS1 returns False.
") ArcOnS1;
		const opencascade::handle<Adaptor2d_Curve2d> & ArcOnS1();

		/****** IntPatch_Point::ArcOnS2 ******/
		/****** md5 signature: 8bdcf3526697d60e43350266dbc562b1 ******/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the arc of restriction containing the vertex. The exception DomainError is raised if IsOnDomS2 returns False.
") ArcOnS2;
		const opencascade::handle<Adaptor2d_Curve2d> & ArcOnS2();

		/****** IntPatch_Point::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** IntPatch_Point::IsMultiple ******/
		/****** md5 signature: e6f05b42d0997d2397aa555711ac4e5c ******/
		%feature("compactdefaultargs") IsMultiple;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point belongs to several intersection lines.
") IsMultiple;
		bool IsMultiple();

		/****** IntPatch_Point::IsOnDomS1 ******/
		/****** md5 signature: 5716e70cb829ee6b6e62e842eae4a431 ******/
		%feature("compactdefaultargs") IsOnDomS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is on a boundary of the domain of the first patch.
") IsOnDomS1;
		bool IsOnDomS1();

		/****** IntPatch_Point::IsOnDomS2 ******/
		/****** md5 signature: dffe252f7a8af6ac30918ab4d600561a ******/
		%feature("compactdefaultargs") IsOnDomS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is on a boundary of the domain of the second patch.
") IsOnDomS2;
		bool IsOnDomS2();

		/****** IntPatch_Point::IsTangencyPoint ******/
		/****** md5 signature: 5fdbbb5c5371416b1705c6e1255262ea ******/
		%feature("compactdefaultargs") IsTangencyPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the Point is a tangency point between the surfaces. If the Point is on one of the domain (IsOnDomS1 returns True or IsOnDomS2 returns True), an exception is raised.
") IsTangencyPoint;
		bool IsTangencyPoint();

		/****** IntPatch_Point::IsVertexOnS1 ******/
		/****** md5 signature: 5f0c10f2e800d7608b66985e3e79da0b ******/
		%feature("compactdefaultargs") IsVertexOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a vertex on the initial restriction facet of the first surface.
") IsVertexOnS1;
		bool IsVertexOnS1();

		/****** IntPatch_Point::IsVertexOnS2 ******/
		/****** md5 signature: 28f5feccffa440679b10cd1908e17564 ******/
		%feature("compactdefaultargs") IsVertexOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the point is a vertex on the initial restriction facet of the first surface.
") IsVertexOnS2;
		bool IsVertexOnS2();

		/****** IntPatch_Point::ParameterOnArc1 ******/
		/****** md5 signature: 6f540c6fb388a6a58d2437a5f6d53a84 ******/
		%feature("compactdefaultargs") ParameterOnArc1;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the point on the arc returned by the method ArcOnS2. The exception DomainError is raised if IsOnDomS1 returns False.
") ParameterOnArc1;
		double ParameterOnArc1();

		/****** IntPatch_Point::ParameterOnArc2 ******/
		/****** md5 signature: b47801f04102fc05ed78e380dcd38ba9 ******/
		%feature("compactdefaultargs") ParameterOnArc2;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the parameter of the point on the arc returned by the method ArcOnS2. The exception DomainError is raised if IsOnDomS2 returns False.
") ParameterOnArc2;
		double ParameterOnArc2();

		/****** IntPatch_Point::ParameterOnLine ******/
		/****** md5 signature: b224a4c205db840697545a0e986b265c ******/
		%feature("compactdefaultargs") ParameterOnLine;
		%feature("autodoc", "Return
-------
double

Description
-----------
This method returns the parameter of the point on the intersection line. If the points does not belong to an intersection line, the value returned does not have any sens.
") ParameterOnLine;
		double ParameterOnLine();

		/****** IntPatch_Point::Parameters ******/
		/****** md5 signature: 775e624bd9e3d27f6456633f332879c0 ******/
		%feature("compactdefaultargs") Parameters;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
V1: double
U2: double
V2: double

Description
-----------
Returns the parameters on the first and on the second surface of the point.
") Parameters;
		void Parameters(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_Point::ParametersOnS1 ******/
		/****** md5 signature: 59457ab5c91a647afa2300f3b7b5566d ******/
		%feature("compactdefaultargs") ParametersOnS1;
		%feature("autodoc", "
Parameters
----------

Return
-------
U1: double
V1: double

Description
-----------
Returns the parameters on the first surface of the point.
") ParametersOnS1;
		void ParametersOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_Point::ParametersOnS2 ******/
		/****** md5 signature: bf700fe3535c47a0e133a96e7f38d050 ******/
		%feature("compactdefaultargs") ParametersOnS2;
		%feature("autodoc", "
Parameters
----------

Return
-------
U2: double
V2: double

Description
-----------
Returns the parameters on the second surface of the point.
") ParametersOnS2;
		void ParametersOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_Point::PntOn2S ******/
		/****** md5 signature: 2088ec360d33e9af1c8275f7d5a12197 ******/
		%feature("compactdefaultargs") PntOn2S;
		%feature("autodoc", "Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the PntOn2S (geometric Point and the parameters).
") PntOn2S;
		const IntSurf_PntOn2S & PntOn2S();

		/****** IntPatch_Point::ReverseTransition ******/
		/****** md5 signature: e7f43ebc9ca8b3b75df4b5e0a05c5e52 ******/
		%feature("compactdefaultargs") ReverseTransition;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ReverseTransition;
		void ReverseTransition();

		/****** IntPatch_Point::SetArc ******/
		/****** md5 signature: 846ae6aa319873e55e024c71b4ee8e80 ******/
		%feature("compactdefaultargs") SetArc;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
A: Adaptor2d_Curve2d
Param: double
TLine: IntSurf_Transition
TArc: IntSurf_Transition

Return
-------
None

Description
-----------
Sets the values of a point which is on one of the domain, when both surfaces are implicit ones. If OnFirst is True, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.
") SetArc;
		void SetArc(const bool OnFirst, const opencascade::handle<Adaptor2d_Curve2d> & A, const double Param, const IntSurf_Transition & TLine, const IntSurf_Transition & TArc);

		/****** IntPatch_Point::SetMultiple ******/
		/****** md5 signature: da06196a1e0bdb10da858c84068496eb ******/
		%feature("compactdefaultargs") SetMultiple;
		%feature("autodoc", "
Parameters
----------
IsMult: bool

Return
-------
None

Description
-----------
Sets (or unsets) the point as a point on several intersection line.
") SetMultiple;
		void SetMultiple(const bool IsMult);

		/****** IntPatch_Point::SetParameter ******/
		/****** md5 signature: 7b443396772a23e080316b372682c8d1 ******/
		%feature("compactdefaultargs") SetParameter;
		%feature("autodoc", "
Parameters
----------
Para: double

Return
-------
None

Description
-----------
Set the value of the parameter on the intersection line.
") SetParameter;
		void SetParameter(const double Para);

		/****** IntPatch_Point::SetParameters ******/
		/****** md5 signature: 470f4f2fc7f9ac33bba0da6a65aed2d3 ******/
		%feature("compactdefaultargs") SetParameters;
		%feature("autodoc", "
Parameters
----------
U1: double
V1: double
U2: double
V2: double

Return
-------
None

Description
-----------
Sets the values of the parameters of the point on each surface.
") SetParameters;
		void SetParameters(const double U1, const double V1, const double U2, const double V2);

		/****** IntPatch_Point::SetTolerance ******/
		/****** md5 signature: c426e858e7414d8f8908514d195da2fa ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") SetTolerance;
		void SetTolerance(const double Tol);

		/****** IntPatch_Point::SetValue ******/
		/****** md5 signature: 64bf8733e2a396362e2141915e052df9 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt
Tol: double
Tangent: bool

Return
-------
None

Description
-----------
Sets the values of a point which is on no domain, when both surfaces are implicit ones. If Tangent is True, the point is a point of tangency between the surfaces.
") SetValue;
		void SetValue(const gp_Pnt & Pt, const double Tol, const bool Tangent);

		/****** IntPatch_Point::SetValue ******/
		/****** md5 signature: 030ac1eb59faa7b90801ff6c52fc9800 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
Pt: gp_Pnt

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & Pt);

		/****** IntPatch_Point::SetValue ******/
		/****** md5 signature: 0b319b299a0494678d536a27e164845b ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
thePOn2S: IntSurf_PntOn2S

Return
-------
None

Description
-----------
Sets the value of <pt> member.
") SetValue;
		void SetValue(const IntSurf_PntOn2S & thePOn2S);

		/****** IntPatch_Point::SetVertex ******/
		/****** md5 signature: e10d3f02fb66055a1a424939c52e1910 ******/
		%feature("compactdefaultargs") SetVertex;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
V: Adaptor3d_HVertex

Return
-------
None

Description
-----------
Sets the values of a point which is a vertex on the initial facet of restriction of one of the surface. If OnFirst is True, the point is on the domain of the first patch, otherwise the point is on the domain of the second surface.
") SetVertex;
		void SetVertex(const bool OnFirst, const opencascade::handle<Adaptor3d_HVertex> & V);

		/****** IntPatch_Point::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
This method returns the fuzziness on the point.
") Tolerance;
		double Tolerance();

		/****** IntPatch_Point::TransitionLineArc1 ******/
		/****** md5 signature: 3c2f51f861994ac2130670399f843948 ******/
		%feature("compactdefaultargs") TransitionLineArc1;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the intersection line with the arc on S1. The exception DomainError is raised if IsOnDomS1 returns False.
") TransitionLineArc1;
		const IntSurf_Transition & TransitionLineArc1();

		/****** IntPatch_Point::TransitionLineArc2 ******/
		/****** md5 signature: f951568f311bcb1309847a661eb86a91 ******/
		%feature("compactdefaultargs") TransitionLineArc2;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition of the point on the intersection line with the arc on S2. The exception DomainError is raised if IsOnDomS2 returns False.
") TransitionLineArc2;
		const IntSurf_Transition & TransitionLineArc2();

		/****** IntPatch_Point::TransitionOnS1 ******/
		/****** md5 signature: 8cb3d24c0def4cc671eb54590466ee5c ******/
		%feature("compactdefaultargs") TransitionOnS1;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition between the intersection line returned by the method Line and the arc on S1 returned by ArcOnS1(). The exception DomainError is raised if IsOnDomS1 returns False.
") TransitionOnS1;
		const IntSurf_Transition & TransitionOnS1();

		/****** IntPatch_Point::TransitionOnS2 ******/
		/****** md5 signature: a2716413c981c4ee8338310413d27dd3 ******/
		%feature("compactdefaultargs") TransitionOnS2;
		%feature("autodoc", "Return
-------
IntSurf_Transition

Description
-----------
Returns the transition between the intersection line returned by the method Line and the arc on S2 returned by ArcOnS2. The exception DomainError is raised if IsOnDomS2 returns False.
") TransitionOnS2;
		const IntSurf_Transition & TransitionOnS2();

		/****** IntPatch_Point::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the intersection point (geometric information).
") Value;
		const gp_Pnt Value();

		/****** IntPatch_Point::VertexOnS1 ******/
		/****** md5 signature: 6e7ddd3a0f44dd6dcb5d598d6d8b56dc ******/
		%feature("compactdefaultargs") VertexOnS1;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
Returns the information about the point when it is on the domain of the first patch, i-e when the function IsVertexOnS1 returns True. Otherwise, an exception is raised.
") VertexOnS1;
		const opencascade::handle<Adaptor3d_HVertex> & VertexOnS1();

		/****** IntPatch_Point::VertexOnS2 ******/
		/****** md5 signature: e810e40154fb388d3f47ab3204e900a0 ******/
		%feature("compactdefaultargs") VertexOnS2;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
Returns the information about the point when it is on the domain of the second patch, i-e when the function IsVertexOnS2 returns True. Otherwise, an exception is raised.
") VertexOnS2;
		const opencascade::handle<Adaptor3d_HVertex> & VertexOnS2();

};


%extend IntPatch_Point {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IntPatch_Polygo *
************************/
%nodefaultctor IntPatch_Polygo;
class IntPatch_Polygo : public Intf_Polygon2d {
	public:
		/****** IntPatch_Polygo::DeflectionOverEstimation ******/
		/****** md5 signature: 1fad6591a4ff1f9e8e821a3a0670bc18 ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the tolerance of the polygon.
") DeflectionOverEstimation;
		double DeflectionOverEstimation();

		/****** IntPatch_Polygo::Dump ******/
		/****** md5 signature: 15b4b2e195645aebb43170ff7f15952a ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") Dump;
		void Dump();

		/****** IntPatch_Polygo::Error ******/
		/****** md5 signature: f3b3a49fc8d62bae999fa8e058cfd9e1 ******/
		%feature("compactdefaultargs") Error;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Error;
		double Error();

		/****** IntPatch_Polygo::NbPoints ******/
		/****** md5 signature: 994ae4497927dbaaf6ccd1518d05d51b ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		virtual int NbPoints();

		/****** IntPatch_Polygo::NbSegments ******/
		/****** md5 signature: dd047a9d60ac19f7e8995b778d22aba9 ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of Segments in the polyline.
") NbSegments;
		int NbSegments();

		/****** IntPatch_Polygo::Point ******/
		/****** md5 signature: 4a84dee4a16b1a49267238e5e959fba0 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Point;
		virtual gp_Pnt2d Point(const int Index);

		/****** IntPatch_Polygo::Segment ******/
		/****** md5 signature: 492f28c821222ab2c8cda9dffc334375 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theBegin: gp_Pnt2d
theEnd: gp_Pnt2d

Return
-------
None

Description
-----------
Returns the points of the segment <Index> in the Polygon.
") Segment;
		void Segment(const int theIndex, gp_Pnt2d & theBegin, gp_Pnt2d & theEnd);

};


%extend IntPatch_Polygo {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************
* class IntPatch_Polyhedron *
****************************/
/*******************************
* class IntPatch_PolyhedronBVH *
*******************************/
class IntPatch_PolyhedronBVH : public BVH_PrimitiveSet<double,3> {
	public:
		/****** IntPatch_PolyhedronBVH::IntPatch_PolyhedronBVH ******/
		/****** md5 signature: 7f165687d473209da2c1c1b125bde845 ******/
		%feature("compactdefaultargs") IntPatch_PolyhedronBVH;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty BVH set.
") IntPatch_PolyhedronBVH;
		 IntPatch_PolyhedronBVH();

		/****** IntPatch_PolyhedronBVH::IntPatch_PolyhedronBVH ******/
		/****** md5 signature: 20fab44ac6dbcf538eb80d330280f35e ******/
		%feature("compactdefaultargs") IntPatch_PolyhedronBVH;
		%feature("autodoc", "
Parameters
----------
thePoly: IntPatch_Polyhedron

Return
-------
None

Description
-----------
Creates BVH set from the given polyhedron. 
Input parameter: thePoly the polyhedron to wrap (must remain valid during BVH lifetime).
") IntPatch_PolyhedronBVH;
		 IntPatch_PolyhedronBVH(const IntPatch_Polyhedron & thePoly);

		/****** IntPatch_PolyhedronBVH::Box ******/
		/****** md5 signature: 284e3d436fb4862631d59572bdc6bec1 ******/
		%feature("compactdefaultargs") Box;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
BVH_Box<double, 3 >

Description
-----------
Returns AABB of the triangle with the given index. 
Input parameter: theIndex 0-based triangle index (after BVH reordering).
") Box;
		virtual BVH_Box<double, 3 > Box(const int theIndex);

		/****** IntPatch_PolyhedronBVH::Center ******/
		/****** md5 signature: cfe3a13354d0ba503f0b67f14ef60986 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "
Parameters
----------
theIndex: int
theAxis: int

Return
-------
double

Description
-----------
Returns centroid coordinate of the triangle along the given axis. 
Input parameter: theIndex 0-based triangle index (after BVH reordering) 
Input parameter: theAxis axis index (0=X, 1=Y, 2=Z).
") Center;
		virtual double Center(const int theIndex, const int theAxis);

		/****** IntPatch_PolyhedronBVH::Clear ******/
		/****** md5 signature: ae54be580b423a6eadbe062e0bdb44c2 ******/
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears the BVH set.
") Clear;
		void Clear();

		/****** IntPatch_PolyhedronBVH::Init ******/
		/****** md5 signature: 93818e650b6a0d9e7a97f94059600b81 ******/
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "
Parameters
----------
thePoly: IntPatch_Polyhedron

Return
-------
None

Description
-----------
Initializes BVH set from the given polyhedron. 
Input parameter: thePoly the polyhedron to wrap (must remain valid during BVH lifetime).
") Init;
		void Init(const IntPatch_Polyhedron & thePoly);

		/****** IntPatch_PolyhedronBVH::IsInitialized ******/
		/****** md5 signature: 01666b35dc0d7af2bf9583d3f531f49b ******/
		%feature("compactdefaultargs") IsInitialized;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the BVH set is initialized.
") IsInitialized;
		bool IsInitialized();

		/****** IntPatch_PolyhedronBVH::OriginalIndex ******/
		/****** md5 signature: 42dd1a6bbf2880a702fb8abd14363036 ******/
		%feature("compactdefaultargs") OriginalIndex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
int

Description
-----------
Returns the original (1-based) triangle index in the polyhedron for the given 0-based index after BVH reordering. 
Input parameter: theIndex 0-based triangle index (after BVH reordering) 
Return: 1-based original triangle index in the polyhedron.
") OriginalIndex;
		int OriginalIndex(const int theIndex);

		/****** IntPatch_PolyhedronBVH::Size ******/
		/****** md5 signature: b92e7c596e42fc217637d66c252c8935 ******/
		%feature("compactdefaultargs") Size;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the total number of triangles.
") Size;
		virtual int Size();

		/****** IntPatch_PolyhedronBVH::Swap ******/
		/****** md5 signature: 694c713436855bb9949f4ebbddbbde66 ******/
		%feature("compactdefaultargs") Swap;
		%feature("autodoc", "
Parameters
----------
theIndex1: int
theIndex2: int

Return
-------
None

Description
-----------
Swaps two triangles in the set (used during BVH construction). 
Input parameter: theIndex1 first triangle index 
Input parameter: theIndex2 second triangle index.
") Swap;
		virtual void Swap(const int theIndex1, const int theIndex2);

};


%extend IntPatch_PolyhedronBVH {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************
* class IntPatch_PolyhedronTool *
********************************/
class IntPatch_PolyhedronTool {
	public:
		/****** IntPatch_PolyhedronTool::Bounding ******/
		/****** md5 signature: 62cea57f62e90f1f59dd4f0461684e2c ******/
		%feature("compactdefaultargs") Bounding;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron

Return
-------
Bnd_Box

Description
-----------
Give the bounding box of the Polyhedron.
") Bounding;
		static const Bnd_Box & Bounding(const IntPatch_Polyhedron & thePolyh);

		/****** IntPatch_PolyhedronTool::ComponentsBounding ******/
		/****** md5 signature: 5c5fdb59e0d183bae8b02459034becfd ******/
		%feature("compactdefaultargs") ComponentsBounding;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron

Return
-------
opencascade::handle<NCollection_HArray1<Bnd_Box>>

Description
-----------
Give the array of boxes. The box <n> corresponding to the triangle <n>.
") ComponentsBounding;
		static const opencascade::handle<NCollection_HArray1<Bnd_Box>> & ComponentsBounding(const IntPatch_Polyhedron & thePolyh);

		/****** IntPatch_PolyhedronTool::DeflectionOverEstimation ******/
		/****** md5 signature: 2cb962bc3660f88dff89dbcaff58e3fe ******/
		%feature("compactdefaultargs") DeflectionOverEstimation;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron

Return
-------
double

Description
-----------
Give the tolerance of the polygon.
") DeflectionOverEstimation;
		static double DeflectionOverEstimation(const IntPatch_Polyhedron & thePolyh);

		/****** IntPatch_PolyhedronTool::NbTriangles ******/
		/****** md5 signature: 95aa5805b4ab2225e9ac5da8fff84b73 ******/
		%feature("compactdefaultargs") NbTriangles;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron

Return
-------
int

Description
-----------
Give the number of triangles in this polyhedral surface.
") NbTriangles;
		static int NbTriangles(const IntPatch_Polyhedron & thePolyh);

		/****** IntPatch_PolyhedronTool::Point ******/
		/****** md5 signature: bed928b8bf2b83d9b136d9ce42d71cf2 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron
Index: int

Return
-------
gp_Pnt

Description
-----------
Give the point of index i in the polyhedral surface.
") Point;
		static const gp_Pnt Point(const IntPatch_Polyhedron & thePolyh, const int Index);

		/****** IntPatch_PolyhedronTool::TriConnex ******/
		/****** md5 signature: 724ae0255ffec98cb2af5ceb92ac4b0f ******/
		%feature("compactdefaultargs") TriConnex;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron
Triang: int
Pivot: int
Pedge: int

Return
-------
TriCon: int
OtherP: int

Description
-----------
Gives the address Tricon of the triangle connexe to the triangle of address Triang by the edge Pivot Pedge and the third point of this connexe triangle. When we are on a free edge TriCon==0 but the function return the value of the triangle in the other side of Pivot on the free edge. Used to turn around a vertex.
") TriConnex;
		static int TriConnex(const IntPatch_Polyhedron & thePolyh, const int Triang, const int Pivot, const int Pedge, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntPatch_PolyhedronTool::Triangle ******/
		/****** md5 signature: c4df3e4bf39c7958646a916dbd57e6c5 ******/
		%feature("compactdefaultargs") Triangle;
		%feature("autodoc", "
Parameters
----------
thePolyh: IntPatch_Polyhedron
Index: int

Return
-------
P1: int
P2: int
P3: int

Description
-----------
Give the indices of the 3 points of the triangle of address Index in the Polyhedron.
") Triangle;
		static void Triangle(const IntPatch_Polyhedron & thePolyh, const int Index, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

};


%extend IntPatch_PolyhedronTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************************
* class IntPatch_PrmPrmIntersection *
************************************/
class IntPatch_PrmPrmIntersection {
	public:
		/****** IntPatch_PrmPrmIntersection::IntPatch_PrmPrmIntersection ******/
		/****** md5 signature: 13ca72c86a53df35245b2d4f1d1237d8 ******/
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty Constructor.
") IntPatch_PrmPrmIntersection;
		 IntPatch_PrmPrmIntersection();

		/****** IntPatch_PrmPrmIntersection::CodeReject ******/
		/****** md5 signature: 544016d31d1cbd34984f2abb90afc2a6 ******/
		%feature("compactdefaultargs") CodeReject;
		%feature("autodoc", "
Parameters
----------
x1: double
y1: double
z1: double
x2: double
y2: double
z2: double
x3: double
y3: double
z3: double

Return
-------
int

Description
-----------
No available documentation.
") CodeReject;
		int CodeReject(const double x1, const double y1, const double z1, const double x2, const double y2, const double z2, const double x3, const double y3, const double z3);

		/****** IntPatch_PrmPrmIntersection::DansGrille ******/
		/****** md5 signature: e7ae2109b614f97a7800122442e35e87 ******/
		%feature("compactdefaultargs") DansGrille;
		%feature("autodoc", "
Parameters
----------
t: int

Return
-------
int

Description
-----------
No available documentation.
") DansGrille;
		int DansGrille(const int t);

		/****** IntPatch_PrmPrmIntersection::GrilleInteger ******/
		/****** md5 signature: 9b50c0de71a32f3e8ab88569704a42dc ******/
		%feature("compactdefaultargs") GrilleInteger;
		%feature("autodoc", "
Parameters
----------
ix: int
iy: int
iz: int

Return
-------
int

Description
-----------
No available documentation.
") GrilleInteger;
		int GrilleInteger(const int ix, const int iy, const int iz);

		/****** IntPatch_PrmPrmIntersection::IntegerGrille ******/
		/****** md5 signature: f6c755570d6d426bdaed1428f04c7a20 ******/
		%feature("compactdefaultargs") IntegerGrille;
		%feature("autodoc", "
Parameters
----------
t: int

Return
-------
ix: int
iy: int
iz: int

Description
-----------
No available documentation.
") IntegerGrille;
		void IntegerGrille(const int t, Standard_Integer &OutValue, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntPatch_PrmPrmIntersection::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the calculus was successful.
") IsDone;
		bool IsDone();

		/****** IntPatch_PrmPrmIntersection::IsEmpty ******/
		/****** md5 signature: 03c43b1186186edcd7d757f16ac1f505 ******/
		%feature("compactdefaultargs") IsEmpty;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the is no intersection.
") IsEmpty;
		bool IsEmpty();

		/****** IntPatch_PrmPrmIntersection::Line ******/
		/****** md5 signature: 923de215ae03053b2e452a192ebdd240 ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
Returns the line of range Index. An exception is raised if Index<=0 or Index>NbLine.
") Line;
		const opencascade::handle<IntPatch_Line> & Line(const int Index);

		/****** IntPatch_PrmPrmIntersection::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection lines.
") NbLines;
		int NbLines();

		/****** IntPatch_PrmPrmIntersection::NbPointsGrille ******/
		/****** md5 signature: c2fb68d8552bedf35369e03fdc3994d0 ******/
		%feature("compactdefaultargs") NbPointsGrille;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPointsGrille;
		int NbPointsGrille();

		/****** IntPatch_PrmPrmIntersection::NewLine ******/
		/****** md5 signature: 98110d3735c49320e25d446e427d0048 ******/
		%feature("compactdefaultargs") NewLine;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Caro2: Adaptor3d_Surface
IndexLine: int
LowPoint: int
HighPoint: int
NbPoints: int

Return
-------
opencascade::handle<IntPatch_Line>

Description
-----------
Computes about <NbPoints> Intersection Points on the Line <IndexLine> between the Points of Index <LowPoint> and <HighPoint>. //! All the points of the line of index <IndexLine> with an index between <LowPoint> and <HighPoint> are in the returned line. New Points are inserted between existing points if those points are not too closed. //! An exception is raised if Index<=0 or Index>NbLine. or if IsDone returns False.
") NewLine;
		opencascade::handle<IntPatch_Line> NewLine(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const int IndexLine, const int LowPoint, const int HighPoint, const int NbPoints);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: dc573727b7426c32189edb3bc7b18491 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Polyhedron2: IntPatch_Polyhedron
Domain2: Adaptor3d_TopolTool
TolTangency: double
Epsilon: double
Deflection: double
Increment: double

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. Associated Polyhedrons <Polyhedron1> and <Polyhedron2> are given.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const IntPatch_Polyhedron & Polyhedron2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const double TolTangency, const double Epsilon, const double Deflection, const double Increment);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: d5710765c843406ccb8f3cb303fd672c ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
TolTangency: double
Epsilon: double
Deflection: double
Increment: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const double TolTangency, const double Epsilon, const double Deflection, const double Increment);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 411fc5c35930cd0f19e285375ad9bab7 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Domain2: Adaptor3d_TopolTool
TolTangency: double
Epsilon: double
Deflection: double
Increment: double
ClearFlag: bool (optional, default to true)

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const double TolTangency, const double Epsilon, const double Deflection, const double Increment, const bool ClearFlag = true);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 8bb4fda39521d8b76c2fffce659ec83b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Domain2: Adaptor3d_TopolTool
TolTangency: double
Epsilon: double
Deflection: double
Increment: double
ListOfPnts: NCollection_List<IntSurf_PntOn2S>

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const double TolTangency, const double Epsilon, const double Deflection, const double Increment, NCollection_List<IntSurf_PntOn2S> & ListOfPnts);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 2463c76f2575e8c804e596f84dc4763f ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Domain2: Adaptor3d_TopolTool
U1: double
V1: double
U2: double
V2: double
TolTangency: double
Epsilon: double
Deflection: double
Increment: double

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const double U1, const double V1, const double U2, const double V2, const double TolTangency, const double Epsilon, const double Deflection, const double Increment);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 24dee9d2e0e2204c5925a2cc5359f696 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
TolTangency: double
Epsilon: double
Deflection: double
Increment: double

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. The method computes the polyhedron on each surface.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const double TolTangency, const double Epsilon, const double Deflection, const double Increment);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 363dfbf0fbd0b56c2cf7f87f1a0d9f15 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Polyhedron2: IntPatch_Polyhedron
Domain2: Adaptor3d_TopolTool
TolTangency: double
Epsilon: double
Deflection: double
Increment: double

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. //! The polyhedron which approximates <Caro2>, <Polyhedron2> is given. The other one is computed.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const IntPatch_Polyhedron & Polyhedron2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const double TolTangency, const double Epsilon, const double Deflection, const double Increment);

		/****** IntPatch_PrmPrmIntersection::Perform ******/
		/****** md5 signature: 4a44ad6d5e5e5a200e40c6a5bcfa2792 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Caro1: Adaptor3d_Surface
Polyhedron1: IntPatch_Polyhedron
Domain1: Adaptor3d_TopolTool
Caro2: Adaptor3d_Surface
Domain2: Adaptor3d_TopolTool
TolTangency: double
Epsilon: double
Deflection: double
Increment: double

Return
-------
None

Description
-----------
Performs the intersection between <Caro1> and <Caro2>. //! The polyhedron which approximates <Caro1>, <Polyhedron1> is given. The other one is computed.
") Perform;
		void Perform(const opencascade::handle<Adaptor3d_Surface> & Caro1, const IntPatch_Polyhedron & Polyhedron1, const opencascade::handle<Adaptor3d_TopolTool> & Domain1, const opencascade::handle<Adaptor3d_Surface> & Caro2, const opencascade::handle<Adaptor3d_TopolTool> & Domain2, const double TolTangency, const double Epsilon, const double Deflection, const double Increment);

		/****** IntPatch_PrmPrmIntersection::PointDepart ******/
		/****** md5 signature: 3947bcbc9cf33defb38f35ba8bfc6cfa ******/
		%feature("compactdefaultargs") PointDepart;
		%feature("autodoc", "
Parameters
----------
LineOn2S: IntSurf_LineOn2S
S1: Adaptor3d_Surface
SU1: int
SV1: int
S2: Adaptor3d_Surface
SU2: int
SV2: int

Return
-------
None

Description
-----------
No available documentation.
") PointDepart;
		void PointDepart(opencascade::handle<IntSurf_LineOn2S> & LineOn2S, const opencascade::handle<Adaptor3d_Surface> & S1, const int SU1, const int SV1, const opencascade::handle<Adaptor3d_Surface> & S2, const int SU2, const int SV2);

		/****** IntPatch_PrmPrmIntersection::Remplit ******/
		/****** md5 signature: aadbd6d9361eb54b2c7b4cdf98cb5c6c ******/
		%feature("compactdefaultargs") Remplit;
		%feature("autodoc", "
Parameters
----------
a: int
b: int
c: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Return
-------
None

Description
-----------
No available documentation.
") Remplit;
		void Remplit(const int a, const int b, const int c, IntPatch_PrmPrmIntersection_T3Bits & Map);

		/****** IntPatch_PrmPrmIntersection::RemplitLin ******/
		/****** md5 signature: 556aef20d0f71172e0fc984b893bcef2 ******/
		%feature("compactdefaultargs") RemplitLin;
		%feature("autodoc", "
Parameters
----------
x1: int
y1: int
z1: int
x2: int
y2: int
z2: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Return
-------
None

Description
-----------
No available documentation.
") RemplitLin;
		void RemplitLin(const int x1, const int y1, const int z1, const int x2, const int y2, const int z2, IntPatch_PrmPrmIntersection_T3Bits & Map);

		/****** IntPatch_PrmPrmIntersection::RemplitTri ******/
		/****** md5 signature: be31197cd400d1448590c086e129c06d ******/
		%feature("compactdefaultargs") RemplitTri;
		%feature("autodoc", "
Parameters
----------
x1: int
y1: int
z1: int
x2: int
y2: int
z2: int
x3: int
y3: int
z3: int
Map: IntPatch_PrmPrmIntersection_T3Bits

Return
-------
None

Description
-----------
No available documentation.
") RemplitTri;
		void RemplitTri(const int x1, const int y1, const int z1, const int x2, const int y2, const int z2, const int x3, const int y3, const int z3, IntPatch_PrmPrmIntersection_T3Bits & Map);

};


%extend IntPatch_PrmPrmIntersection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************************
* class IntPatch_PrmPrmIntersection_T3Bits *
*******************************************/
class IntPatch_PrmPrmIntersection_T3Bits {
	public:
		/****** IntPatch_PrmPrmIntersection_T3Bits::IntPatch_PrmPrmIntersection_T3Bits ******/
		/****** md5 signature: 254e905d40dc25b5c45d70a278aef413 ******/
		%feature("compactdefaultargs") IntPatch_PrmPrmIntersection_T3Bits;
		%feature("autodoc", "
Parameters
----------
size: int

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_PrmPrmIntersection_T3Bits;
		 IntPatch_PrmPrmIntersection_T3Bits(const int size);

		/****** IntPatch_PrmPrmIntersection_T3Bits::Add ******/
		/****** md5 signature: 9e27b06eb05666ff149428d29c4537e7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
t: int

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const int t);

		/****** IntPatch_PrmPrmIntersection_T3Bits::And ******/
		/****** md5 signature: e8fab7ab3b06aa04701c5cb300c7dbc5 ******/
		%feature("compactdefaultargs") And;
		%feature("autodoc", "
Parameters
----------
Oth: IntPatch_PrmPrmIntersection_T3Bits

Return
-------
indiceprecedent: int

Description
-----------
No available documentation.
") And;
		int And(IntPatch_PrmPrmIntersection_T3Bits & Oth, Standard_Integer &OutValue);

		/****** IntPatch_PrmPrmIntersection_T3Bits::Raz ******/
		/****** md5 signature: 6b85d5976258ebbb55c78a94aad6450e ******/
		%feature("compactdefaultargs") Raz;
		%feature("autodoc", "
Parameters
----------
t: int

Return
-------
None

Description
-----------
No available documentation.
") Raz;
		void Raz(const int t);

		/****** IntPatch_PrmPrmIntersection_T3Bits::ResetAnd ******/
		/****** md5 signature: 54dfe31b09e5a3c02e8155e330083c1c ******/
		%feature("compactdefaultargs") ResetAnd;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetAnd;
		void ResetAnd();

		/****** IntPatch_PrmPrmIntersection_T3Bits::Val ******/
		/****** md5 signature: e18a86e5b1313b12c1bdc2b08a7ed1d3 ******/
		%feature("compactdefaultargs") Val;
		%feature("autodoc", "
Parameters
----------
t: int

Return
-------
int

Description
-----------
No available documentation.
") Val;
		int Val(const int t);

};


%extend IntPatch_PrmPrmIntersection_T3Bits {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/************************
* class IntPatch_RstInt *
************************/
class IntPatch_RstInt {
	public:
		/****** IntPatch_RstInt::PutVertexOnLine ******/
		/****** md5 signature: fed8f8ca071672c7635d41b35095dca7 ******/
		%feature("compactdefaultargs") PutVertexOnLine;
		%feature("autodoc", "
Parameters
----------
L: IntPatch_Line
Surf: Adaptor3d_Surface
Domain: Adaptor3d_TopolTool
OtherSurf: Adaptor3d_Surface
OnFirst: bool
Tol: double

Return
-------
None

Description
-----------
No available documentation.
") PutVertexOnLine;
		static void PutVertexOnLine(const opencascade::handle<IntPatch_Line> & L, const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const opencascade::handle<Adaptor3d_Surface> & OtherSurf, const bool OnFirst, const double Tol);

};


%extend IntPatch_RstInt {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************************
* class IntPatch_SpecialPoints *
*******************************/
class IntPatch_SpecialPoints {
	public:
		/****** IntPatch_SpecialPoints::AddCrossUVIsoPoint ******/
		/****** md5 signature: 20d9bd07fef0ee9770ec0cb8c1772fec ******/
		%feature("compactdefaultargs") AddCrossUVIsoPoint;
		%feature("autodoc", "
Parameters
----------
theQSurf: Adaptor3d_Surface
thePSurf: Adaptor3d_Surface
theRefPt: IntSurf_PntOn2S
theTol3d: double
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool (optional, default to false)

Return
-------
bool

Description
-----------
Adds the point defined as intersection of two isolines (U = 0 and V = 0) on theQSurf in theLine. theRefPt is used to correct adjusting parameters. If theIsReversed is True then theQSurf correspond to the second (otherwise, the first) surface while forming intersection point IntSurf_PntOn2S.
") AddCrossUVIsoPoint;
		static bool AddCrossUVIsoPoint(const opencascade::handle<Adaptor3d_Surface> & theQSurf, const opencascade::handle<Adaptor3d_Surface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const double theTol3d, IntSurf_PntOn2S & theAddedPoint, const bool theIsReversed = false);

		/****** IntPatch_SpecialPoints::AddPointOnUorVIso ******/
		/****** md5 signature: d1eb1d3db6baaf8ed9ee28e11929ac3c ******/
		%feature("compactdefaultargs") AddPointOnUorVIso;
		%feature("autodoc", "
Parameters
----------
theQSurf: Adaptor3d_Surface
thePSurf: Adaptor3d_Surface
theRefPt: IntSurf_PntOn2S
theIsU: bool
theIsoParameter: double
theToler: math_VectorBase<double >
theInitPoint: math_VectorBase<double >
theInfBound: math_VectorBase<double >
theSupBound: math_VectorBase<double >
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool (optional, default to false)

Return
-------
bool

Description
-----------
Adds the point lain strictly in the isoline U = 0 or V = 0 of theQSurf, in theLine. theRefPt is used to correct adjusting parameters. If theIsReversed is True then theQSurf corresponds to the second (otherwise, the first) surface while forming intersection point IntSurf_PntOn2S. All math_Vector-objects must be filled as follows: [1] - U-parameter of thePSurf; [2] - V-parameter of thePSurf; [3] - U- (if V-isoline is considered) or V-parameter (if U-isoline is considered) of theQSurf.
") AddPointOnUorVIso;
		static bool AddPointOnUorVIso(const opencascade::handle<Adaptor3d_Surface> & theQSurf, const opencascade::handle<Adaptor3d_Surface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const bool theIsU, const double theIsoParameter, math_VectorBase<double > theToler, math_VectorBase<double > theInitPoint, math_VectorBase<double > theInfBound, math_VectorBase<double > theSupBound, IntSurf_PntOn2S & theAddedPoint, const bool theIsReversed = false);

		/****** IntPatch_SpecialPoints::AddSingularPole ******/
		/****** md5 signature: b4e1b54a4c9e552c4eab0e35e5eb429e ******/
		%feature("compactdefaultargs") AddSingularPole;
		%feature("autodoc", "
Parameters
----------
theQSurf: Adaptor3d_Surface
thePSurf: Adaptor3d_Surface
thePtIso: IntSurf_PntOn2S
theVertex: IntPatch_Point
theAddedPoint: IntSurf_PntOn2S
theIsReversed: bool (optional, default to false)
theIsReqRefCheck: bool (optional, default to false)

Return
-------
bool

Description
-----------
Computes the pole of sphere to add it in the intersection line. Stores the result in theAddedPoint variable (does not add in the line). At that, cone and sphere (with singularity) must be set in theQSurf parameter. By default (if theIsReversed == False), theQSurf is the first surface of the Walking line. If it is not, theIsReversed parameter must be set to True. theIsReqRefCheck is True if and only if 3D-point of theRefPt must be pole or apex for check (e.g. if it is vertex). thePtIso is the reference point for obtaining isoline where must be placed the Apex/Pole. //! ATTENTION!!! theVertex must be initialized before calling the method .
") AddSingularPole;
		static bool AddSingularPole(const opencascade::handle<Adaptor3d_Surface> & theQSurf, const opencascade::handle<Adaptor3d_Surface> & thePSurf, const IntSurf_PntOn2S & thePtIso, IntPatch_Point & theVertex, IntSurf_PntOn2S & theAddedPoint, const bool theIsReversed = false, const bool theIsReqRefCheck = false);

		/****** IntPatch_SpecialPoints::AdjustPointAndVertex ******/
		/****** md5 signature: c25fa5c368c989ed4cfa2c02c4282ae5 ******/
		%feature("compactdefaultargs") AdjustPointAndVertex;
		%feature("autodoc", "
Parameters
----------
theRefPoint: IntSurf_PntOn2S
theArrPeriods: double
theNewPoint: IntSurf_PntOn2S
theVertex: IntPatch_Point * (optional, default to nullptr)

Return
-------
None

Description
-----------
Sets theNewPoint parameters in 2D-space the closest to theRefPoint with help of adding/subtracting corresponding periods. theArrPeriods must be filled as follows: {<U-period of 1st surface>, <V-period of 1st surface>, <U-period of 2nd surface>, <V-period of 2nd surface>}. If theVertex != 0 then its parameters will be filled as corresponding parameters of theNewPoint. //! ATTENTION!!! theNewPoint is not only Output parameter. It is Input/Output one. I.e. theNewPoint is reference point together with theRefPt.
") AdjustPointAndVertex;
		static void AdjustPointAndVertex(const IntSurf_PntOn2S & theRefPoint, const double theArrPeriods[4], IntSurf_PntOn2S & theNewPoint, IntPatch_Point * const theVertex = nullptr);

		/****** IntPatch_SpecialPoints::ContinueAfterSpecialPoint ******/
		/****** md5 signature: 3fda5374d88a91be3197fb73777e6c5d ******/
		%feature("compactdefaultargs") ContinueAfterSpecialPoint;
		%feature("autodoc", "
Parameters
----------
theQSurf: Adaptor3d_Surface
thePSurf: Adaptor3d_Surface
theRefPt: IntSurf_PntOn2S
theSPType: IntPatch_SpecPntType
theTol2D: double
theNewPoint: IntSurf_PntOn2S
theIsReversed: bool (optional, default to false)

Return
-------
bool

Description
-----------
Special point has already been added in the line. Now, we need in correct prolongation of the line or in start new line. This function returns new point. //! ATTENTION!!! theNewPoint is not only Output parameter. It is Input/Output one. I.e. theNewPoint is reference point together with theRefPt.
") ContinueAfterSpecialPoint;
		static bool ContinueAfterSpecialPoint(const opencascade::handle<Adaptor3d_Surface> & theQSurf, const opencascade::handle<Adaptor3d_Surface> & thePSurf, const IntSurf_PntOn2S & theRefPt, const IntPatch_SpecPntType theSPType, const double theTol2D, IntSurf_PntOn2S & theNewPoint, const bool theIsReversed = false);

};


%extend IntPatch_SpecialPoints {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************************************
* class IntPatch_TheIWLineOfTheIWalking *
****************************************/
class IntPatch_TheIWLineOfTheIWalking : public Standard_Transient {
	public:
		/****** IntPatch_TheIWLineOfTheIWalking::IntPatch_TheIWLineOfTheIWalking ******/
		/****** md5 signature: d6e992e52355d5e6f3ba3cc21778f507 ******/
		%feature("compactdefaultargs") IntPatch_TheIWLineOfTheIWalking;
		%feature("autodoc", "
Parameters
----------
theAllocator: IntSurf_Allocator (optional, default to nullptr)

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheIWLineOfTheIWalking;
		 IntPatch_TheIWLineOfTheIWalking(const IntSurf_Allocator & theAllocator = nullptr);

		/****** IntPatch_TheIWLineOfTheIWalking::AddIndexPassing ******/
		/****** md5 signature: bde76ddfc9fd3149d5e8a69fba3de18f ******/
		%feature("compactdefaultargs") AddIndexPassing;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
associate the index of the point on the line with the index of the point passing through the starting iterator.
") AddIndexPassing;
		void AddIndexPassing(const int Index);

		/****** IntPatch_TheIWLineOfTheIWalking::AddPoint ******/
		/****** md5 signature: 806b6da489848ff70e42ef52b8d76d5c ******/
		%feature("compactdefaultargs") AddPoint;
		%feature("autodoc", "
Parameters
----------
P: IntSurf_PntOn2S

Return
-------
None

Description
-----------
Add a point in the line.
") AddPoint;
		void AddPoint(const IntSurf_PntOn2S & P);

		/****** IntPatch_TheIWLineOfTheIWalking::AddStatusFirst ******/
		/****** md5 signature: 309da47086c91d4b55ab9322713e46b6 ******/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "
Parameters
----------
Closed: bool
HasFirst: bool

Return
-------
None

Description
-----------
No available documentation.
") AddStatusFirst;
		void AddStatusFirst(const bool Closed, const bool HasFirst);

		/****** IntPatch_TheIWLineOfTheIWalking::AddStatusFirst ******/
		/****** md5 signature: 6a054410b270f07fdc8f55a488588f7b ******/
		%feature("compactdefaultargs") AddStatusFirst;
		%feature("autodoc", "
Parameters
----------
Closed: bool
HasLast: bool
Index: int
P: IntSurf_PathPoint

Return
-------
None

Description
-----------
No available documentation.
") AddStatusFirst;
		void AddStatusFirst(const bool Closed, const bool HasLast, const int Index, const IntSurf_PathPoint & P);

		/****** IntPatch_TheIWLineOfTheIWalking::AddStatusFirstLast ******/
		/****** md5 signature: fca87ad519cda1e6ce4b2785b71fefb5 ******/
		%feature("compactdefaultargs") AddStatusFirstLast;
		%feature("autodoc", "
Parameters
----------
Closed: bool
HasFirst: bool
HasLast: bool

Return
-------
None

Description
-----------
No available documentation.
") AddStatusFirstLast;
		void AddStatusFirstLast(const bool Closed, const bool HasFirst, const bool HasLast);

		/****** IntPatch_TheIWLineOfTheIWalking::AddStatusLast ******/
		/****** md5 signature: d4dad969f2ee054ae4f95897518310f1 ******/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "
Parameters
----------
HasLast: bool

Return
-------
None

Description
-----------
No available documentation.
") AddStatusLast;
		void AddStatusLast(const bool HasLast);

		/****** IntPatch_TheIWLineOfTheIWalking::AddStatusLast ******/
		/****** md5 signature: 2a3e07299ee2f37b5b1aba2b4ce3c8f2 ******/
		%feature("compactdefaultargs") AddStatusLast;
		%feature("autodoc", "
Parameters
----------
HasLast: bool
Index: int
P: IntSurf_PathPoint

Return
-------
None

Description
-----------
No available documentation.
") AddStatusLast;
		void AddStatusLast(const bool HasLast, const int Index, const IntSurf_PathPoint & P);

		/****** IntPatch_TheIWLineOfTheIWalking::Cut ******/
		/****** md5 signature: 45deb1b2d88847257c59414f67c20464 ******/
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
None

Description
-----------
Cut the line at the point of rank Index.
") Cut;
		void Cut(const int Index);

		/****** IntPatch_TheIWLineOfTheIWalking::FirstPoint ******/
		/****** md5 signature: e0c1dbe8c28165db2dbe2ecf721fcc02 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntSurf_PathPoint

Description
-----------
Returns the first point of the line when it is a marching point. An exception is raised if HasFirstPoint returns False.
") FirstPoint;
		const IntSurf_PathPoint & FirstPoint();

		/****** IntPatch_TheIWLineOfTheIWalking::FirstPointIndex ******/
		/****** md5 signature: 3211170de320ab60c8ead46058ce918f ******/
		%feature("compactdefaultargs") FirstPointIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the Index of first point of the line when it is a marching point. This index is the index in the PointStartIterator. An exception is raised if HasFirstPoint returns False.
") FirstPointIndex;
		int FirstPointIndex();

		/****** IntPatch_TheIWLineOfTheIWalking::HasFirstPoint ******/
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the first point of the line is a marching point. when HasFirstPoint==False the line begins on the natural bound of the surface. The line can be too long.
") HasFirstPoint;
		bool HasFirstPoint();

		/****** IntPatch_TheIWLineOfTheIWalking::HasLastPoint ******/
		/****** md5 signature: c85dac3d84a6b6ab2854e34ac0e4ffcb ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the end point of the line is a marching point (Point from IntWS). when HasFirstPoint==False the line ends on the natural bound of the surface. The line can be too long.
") HasLastPoint;
		bool HasLastPoint();

		/****** IntPatch_TheIWLineOfTheIWalking::IsClosed ******/
		/****** md5 signature: 66fc0caa1853d24780b1d28b8296bc6c ******/
		%feature("compactdefaultargs") IsClosed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line is closed.
") IsClosed;
		bool IsClosed();

		/****** IntPatch_TheIWLineOfTheIWalking::IsTangentAtBegining ******/
		/****** md5 signature: aa1e4a3a81269a17ab62d556ec9ab74c ******/
		%feature("compactdefaultargs") IsTangentAtBegining;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangentAtBegining;
		bool IsTangentAtBegining();

		/****** IntPatch_TheIWLineOfTheIWalking::IsTangentAtEnd ******/
		/****** md5 signature: d693a46306cf177fc338d14663f0a3bb ******/
		%feature("compactdefaultargs") IsTangentAtEnd;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangentAtEnd;
		bool IsTangentAtEnd();

		/****** IntPatch_TheIWLineOfTheIWalking::LastPoint ******/
		/****** md5 signature: 7876841b5cf564c633cdd87a1ac1e722 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntSurf_PathPoint

Description
-----------
Returns the last point of the line when it is a marching point. An exception is raised if HasLastPoint returns False.
") LastPoint;
		const IntSurf_PathPoint & LastPoint();

		/****** IntPatch_TheIWLineOfTheIWalking::LastPointIndex ******/
		/****** md5 signature: dd0232cbaf64f8bd52c0361e20f012bc ******/
		%feature("compactdefaultargs") LastPointIndex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the index of last point of the line when it is a marching point. This index is the index in the PointStartIterator. An exception is raised if HasLastPoint returns False.
") LastPointIndex;
		int LastPointIndex();

		/****** IntPatch_TheIWLineOfTheIWalking::Line ******/
		/****** md5 signature: d5c2cd917d9e773fdb8b23c68d6a1fdc ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Returns the LineOn2S contained in the walking line.
") Line;
		const opencascade::handle<IntSurf_LineOn2S> & Line();

		/****** IntPatch_TheIWLineOfTheIWalking::NbPassingPoint ******/
		/****** md5 signature: d2e9c44670b445492d329e73bf77e957 ******/
		%feature("compactdefaultargs") NbPassingPoint;
		%feature("autodoc", "Return
-------
int

Description
-----------
returns the number of points belonging to Pnts1 which are passing point.
") NbPassingPoint;
		int NbPassingPoint();

		/****** IntPatch_TheIWLineOfTheIWalking::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points of the line (including first point and end point: see HasLastPoint and HasFirstPoint).
") NbPoints;
		int NbPoints();

		/****** IntPatch_TheIWLineOfTheIWalking::PassingPoint ******/
		/****** md5 signature: 622122aaed0a2c52208ace10effc53a8 ******/
		%feature("compactdefaultargs") PassingPoint;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IndexLine: int
IndexPnts: int

Description
-----------
returns the index of the point belonging to the line which is associated to the passing point belonging to Pnts1 an exception is raised if Index > NbPassingPoint().
") PassingPoint;
		void PassingPoint(const int Index, Standard_Integer &OutValue, Standard_Integer &OutValue);

		/****** IntPatch_TheIWLineOfTheIWalking::Reverse ******/
		/****** md5 signature: b751d6874fc026e19a7a6cb37e9ac1b4 ******/
		%feature("compactdefaultargs") Reverse;
		%feature("autodoc", "Return
-------
None

Description
-----------
reverse the points in the line. Hasfirst, HasLast are kept.
") Reverse;
		void Reverse();

		/****** IntPatch_TheIWLineOfTheIWalking::SetTangencyAtBegining ******/
		/****** md5 signature: a9c68eae26d6e2820e16af9bf963ea73 ******/
		%feature("compactdefaultargs") SetTangencyAtBegining;
		%feature("autodoc", "
Parameters
----------
IsTangent: bool

Return
-------
None

Description
-----------
No available documentation.
") SetTangencyAtBegining;
		void SetTangencyAtBegining(const bool IsTangent);

		/****** IntPatch_TheIWLineOfTheIWalking::SetTangencyAtEnd ******/
		/****** md5 signature: 019662b4a1e47ed938c27ea7648bdb82 ******/
		%feature("compactdefaultargs") SetTangencyAtEnd;
		%feature("autodoc", "
Parameters
----------
IsTangent: bool

Return
-------
None

Description
-----------
No available documentation.
") SetTangencyAtEnd;
		void SetTangencyAtEnd(const bool IsTangent);

		/****** IntPatch_TheIWLineOfTheIWalking::SetTangentVector ******/
		/****** md5 signature: 0e189218da5eed715cfc0089dc919714 ******/
		%feature("compactdefaultargs") SetTangentVector;
		%feature("autodoc", "
Parameters
----------
V: gp_Vec
Index: int

Return
-------
None

Description
-----------
No available documentation.
") SetTangentVector;
		void SetTangentVector(const gp_Vec & V, const int Index);

		/****** IntPatch_TheIWLineOfTheIWalking::TangentVector ******/
		/****** md5 signature: fd80ff20b3f5a28424944277e711445e ******/
		%feature("compactdefaultargs") TangentVector;
		%feature("autodoc", "
Parameters
----------

Return
-------
Index: int

Description
-----------
No available documentation.
") TangentVector;
		const gp_Vec TangentVector(Standard_Integer &OutValue);

		/****** IntPatch_TheIWLineOfTheIWalking::Value ******/
		/****** md5 signature: 344ab61d440fab1850713aee8091a920 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the point of range Index. If index <= 0 or Index > NbPoints, an exception is raised.
") Value;
		const IntSurf_PntOn2S & Value(const int Index);

};


%make_alias(IntPatch_TheIWLineOfTheIWalking)

%extend IntPatch_TheIWLineOfTheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*****************************
* class IntPatch_TheIWalking *
*****************************/
class IntPatch_TheIWalking {
	public:
		/****** IntPatch_TheIWalking::IntPatch_TheIWalking ******/
		/****** md5 signature: a9e20ace0d8427310e7cf54a1060fb0c ******/
		%feature("compactdefaultargs") IntPatch_TheIWalking;
		%feature("autodoc", "
Parameters
----------
Epsilon: double
Deflection: double
Step: double
theToFillHoles: bool (optional, default to false)

Return
-------
None

Description
-----------
Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. Step is the maximum increment admitted between two consecutive points (in 2d space). Epsilon is the tolerance beyond which 2 points are confused. theToFillHoles is the flag defining whether possible holes between resulting curves are filled or not in case of IntPatch walking theToFillHoles is False.
") IntPatch_TheIWalking;
		 IntPatch_TheIWalking(const double Epsilon, const double Deflection, const double Step, const bool theToFillHoles = false);

		/****** IntPatch_TheIWalking::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if the calculus was successful.
") IsDone;
		bool IsDone();

		/****** IntPatch_TheIWalking::NbLines ******/
		/****** md5 signature: 7c1b53177daa19e8eec95fb1ac3b65c8 ******/
		%feature("compactdefaultargs") NbLines;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of resulting polylines. An exception is raised if IsDone returns False.
") NbLines;
		int NbLines();

		/****** IntPatch_TheIWalking::NbSinglePnts ******/
		/****** md5 signature: f1b67cb30ffc42c2108869640ba5114a ******/
		%feature("compactdefaultargs") NbSinglePnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points belonging to Pnts on which no line starts or ends. An exception is raised if IsDone returns False.
") NbSinglePnts;
		int NbSinglePnts();

		/****** IntPatch_TheIWalking::Perform ******/
		/****** md5 signature: 00316a8362db69b1cf516edbbfd4334a ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnts1: NCollection_Sequence<IntSurf_PathPoint>
Pnts2: NCollection_Sequence<IntSurf_InteriorPoint>
Func: IntPatch_TheSurfFunction
S: Adaptor3d_Surface
Reversed: bool (optional, default to false)

Return
-------
None

Description
-----------
Searches a set of polylines starting on a point of Pnts1 or Pnts2. Each point on a resulting polyline verifies F(u,v)=0.
") Perform;
		void Perform(const NCollection_Sequence<IntSurf_PathPoint> & Pnts1, const NCollection_Sequence<IntSurf_InteriorPoint> & Pnts2, IntPatch_TheSurfFunction & Func, const opencascade::handle<Adaptor3d_Surface> & S, const bool Reversed = false);

		/****** IntPatch_TheIWalking::Perform ******/
		/****** md5 signature: cfa2d415a5e712724ef08ccafb095cd6 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
Pnts1: NCollection_Sequence<IntSurf_PathPoint>
Func: IntPatch_TheSurfFunction
S: Adaptor3d_Surface
Reversed: bool (optional, default to false)

Return
-------
None

Description
-----------
Searches a set of polylines starting on a point of Pnts1. Each point on a resulting polyline verifies F(u,v)=0.
") Perform;
		void Perform(const NCollection_Sequence<IntSurf_PathPoint> & Pnts1, IntPatch_TheSurfFunction & Func, const opencascade::handle<Adaptor3d_Surface> & S, const bool Reversed = false);

		/****** IntPatch_TheIWalking::SetTolerance ******/
		/****** md5 signature: 3564d886237339d2a77bbae8a62ca5a3 ******/
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "
Parameters
----------
Epsilon: double
Deflection: double
Step: double

Return
-------
None

Description
-----------
Deflection is the maximum deflection admitted between two consecutive points on a resulting polyline. Step is the maximum increment admitted between two consecutive points (in 2d space). Epsilon is the tolerance beyond which 2 points are confused.
") SetTolerance;
		void SetTolerance(const double Epsilon, const double Deflection, const double Step);

		/****** IntPatch_TheIWalking::SinglePnt ******/
		/****** md5 signature: 0c2543cf594dde763111a0259b3536b6 ******/
		%feature("compactdefaultargs") SinglePnt;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PathPoint

Description
-----------
Returns the point of range Index . An exception is raised if IsDone returns False. An exception is raised if Index<=0 or Index > NbSinglePnts.
") SinglePnt;
		const IntSurf_PathPoint & SinglePnt(const int Index);

		/****** IntPatch_TheIWalking::Value ******/
		/****** md5 signature: c2f7e3b0e68741374d74ddc195b7c8f7 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
opencascade::handle<IntPatch_TheIWLineOfTheIWalking>

Description
-----------
Returns the polyline of range Index. An exception is raised if IsDone is False. An exception is raised if Index<=0 or Index>NbLines.
") Value;
		const opencascade::handle<IntPatch_TheIWLineOfTheIWalking> & Value(const int Index);

};


%extend IntPatch_TheIWalking {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/********************************************
* class IntPatch_ThePathPointOfTheSOnBounds *
********************************************/
class IntPatch_ThePathPointOfTheSOnBounds {
	public:
		/****** IntPatch_ThePathPointOfTheSOnBounds::IntPatch_ThePathPointOfTheSOnBounds ******/
		/****** md5 signature: 950e45efbf1ebe13417c7e23de45ae8a ******/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds();

		/****** IntPatch_ThePathPointOfTheSOnBounds::IntPatch_ThePathPointOfTheSOnBounds ******/
		/****** md5 signature: f42621a2a16bf066e9fa338af1bc5908 ******/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: double
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d
Parameter: double

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds(const gp_Pnt & P, const double Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A, const double Parameter);

		/****** IntPatch_ThePathPointOfTheSOnBounds::IntPatch_ThePathPointOfTheSOnBounds ******/
		/****** md5 signature: 48fca20af6ee805349043a1d3ea14c41 ******/
		%feature("compactdefaultargs") IntPatch_ThePathPointOfTheSOnBounds;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: double
A: Adaptor2d_Curve2d
Parameter: double

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_ThePathPointOfTheSOnBounds;
		 IntPatch_ThePathPointOfTheSOnBounds(const gp_Pnt & P, const double Tol, const opencascade::handle<Adaptor2d_Curve2d> & A, const double Parameter);

		/****** IntPatch_ThePathPointOfTheSOnBounds::Arc ******/
		/****** md5 signature: de8e47510fc50811ee5a3e0bc98029e6 ******/
		%feature("compactdefaultargs") Arc;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") Arc;
		const opencascade::handle<Adaptor2d_Curve2d> & Arc();

		/****** IntPatch_ThePathPointOfTheSOnBounds::IsNew ******/
		/****** md5 signature: 3e8db0e1293344166ca6cbedee1b961d ******/
		%feature("compactdefaultargs") IsNew;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsNew;
		bool IsNew();

		/****** IntPatch_ThePathPointOfTheSOnBounds::Parameter ******/
		/****** md5 signature: 28e42519a120bf741c23eca7aaca5525 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter();

		/****** IntPatch_ThePathPointOfTheSOnBounds::SetValue ******/
		/****** md5 signature: e66e8a8030b9c4660d70f69ad456de66 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: double
V: Adaptor3d_HVertex
A: Adaptor2d_Curve2d
Parameter: double

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P, const double Tol, const opencascade::handle<Adaptor3d_HVertex> & V, const opencascade::handle<Adaptor2d_Curve2d> & A, const double Parameter);

		/****** IntPatch_ThePathPointOfTheSOnBounds::SetValue ******/
		/****** md5 signature: c616187800f2bcef8f485c8ee2a3fda1 ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
Tol: double
A: Adaptor2d_Curve2d
Parameter: double

Return
-------
None

Description
-----------
No available documentation.
") SetValue;
		void SetValue(const gp_Pnt & P, const double Tol, const opencascade::handle<Adaptor2d_Curve2d> & A, const double Parameter);

		/****** IntPatch_ThePathPointOfTheSOnBounds::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Tolerance;
		double Tolerance();

		/****** IntPatch_ThePathPointOfTheSOnBounds::Value ******/
		/****** md5 signature: eddd2908948849b73f6d8aacab318652 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Value;
		const gp_Pnt Value();

		/****** IntPatch_ThePathPointOfTheSOnBounds::Vertex ******/
		/****** md5 signature: 7213fb18dc3be1f48818ab739bb98dfa ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_HVertex>

Description
-----------
No available documentation.
") Vertex;
		const opencascade::handle<Adaptor3d_HVertex> & Vertex();

};


%extend IntPatch_ThePathPointOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************
* class IntPatch_TheSOnBounds *
******************************/
class IntPatch_TheSOnBounds {
	public:
		/****** IntPatch_TheSOnBounds::IntPatch_TheSOnBounds ******/
		/****** md5 signature: 35ed78ed5dc90e5bd58bf2c0beb9f5c1 ******/
		%feature("compactdefaultargs") IntPatch_TheSOnBounds;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntPatch_TheSOnBounds;
		 IntPatch_TheSOnBounds();

		/****** IntPatch_TheSOnBounds::AllArcSolution ******/
		/****** md5 signature: 773a5663608490a1b934c2a55dfafaa2 ******/
		%feature("compactdefaultargs") AllArcSolution;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if all arc of the Arcs are solution (inside the surface). An exception is raised if IsDone returns False.
") AllArcSolution;
		bool AllArcSolution();

		/****** IntPatch_TheSOnBounds::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the calculus was successful.
") IsDone;
		bool IsDone();

		/****** IntPatch_TheSOnBounds::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of resulting points. An exception is raised if IsDone returns False (NotDone).
") NbPoints;
		int NbPoints();

		/****** IntPatch_TheSOnBounds::NbSegments ******/
		/****** md5 signature: 9aee6c2253f8ba296b560fdee30e17ad ******/
		%feature("compactdefaultargs") NbSegments;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of the resulting segments. An exception is raised if IsDone returns False (NotDone).
") NbSegments;
		int NbSegments();

		/****** IntPatch_TheSOnBounds::Perform ******/
		/****** md5 signature: 0fb5a19a5f618a8a4a97b689e304cd1b ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: IntPatch_ArcFunction
Domain: Adaptor3d_TopolTool
TolBoundary: double
TolTangency: double
RecheckOnRegularity: bool (optional, default to false)

Return
-------
None

Description
-----------
Algorithm to find the points and parts of curves of Domain (domain of of restriction of a surface) which verify F = 0. TolBoundary defines if a curve is on Q. TolTangency defines if a point is on Q.
") Perform;
		void Perform(IntPatch_ArcFunction & F, const opencascade::handle<Adaptor3d_TopolTool> & Domain, const double TolBoundary, const double TolTangency, const bool RecheckOnRegularity = false);

		/****** IntPatch_TheSOnBounds::Point ******/
		/****** md5 signature: e607756e209a929844054ac7e9597198 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_ThePathPointOfTheSOnBounds

Description
-----------
Returns the resulting point of range Index. The exception NotDone is raised if IsDone() returns False. The exception OutOfRange is raised if Index <= 0 or Index > NbPoints.
") Point;
		const IntPatch_ThePathPointOfTheSOnBounds & Point(const int Index);

		/****** IntPatch_TheSOnBounds::Segment ******/
		/****** md5 signature: cb1722479c05c35afce657e5329b3ca3 ******/
		%feature("compactdefaultargs") Segment;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_TheSegmentOfTheSOnBounds

Description
-----------
Returns the resulting segment of range Index. The exception NotDone is raised if IsDone() returns False. The exception OutOfRange is raised if Index <= 0 or Index > NbPoints.
") Segment;
		const IntPatch_TheSegmentOfTheSOnBounds & Segment(const int Index);

};


%extend IntPatch_TheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPatch_TheSearchInside *
*********************************/
class IntPatch_TheSearchInside {
	public:
		/****** IntPatch_TheSearchInside::IntPatch_TheSearchInside ******/
		/****** md5 signature: 3b61b92a1141071fba4f10fc8dd2190d ******/
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside();

		/****** IntPatch_TheSearchInside::IntPatch_TheSearchInside ******/
		/****** md5 signature: 327c9b0d0a00912c87cfe299bec233f1 ******/
		%feature("compactdefaultargs") IntPatch_TheSearchInside;
		%feature("autodoc", "
Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_Surface
T: Adaptor3d_TopolTool
Epsilon: double

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheSearchInside;
		 IntPatch_TheSearchInside(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const double Epsilon);

		/****** IntPatch_TheSearchInside::IsDone ******/
		/****** md5 signature: 1e1ad145af7d8c16b253ee9a4b0d6a43 ******/
		%feature("compactdefaultargs") IsDone;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsDone;
		bool IsDone();

		/****** IntPatch_TheSearchInside::NbPoints ******/
		/****** md5 signature: 0243a6484ef0942dcad871f7c247b5de ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of points. The exception NotDone if raised if IsDone returns False.
") NbPoints;
		int NbPoints();

		/****** IntPatch_TheSearchInside::Perform ******/
		/****** md5 signature: 69fb684da369f2df353a4dffa05648a0 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_Surface
T: Adaptor3d_TopolTool
Epsilon: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const opencascade::handle<Adaptor3d_TopolTool> & T, const double Epsilon);

		/****** IntPatch_TheSearchInside::Perform ******/
		/****** md5 signature: 4259e9c88d7a1acebcbda1bb1947a843 ******/
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "
Parameters
----------
F: IntPatch_TheSurfFunction
Surf: Adaptor3d_Surface
UStart: double
VStart: double

Return
-------
None

Description
-----------
No available documentation.
") Perform;
		void Perform(IntPatch_TheSurfFunction & F, const opencascade::handle<Adaptor3d_Surface> & Surf, const double UStart, const double VStart);

		/****** IntPatch_TheSearchInside::Value ******/
		/****** md5 signature: 53957a7cef022ac96aca4f6ccc589f73 ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_InteriorPoint

Description
-----------
Returns the point of range Index. The exception NotDone if raised if IsDone returns False. The exception OutOfRange if raised if Index <= 0 or Index > NbPoints.
") Value;
		const IntSurf_InteriorPoint & Value(const int Index);

};


%extend IntPatch_TheSearchInside {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************************************
* class IntPatch_TheSegmentOfTheSOnBounds *
******************************************/
class IntPatch_TheSegmentOfTheSOnBounds {
	public:
		/****** IntPatch_TheSegmentOfTheSOnBounds::IntPatch_TheSegmentOfTheSOnBounds ******/
		/****** md5 signature: a1aa63a1b06aae0ebd5e08e7d83b3d14 ******/
		%feature("compactdefaultargs") IntPatch_TheSegmentOfTheSOnBounds;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") IntPatch_TheSegmentOfTheSOnBounds;
		 IntPatch_TheSegmentOfTheSOnBounds();

		/****** IntPatch_TheSegmentOfTheSOnBounds::Curve ******/
		/****** md5 signature: 7869036a594a0e406162d60b4f92dc85 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the geometric curve on the surface 's domain which is solution.
") Curve;
		const opencascade::handle<Adaptor2d_Curve2d> & Curve();

		/****** IntPatch_TheSegmentOfTheSOnBounds::FirstPoint ******/
		/****** md5 signature: 04ae1a5baa94ab3c05537203f1b7c1f4 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntPatch_ThePathPointOfTheSOnBounds

Description
-----------
Returns the first point.
") FirstPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & FirstPoint();

		/****** IntPatch_TheSegmentOfTheSOnBounds::HasFirstPoint ******/
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a vertex (ThePathPoint) defining the lowest valid parameter on the arc.
") HasFirstPoint;
		bool HasFirstPoint();

		/****** IntPatch_TheSegmentOfTheSOnBounds::HasLastPoint ******/
		/****** md5 signature: c85dac3d84a6b6ab2854e34ac0e4ffcb ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if there is a vertex (ThePathPoint) defining the greatest valid parameter on the arc.
") HasLastPoint;
		bool HasLastPoint();

		/****** IntPatch_TheSegmentOfTheSOnBounds::LastPoint ******/
		/****** md5 signature: 8b2eedd3d014003b00e96501ee48e8db ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntPatch_ThePathPointOfTheSOnBounds

Description
-----------
Returns the last point.
") LastPoint;
		const IntPatch_ThePathPointOfTheSOnBounds & LastPoint();

		/****** IntPatch_TheSegmentOfTheSOnBounds::SetLimitPoint ******/
		/****** md5 signature: b15a875941166c1c7627758cd3f609fe ******/
		%feature("compactdefaultargs") SetLimitPoint;
		%feature("autodoc", "
Parameters
----------
V: IntPatch_ThePathPointOfTheSOnBounds
First: bool

Return
-------
None

Description
-----------
Defines the first point or the last point, depending on the value of the boolean First.
") SetLimitPoint;
		void SetLimitPoint(const IntPatch_ThePathPointOfTheSOnBounds & V, const bool First);

		/****** IntPatch_TheSegmentOfTheSOnBounds::SetValue ******/
		/****** md5 signature: 53ce9238106071febf6db57a0ff8a99c ******/
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
Defines the concerned arc.
") SetValue;
		void SetValue(const opencascade::handle<Adaptor2d_Curve2d> & A);

};


%extend IntPatch_TheSegmentOfTheSOnBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*********************************
* class IntPatch_TheSurfFunction *
*********************************/
class IntPatch_TheSurfFunction : public math_FunctionSetWithDerivatives {
	public:
		/****** IntPatch_TheSurfFunction::IntPatch_TheSurfFunction ******/
		/****** md5 signature: 70806a35bf79fc7e6c702df06ecac7e3 ******/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction();

		/****** IntPatch_TheSurfFunction::IntPatch_TheSurfFunction ******/
		/****** md5 signature: 68ea5aefe5ff7d84cafb3f65b5ce0042 ******/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "
Parameters
----------
PS: Adaptor3d_Surface
IS: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction(const opencascade::handle<Adaptor3d_Surface> & PS, const IntSurf_Quadric & IS);

		/****** IntPatch_TheSurfFunction::IntPatch_TheSurfFunction ******/
		/****** md5 signature: 42bc39952a8bf10567de705f8fa66081 ******/
		%feature("compactdefaultargs") IntPatch_TheSurfFunction;
		%feature("autodoc", "
Parameters
----------
IS: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_TheSurfFunction;
		 IntPatch_TheSurfFunction(const IntSurf_Quadric & IS);

		/****** IntPatch_TheSurfFunction::Derivatives ******/
		/****** md5 signature: 00f7bf70701f1cd8a54c33dd76de6f69 ******/
		%feature("compactdefaultargs") Derivatives;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Derivatives;
		bool Derivatives(const math_Vector & X, math_Matrix & D);

		/****** IntPatch_TheSurfFunction::Direction2d ******/
		/****** md5 signature: e46e583c3b745511fb8654831bfa19d7 ******/
		%feature("compactdefaultargs") Direction2d;
		%feature("autodoc", "Return
-------
gp_Dir2d

Description
-----------
No available documentation.
") Direction2d;
		const gp_Dir2d Direction2d();

		/****** IntPatch_TheSurfFunction::Direction3d ******/
		/****** md5 signature: ceda05eba57d20f6f3ce262f42faf157 ******/
		%feature("compactdefaultargs") Direction3d;
		%feature("autodoc", "Return
-------
gp_Vec

Description
-----------
No available documentation.
") Direction3d;
		const gp_Vec Direction3d();

		/****** IntPatch_TheSurfFunction::ISurface ******/
		/****** md5 signature: 0401f703cbd4484a6014535602bb165f ******/
		%feature("compactdefaultargs") ISurface;
		%feature("autodoc", "Return
-------
IntSurf_Quadric

Description
-----------
No available documentation.
") ISurface;
		const IntSurf_Quadric & ISurface();

		/****** IntPatch_TheSurfFunction::IsTangent ******/
		/****** md5 signature: 57430bba54a67cd70f0eb7addde8c3c7 ******/
		%feature("compactdefaultargs") IsTangent;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") IsTangent;
		bool IsTangent();

		/****** IntPatch_TheSurfFunction::NbEquations ******/
		/****** md5 signature: d96db90f938251af5669711b5ae9a95b ******/
		%feature("compactdefaultargs") NbEquations;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbEquations;
		int NbEquations();

		/****** IntPatch_TheSurfFunction::NbVariables ******/
		/****** md5 signature: ac9e90c594b52fb2529a5f6212b74800 ******/
		%feature("compactdefaultargs") NbVariables;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVariables;
		int NbVariables();

		/****** IntPatch_TheSurfFunction::PSurface ******/
		/****** md5 signature: ba545ec7900073a2f2c5530d5104284d ******/
		%feature("compactdefaultargs") PSurface;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor3d_Surface>

Description
-----------
No available documentation.
") PSurface;
		const opencascade::handle<Adaptor3d_Surface> & PSurface();

		/****** IntPatch_TheSurfFunction::Point ******/
		/****** md5 signature: 177e376cc11d1fedb2819bac56591ea8 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
No available documentation.
") Point;
		const gp_Pnt Point();

		/****** IntPatch_TheSurfFunction::Root ******/
		/****** md5 signature: 4cac472ec2e8bbc115a694c59e4b1b4e ******/
		%feature("compactdefaultargs") Root;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") Root;
		double Root();

		/****** IntPatch_TheSurfFunction::Set ******/
		/****** md5 signature: 9ddb344b11924e5532d547145d17d9e5 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
PS: Adaptor3d_Surface

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const opencascade::handle<Adaptor3d_Surface> & PS);

		/****** IntPatch_TheSurfFunction::Set ******/
		/****** md5 signature: bf508c67cd63b5bb26c659d2af54ab81 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
Tolerance: double

Return
-------
None

Description
-----------
No available documentation.
") Set;
		void Set(const double Tolerance);

		/****** IntPatch_TheSurfFunction::SetImplicitSurface ******/
		/****** md5 signature: 0ad3b55688a2be8e3aa7ec9c9bcbd283 ******/
		%feature("compactdefaultargs") SetImplicitSurface;
		%feature("autodoc", "
Parameters
----------
IS: IntSurf_Quadric

Return
-------
None

Description
-----------
No available documentation.
") SetImplicitSurface;
		void SetImplicitSurface(const IntSurf_Quadric & IS);

		/****** IntPatch_TheSurfFunction::Tolerance ******/
		/****** md5 signature: a95a606eeb289469358ac00a6b44ad86 ******/
		%feature("compactdefaultargs") Tolerance;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the value Tol so that if std::abs(Func.Root())<Tol the function is considered null.
") Tolerance;
		double Tolerance();

		/****** IntPatch_TheSurfFunction::Value ******/
		/****** md5 signature: 0c7370340ec5630e535d5a2268027fba ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector

Return
-------
bool

Description
-----------
No available documentation.
") Value;
		bool Value(const math_Vector & X, math_Vector & F);

		/****** IntPatch_TheSurfFunction::Values ******/
		/****** md5 signature: 4b9240a0e5cabe81bc6533f7aaa2df5f ******/
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "
Parameters
----------
X: math_Vector
F: math_Vector
D: math_Matrix

Return
-------
bool

Description
-----------
No available documentation.
") Values;
		bool Values(const math_Vector & X, math_Vector & F, math_Matrix & D);

};


%extend IntPatch_TheSurfFunction {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntPatch_WLineTool *
***************************/
class IntPatch_WLineTool {
	public:
		/****** IntPatch_WLineTool::ComputePurgedWLine ******/
		/****** md5 signature: 067a504e7ac00975f92ff99c161406ec ******/
		%feature("compactdefaultargs") ComputePurgedWLine;
		%feature("autodoc", "
Parameters
----------
theWLine: IntPatch_WLine
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface
theDom1: Adaptor3d_TopolTool
theDom2: Adaptor3d_TopolTool

Return
-------
opencascade::handle<IntPatch_WLine>

Description
-----------
I Removes equal points (leave one of equal points) from theWLine and recompute vertex parameters. //! II Removes point out of borders in case of non periodic surfaces. //! III Removes exceed points using tube criteria: delete 7D point if it lies near to expected lines in 2d and 3d. Each task (2d, 2d, 3d) have its own tolerance and checked separately. //! Returns new WLine or null WLine if the number of the points is less than 2.
") ComputePurgedWLine;
		static opencascade::handle<IntPatch_WLine> ComputePurgedWLine(const opencascade::handle<IntPatch_WLine> & theWLine, const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_Surface> & theS2, const opencascade::handle<Adaptor3d_TopolTool> & theDom1, const opencascade::handle<Adaptor3d_TopolTool> & theDom2);

		/****** IntPatch_WLineTool::ExtendTwoWLines ******/
		/****** md5 signature: 62694954a2ee64a74435319f0a093518 ******/
		%feature("compactdefaultargs") ExtendTwoWLines;
		%feature("autodoc", "
Parameters
----------
theSlin: IntPatch_Line
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface
theToler3D: double
theArrPeriods: double *
theBoxS1: Bnd_Box2d
theBoxS2: Bnd_Box2d
theListOfCriticalPoints: NCollection_List<gp_Pnt>

Return
-------
None

Description
-----------
Extends every line from theSlin (if it is possible) to be started/finished in strictly determined point (in the place of joint of two lines). As result, some gaps between two lines will vanish. The Walking lines are supposed (algorithm will do nothing for not-Walking line) to be computed as a result of intersection. Both theS1 and theS2 must be quadrics. Other cases are not supported. theArrPeriods must be filled as follows (every value must not be negative; if the surface is not periodic the period must be equal to 0.0 strictly): {<U-period of 1st surface>, <V-period of 1st surface>, <U-period of 2nd surface>, <V-period of 2nd surface>}. theListOfCriticalPoints must contain 3D-points where joining is disabled.
") ExtendTwoWLines;
		static void ExtendTwoWLines(NCollection_Sequence<opencascade::handle<IntPatch_Line>> & theSlin, const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_Surface> & theS2, const double theToler3D, const double * const theArrPeriods, const Bnd_Box2d & theBoxS1, const Bnd_Box2d & theBoxS2, const NCollection_List<gp_Pnt> & theListOfCriticalPoints);

		/****** IntPatch_WLineTool::JoinWLines ******/
		/****** md5 signature: c0c600fe82fa2608108cead09d37f455 ******/
		%feature("compactdefaultargs") JoinWLines;
		%feature("autodoc", "
Parameters
----------
theSlin: IntPatch_Line
theSPnt: NCollection_Sequence<IntPatch_Point>
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface
theTol3D: double

Return
-------
None

Description
-----------
Joins all WLines from theSlin to one if it is possible and records the result into theSlin again. Lines will be kept to be split if: a) they are separated (has no common points); b) resulted line (after joining) go through seam-edges or surface boundaries. //! In addition, if points in theSPnt lies at least in one of the line in theSlin, this point will be deleted.
") JoinWLines;
		static void JoinWLines(NCollection_Sequence<opencascade::handle<IntPatch_Line>> & theSlin, NCollection_Sequence<IntPatch_Point> & theSPnt, const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_Surface> & theS2, const double theTol3D);

};


%extend IntPatch_WLineTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_ALine *
***********************/
class IntPatch_ALine : public IntPatch_Line {
	public:
		/****** IntPatch_ALine::IntPatch_ALine ******/
		/****** md5 signature: 7c8493a5073840fbdda6217a82eaf16e ******/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "
Parameters
----------
C: IntAna_Curve
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates an analytic intersection line when the transitions are In or Out.
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const bool Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_ALine::IntPatch_ALine ******/
		/****** md5 signature: 415d9f423c917e27fdf8a1aadd034930 ******/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "
Parameters
----------
C: IntAna_Curve
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates an analytic intersection line when the transitions are Touch.
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const bool Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_ALine::IntPatch_ALine ******/
		/****** md5 signature: 48b35b7b3fbf801665ed87b56e13fba3 ******/
		%feature("compactdefaultargs") IntPatch_ALine;
		%feature("autodoc", "
Parameters
----------
C: IntAna_Curve
Tang: bool

Return
-------
None

Description
-----------
Creates an analytic intersection line when the transitions are Undecided.
") IntPatch_ALine;
		 IntPatch_ALine(const IntAna_Curve & C, const bool Tang);

		/****** IntPatch_ALine::AddVertex ******/
		/****** md5 signature: 4576312baa80d87344c656c8730d3075 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
To add a vertex in the list.
") AddVertex;
		void AddVertex(const IntPatch_Point & Pnt);

		/****** IntPatch_ALine::ChangeVertex ******/
		/****** md5 signature: 7dd2afa58b42c6d558643dc3b3d3b385 ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
IntPatch_Point

Description
-----------
Allows modifying the vertex with index theIndex on the line.
") ChangeVertex;
		IntPatch_Point & ChangeVertex(const int theIndex);

		/****** IntPatch_ALine::ComputeVertexParameters ******/
		/****** md5 signature: d40a83ea38985e04a786cc6a91935bcb ******/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
") ComputeVertexParameters;
		void ComputeVertexParameters(const double Tol);

		/****** IntPatch_ALine::Curve ******/
		/****** md5 signature: 70d603d1367b2d334bdbbd7b0a4fd912 ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
IntAna_Curve

Description
-----------
No available documentation.
") Curve;
		IntAna_Curve Curve();

		/****** IntPatch_ALine::D1 ******/
		/****** md5 signature: faf7518b94fb652728e0f02fb2d528fc ******/
		%feature("compactdefaultargs") D1;
		%feature("autodoc", "
Parameters
----------
U: double
P: gp_Pnt
Du: gp_Vec

Return
-------
bool

Description
-----------
Returns true when the derivative at parameter U is defined on the analytic intersection line. In that case, Du is the derivative. Returns false when it is not possible to evaluate the derivative. In both cases, P is the point at parameter U on the intersection.
") D1;
		bool D1(const double U, gp_Pnt & P, gp_Vec & Du);

		/****** IntPatch_ALine::FindParameter ******/
		/****** md5 signature: 407de38cada1fec3ab9e565b56fb7e9e ******/
		%feature("compactdefaultargs") FindParameter;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
theParams: TColStd_ListOfReal

Return
-------
None

Description
-----------
Tries to find the parameters of the point P on the curve. If the method returns False, the 'projection' is impossible. If the method returns True at least one parameter has been found. theParams is always sorted in ascending order.
") FindParameter;
		void FindParameter(const gp_Pnt & P, TColStd_ListOfReal & theParams);

		/****** IntPatch_ALine::FirstParameter ******/
		/****** md5 signature: 1c4003fb27d70ae40ab9684429360d97 ******/
		%feature("compactdefaultargs") FirstParameter;
		%feature("autodoc", "
Parameters
----------

Return
-------
IsIncluded: bool

Description
-----------
Returns the first parameter on the intersection line. If IsIncluded returns True, Value and D1 methods can be call with a parameter equal to FirstParameter. Otherwise, the parameter must be greater than FirstParameter.
") FirstParameter;
		double FirstParameter(Standard_Boolean &OutValue);

		/****** IntPatch_ALine::FirstPoint ******/
		/****** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****** IntPatch_ALine::HasFirstPoint ******/
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known First point. This point is given by the method FirstPoint().
") HasFirstPoint;
		bool HasFirstPoint();

		/****** IntPatch_ALine::HasLastPoint ******/
		/****** md5 signature: c85dac3d84a6b6ab2854e34ac0e4ffcb ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known Last point. This point is given by the method LastPoint().
") HasLastPoint;
		bool HasLastPoint();

		/****** IntPatch_ALine::LastParameter ******/
		/****** md5 signature: 17701cfdd4e696be813bef84aff40354 ******/
		%feature("compactdefaultargs") LastParameter;
		%feature("autodoc", "
Parameters
----------

Return
-------
IsIncluded: bool

Description
-----------
Returns the last parameter on the intersection line. If IsIncluded returns True, Value and D1 methods can be call with a parameter equal to LastParameter. Otherwise, the parameter must be less than LastParameter.
") LastParameter;
		double LastParameter(Standard_Boolean &OutValue);

		/****** IntPatch_ALine::LastPoint ******/
		/****** md5 signature: f1c788d8502e367e84924ee37d5745d2 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****** IntPatch_ALine::NbVertex ******/
		/****** md5 signature: ca210f2c673146a756e686a1fba666cd ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertex;
		int NbVertex();

		/****** IntPatch_ALine::Replace ******/
		/****** md5 signature: d93aae7d3c943860d8f122b7800ad6db ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
Replaces the element of range Index in the list of points.
") Replace;
		void Replace(const int Index, const IntPatch_Point & Pnt);

		/****** IntPatch_ALine::SetFirstPoint ******/
		/****** md5 signature: 0e94198440d6157c3796ba6dc67188ce ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
IndFirst: int

Return
-------
None

Description
-----------
No available documentation.
") SetFirstPoint;
		void SetFirstPoint(const int IndFirst);

		/****** IntPatch_ALine::SetLastPoint ******/
		/****** md5 signature: 4408067aa39ef1fcb60f4d638662e849 ******/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "
Parameters
----------
IndLast: int

Return
-------
None

Description
-----------
No available documentation.
") SetLastPoint;
		void SetLastPoint(const int IndLast);

		/****** IntPatch_ALine::Value ******/
		/****** md5 signature: 2544d971f0e6094fffbeed30c9e6372c ******/
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "
Parameters
----------
U: double

Return
-------
gp_Pnt

Description
-----------
Returns the point of parameter U on the analytic intersection line.
") Value;
		gp_Pnt Value(const double U);

		/****** IntPatch_ALine::Vertex ******/
		/****** md5 signature: 26780f23202c4ac23d80e88630aa27c5 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") Vertex;
		const IntPatch_Point & Vertex(const int Index);

};


%make_alias(IntPatch_ALine)

%extend IntPatch_ALine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_GLine *
***********************/
class IntPatch_GLine : public IntPatch_Line {
	public:
		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 0ba3dae96db119c2088ac4a96d06b7f2 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates a Line as intersection line when the transitions are In or Out.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const bool Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: d74d90bd472ed26f2b5815bac990640c ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates a Line as intersection line when the transitions are Touch.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const bool Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 50c571a4a713fd111bee6a68d14ebc7b ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin
Tang: bool

Return
-------
None

Description
-----------
Creates a Line as intersection line when the transitions are Undecided.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Lin & L, const bool Tang);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 9215fa7c664b5f600e740baf1be2719f ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates a circle as intersection line when the transitions are In or Out.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const bool Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 27c7c1f498c18f2f1ee8f83b59823839 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates a circle as intersection line when the transitions are Touch.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const bool Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: c8d2248f599e65feb8142f49e8489968 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
C: gp_Circ
Tang: bool

Return
-------
None

Description
-----------
Creates a circle as intersection line when the transitions are Undecided.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Circ & C, const bool Tang);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 6043da92464b736bf695ecd85aee93b4 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates an ellipse as intersection line when the transitions are In or Out.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const bool Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 0353f2aa596bb943a88a5053d8c51e74 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates an ellispe as intersection line when the transitions are Touch.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const bool Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: a9cd22ef62d23fd2e9e8fdfc0f42dd9e ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
E: gp_Elips
Tang: bool

Return
-------
None

Description
-----------
Creates an ellipse as intersection line when the transitions are Undecided.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Elips & E, const bool Tang);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 189b1c935de9ff04ab400ca771663d25 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates a parabola as intersection line when the transitions are In or Out.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const bool Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: ea9ebb62c683b6ccb45d6fc11237f3ea ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates a parabola as intersection line when the transitions are Touch.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const bool Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 8683f6e79d2662e9ca70d9b37f8cddf2 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
P: gp_Parab
Tang: bool

Return
-------
None

Description
-----------
Creates a parabola as intersection line when the transitions are Undecided.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Parab & P, const bool Tang);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 849107b6e1e3e08808125fa7d3bc8810 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates an hyperbola as intersection line when the transitions are In or Out.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const bool Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 19d6d5d5634b9f9b3d6744e110428725 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates an hyperbola as intersection line when the transitions are Touch.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const bool Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_GLine::IntPatch_GLine ******/
		/****** md5 signature: 5507110523e03bd373f9c41efb521790 ******/
		%feature("compactdefaultargs") IntPatch_GLine;
		%feature("autodoc", "
Parameters
----------
H: gp_Hypr
Tang: bool

Return
-------
None

Description
-----------
Creates an hyperbola as intersection line when the transitions are Undecided.
") IntPatch_GLine;
		 IntPatch_GLine(const gp_Hypr & H, const bool Tang);

		/****** IntPatch_GLine::AddVertex ******/
		/****** md5 signature: 4576312baa80d87344c656c8730d3075 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
To add a vertex in the list.
") AddVertex;
		void AddVertex(const IntPatch_Point & Pnt);

		/****** IntPatch_GLine::Circle ******/
		/****** md5 signature: cab8b08988d177bd7107adbbccc4ef89 ******/
		%feature("compactdefaultargs") Circle;
		%feature("autodoc", "Return
-------
gp_Circ

Description
-----------
Returns the Circ from gp corresponding to the intersection when ArcType returns IntPatch_Circle.
") Circle;
		gp_Circ Circle();

		/****** IntPatch_GLine::ComputeVertexParameters ******/
		/****** md5 signature: d40a83ea38985e04a786cc6a91935bcb ******/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
") ComputeVertexParameters;
		void ComputeVertexParameters(const double Tol);

		/****** IntPatch_GLine::Ellipse ******/
		/****** md5 signature: b6da2657e61960166cfe0f18dac79c1f ******/
		%feature("compactdefaultargs") Ellipse;
		%feature("autodoc", "Return
-------
gp_Elips

Description
-----------
Returns the Elips from gp corresponding to the intersection when ArcType returns IntPatch_Ellipse.
") Ellipse;
		gp_Elips Ellipse();

		/****** IntPatch_GLine::FirstPoint ******/
		/****** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****** IntPatch_GLine::HasFirstPoint ******/
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known First point. This point is given by the method FirstPoint().
") HasFirstPoint;
		bool HasFirstPoint();

		/****** IntPatch_GLine::HasLastPoint ******/
		/****** md5 signature: c85dac3d84a6b6ab2854e34ac0e4ffcb ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known Last point. This point is given by the method LastPoint().
") HasLastPoint;
		bool HasLastPoint();

		/****** IntPatch_GLine::Hyperbola ******/
		/****** md5 signature: 766d3e1ddfb79a4ee7d6daea9d3565cd ******/
		%feature("compactdefaultargs") Hyperbola;
		%feature("autodoc", "Return
-------
gp_Hypr

Description
-----------
Returns the Hypr from gp corresponding to the intersection when ArcType returns IntPatch_Hyperbola.
") Hyperbola;
		gp_Hypr Hyperbola();

		/****** IntPatch_GLine::LastPoint ******/
		/****** md5 signature: f1c788d8502e367e84924ee37d5745d2 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****** IntPatch_GLine::Line ******/
		/****** md5 signature: 63e1fa189ca3bcfdb401241217a93bfb ******/
		%feature("compactdefaultargs") Line;
		%feature("autodoc", "Return
-------
gp_Lin

Description
-----------
Returns the Lin from gp corresponding to the intersection when ArcType returns IntPatch_Line.
") Line;
		gp_Lin Line();

		/****** IntPatch_GLine::NbVertex ******/
		/****** md5 signature: ca210f2c673146a756e686a1fba666cd ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbVertex;
		int NbVertex();

		/****** IntPatch_GLine::Parabola ******/
		/****** md5 signature: 44bd09c360bea3d33e8c3aa19668649c ******/
		%feature("compactdefaultargs") Parabola;
		%feature("autodoc", "Return
-------
gp_Parab

Description
-----------
Returns the Parab from gp corresponding to the intersection when ArcType returns IntPatch_Parabola.
") Parabola;
		gp_Parab Parabola();

		/****** IntPatch_GLine::Replace ******/
		/****** md5 signature: d93aae7d3c943860d8f122b7800ad6db ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
To replace the element of range Index in the list of points.
") Replace;
		void Replace(const int Index, const IntPatch_Point & Pnt);

		/****** IntPatch_GLine::SetFirstPoint ******/
		/****** md5 signature: 0e94198440d6157c3796ba6dc67188ce ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
IndFirst: int

Return
-------
None

Description
-----------
No available documentation.
") SetFirstPoint;
		void SetFirstPoint(const int IndFirst);

		/****** IntPatch_GLine::SetLastPoint ******/
		/****** md5 signature: 4408067aa39ef1fcb60f4d638662e849 ******/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "
Parameters
----------
IndLast: int

Return
-------
None

Description
-----------
No available documentation.
") SetLastPoint;
		void SetLastPoint(const int IndLast);

		/****** IntPatch_GLine::Vertex ******/
		/****** md5 signature: 26780f23202c4ac23d80e88630aa27c5 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") Vertex;
		const IntPatch_Point & Vertex(const int Index);

};


%make_alias(IntPatch_GLine)

%extend IntPatch_GLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***************************
* class IntPatch_PointLine *
***************************/
%nodefaultctor IntPatch_PointLine;
class IntPatch_PointLine : public IntPatch_Line {
	public:
		/****** IntPatch_PointLine::AddVertex ******/
		/****** md5 signature: 95994479ee2201161145fa81b567dd03 ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool (optional, default to false)

Return
-------
None

Description
-----------
Adds a vertex in the list. If theIsPrepend == True the new vertex will be added before the first element of vertices sequence. Otherwise, to the end of the sequence.
") AddVertex;
		virtual void AddVertex(const IntPatch_Point & Pnt, const bool theIsPrepend = false);

		/****** IntPatch_PointLine::ChangeVertex ******/
		/****** md5 signature: 11806fd6581533a58d5da63d5976e98e ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") ChangeVertex;
		virtual IntPatch_Point & ChangeVertex(const int Index);

		/****** IntPatch_PointLine::ClearVertexes ******/
		/****** md5 signature: e553b210f8fd2c05d701b415328660d6 ******/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes vertices from the line.
") ClearVertexes;
		virtual void ClearVertexes();

		/****** IntPatch_PointLine::CurvatureRadiusOfIntersLine ******/
		/****** md5 signature: fac43a1a2abbde50156c2a217f055607 ******/
		%feature("compactdefaultargs") CurvatureRadiusOfIntersLine;
		%feature("autodoc", "
Parameters
----------
theS1: Adaptor3d_Surface
theS2: Adaptor3d_Surface
theUVPoint: IntSurf_PntOn2S

Return
-------
double

Description
-----------
Returns the radius of curvature of the intersection line in given point. Returns negative value if computation is not possible.
") CurvatureRadiusOfIntersLine;
		static double CurvatureRadiusOfIntersLine(const opencascade::handle<Adaptor3d_Surface> & theS1, const opencascade::handle<Adaptor3d_Surface> & theS2, const IntSurf_PntOn2S & theUVPoint);

		/****** IntPatch_PointLine::Curve ******/
		/****** md5 signature: fd1c616d11a26155c96378983fd082eb ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Returns set of intersection points.
") Curve;
		virtual opencascade::handle<IntSurf_LineOn2S> Curve();

		/****** IntPatch_PointLine::IsOutBox ******/
		/****** md5 signature: eea38ff6b52395151e13bb68c662eaca ******/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
bool

Description
-----------
Returns True if P is out of the box built from 3D-points.
") IsOutBox;
		virtual bool IsOutBox(const gp_Pnt & P);

		/****** IntPatch_PointLine::IsOutSurf1Box ******/
		/****** md5 signature: 10720ec353d7a002611f8e6b9338de29 ******/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if P1 is out of the box built from the points on 1st surface.
") IsOutSurf1Box;
		virtual bool IsOutSurf1Box(const gp_Pnt2d & P1);

		/****** IntPatch_PointLine::IsOutSurf2Box ******/
		/****** md5 signature: 7149e0650c6e04ee6d18cf44891893ff ******/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "
Parameters
----------
P2: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if P2 is out of the box built from the points on 2nd surface.
") IsOutSurf2Box;
		virtual bool IsOutSurf2Box(const gp_Pnt2d & P2);

		/****** IntPatch_PointLine::NbPnts ******/
		/****** md5 signature: 1e13a0afc41bd5310e07a9a013aad230 ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection points.
") NbPnts;
		virtual int NbPnts();

		/****** IntPatch_PointLine::NbVertex ******/
		/****** md5 signature: ba6d8ac301de4e7199e4e9e72c387d67 ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of vertices (IntPatch_Point) of the line.
") NbVertex;
		virtual int NbVertex();

		/****** IntPatch_PointLine::Point ******/
		/****** md5 signature: 1b21342e542238a173288d6c6b5b9741 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the intersection point of range Index.
") Point;
		virtual const IntSurf_PntOn2S & Point(const int Index);

		/****** IntPatch_PointLine::RemoveVertex ******/
		/****** md5 signature: 49762037f4a452b6c0a03f2ccd48fb63 ******/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes single vertex from the line.
") RemoveVertex;
		virtual void RemoveVertex(const int theIndex);

		/****** IntPatch_PointLine::Vertex ******/
		/****** md5 signature: 9f34ceb2b217e5bc5d2eaa75302c8c22 ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") Vertex;
		virtual const IntPatch_Point & Vertex(const int Index);

};


%make_alias(IntPatch_PointLine)

%extend IntPatch_PointLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*************************
* class IntPatch_PolyArc *
*************************/
class IntPatch_PolyArc : public IntPatch_Polygo {
	public:
		/****** IntPatch_PolyArc::IntPatch_PolyArc ******/
		/****** md5 signature: d772d7659d3d1cb97a6f63ec1afba28b ******/
		%feature("compactdefaultargs") IntPatch_PolyArc;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d
NbSample: int
Pfirst: double
Plast: double
BoxOtherPolygon: Bnd_Box2d

Return
-------
None

Description
-----------
Creates the polygon of the arc A on the surface S. The arc is limited by the parameters Pfirst and Plast. None of these parameters can be infinite.
") IntPatch_PolyArc;
		 IntPatch_PolyArc(const opencascade::handle<Adaptor2d_Curve2d> & A, const int NbSample, const double Pfirst, const double Plast, const Bnd_Box2d & BoxOtherPolygon);

		/****** IntPatch_PolyArc::Closed ******/
		/****** md5 signature: c04155dd3073fd226885281531bf073a ******/
		%feature("compactdefaultargs") Closed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") Closed;
		bool Closed();

		/****** IntPatch_PolyArc::NbPoints ******/
		/****** md5 signature: 7e6a42e81535c58e72b9d86f94dfd1c7 ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		int NbPoints();

		/****** IntPatch_PolyArc::Parameter ******/
		/****** md5 signature: bcd21197dacb6445c9784025e36f0a23 ******/
		%feature("compactdefaultargs") Parameter;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
double

Description
-----------
No available documentation.
") Parameter;
		double Parameter(const int Index);

		/****** IntPatch_PolyArc::Point ******/
		/****** md5 signature: aeadb5408cca1faa0d521b744a017680 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Point;
		gp_Pnt2d Point(const int Index);

		/****** IntPatch_PolyArc::SetOffset ******/
		/****** md5 signature: d5e04fcfad171866b32e9d05933ba48b ******/
		%feature("compactdefaultargs") SetOffset;
		%feature("autodoc", "
Parameters
----------
OffsetX: double
OffsetY: double

Return
-------
None

Description
-----------
No available documentation.
") SetOffset;
		void SetOffset(const double OffsetX, const double OffsetY);

};


%extend IntPatch_PolyArc {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/**************************
* class IntPatch_PolyLine *
**************************/
class IntPatch_PolyLine : public IntPatch_Polygo {
	public:
		/****** IntPatch_PolyLine::IntPatch_PolyLine ******/
		/****** md5 signature: 8212f213bf80b9c977f1aa379030ec1f ******/
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") IntPatch_PolyLine;
		 IntPatch_PolyLine();

		/****** IntPatch_PolyLine::IntPatch_PolyLine ******/
		/****** md5 signature: 480d450cbc42e11cd6d752cf5ecf8269 ******/
		%feature("compactdefaultargs") IntPatch_PolyLine;
		%feature("autodoc", "
Parameters
----------
InitDefle: double

Return
-------
None

Description
-----------
No available documentation.
") IntPatch_PolyLine;
		 IntPatch_PolyLine(const double InitDefle);

		/****** IntPatch_PolyLine::NbPoints ******/
		/****** md5 signature: 7e6a42e81535c58e72b9d86f94dfd1c7 ******/
		%feature("compactdefaultargs") NbPoints;
		%feature("autodoc", "Return
-------
int

Description
-----------
No available documentation.
") NbPoints;
		int NbPoints();

		/****** IntPatch_PolyLine::Point ******/
		/****** md5 signature: aeadb5408cca1faa0d521b744a017680 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
gp_Pnt2d

Description
-----------
No available documentation.
") Point;
		gp_Pnt2d Point(const int Index);

		/****** IntPatch_PolyLine::ResetError ******/
		/****** md5 signature: 4d627cbc12d8ebadf8a1332c52bcc8f0 ******/
		%feature("compactdefaultargs") ResetError;
		%feature("autodoc", "Return
-------
None

Description
-----------
No available documentation.
") ResetError;
		void ResetError();

		/****** IntPatch_PolyLine::SetRLine ******/
		/****** md5 signature: 7d38ad2373f15ea39d31253620294a13 ******/
		%feature("compactdefaultargs") SetRLine;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
Line: IntPatch_RLine

Return
-------
None

Description
-----------
No available documentation.
") SetRLine;
		void SetRLine(const bool OnFirst, const opencascade::handle<IntPatch_RLine> & Line);

		/****** IntPatch_PolyLine::SetWLine ******/
		/****** md5 signature: f4149b89f2caad2477707e04d861bdb5 ******/
		%feature("compactdefaultargs") SetWLine;
		%feature("autodoc", "
Parameters
----------
OnFirst: bool
Line: IntPatch_WLine

Return
-------
None

Description
-----------
No available documentation.
") SetWLine;
		void SetWLine(const bool OnFirst, const opencascade::handle<IntPatch_WLine> & Line);

};


%extend IntPatch_PolyLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/***********************
* class IntPatch_RLine *
***********************/
class IntPatch_RLine : public IntPatch_PointLine {
	public:
		/****** IntPatch_RLine::IntPatch_RLine ******/
		/****** md5 signature: 5f2f36998191bb19d35a852a36663ef8 ******/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "
Parameters
----------
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates a restriction as an intersection line when the transitions are In or Out.
") IntPatch_RLine;
		 IntPatch_RLine(const bool Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_RLine::IntPatch_RLine ******/
		/****** md5 signature: 9800be5c4eb6fa02ef1e2f0a147c6fb7 ******/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "
Parameters
----------
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates a restriction as an intersection line when the transitions are Touch.
") IntPatch_RLine;
		 IntPatch_RLine(const bool Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_RLine::IntPatch_RLine ******/
		/****** md5 signature: 069daf4566b26963e7fac4007f1e5f85 ******/
		%feature("compactdefaultargs") IntPatch_RLine;
		%feature("autodoc", "
Parameters
----------
Tang: bool

Return
-------
None

Description
-----------
Creates a restriction as an intersection line when the transitions are Undecided.
") IntPatch_RLine;
		 IntPatch_RLine(const bool Tang);

		/****** IntPatch_RLine::Add ******/
		/****** md5 signature: 05c40b60e3b887503ab9a2852dc97f60 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
L: IntSurf_LineOn2S

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const opencascade::handle<IntSurf_LineOn2S> & L);

		/****** IntPatch_RLine::AddVertex ******/
		/****** md5 signature: ee6fffee78acf3fbaa91b979c907b1ac ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool (optional, default to false)

Return
-------
None

Description
-----------
Adds a vertex in the list. If theIsPrepend == True the new vertex will be added before the first element of vertices sequence. Otherwise, to the end of the sequence.
") AddVertex;
		void AddVertex(const IntPatch_Point & Pnt, const bool theIsPrepend = false);

		/****** IntPatch_RLine::ArcOnS1 ******/
		/****** md5 signature: 85135db99004c68167f0f6d4c3e12e08 ******/
		%feature("compactdefaultargs") ArcOnS1;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the concerned arc.
") ArcOnS1;
		const opencascade::handle<Adaptor2d_Curve2d> & ArcOnS1();

		/****** IntPatch_RLine::ArcOnS2 ******/
		/****** md5 signature: 8bdcf3526697d60e43350266dbc562b1 ******/
		%feature("compactdefaultargs") ArcOnS2;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
Returns the concerned arc.
") ArcOnS2;
		const opencascade::handle<Adaptor2d_Curve2d> & ArcOnS2();

		/****** IntPatch_RLine::ChangeVertex ******/
		/****** md5 signature: 0a372acda9ebb235078c62b62070dd28 ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") ChangeVertex;
		IntPatch_Point & ChangeVertex(const int Index);

		/****** IntPatch_RLine::ClearVertexes ******/
		/****** md5 signature: 2e33d7984431aaf11c808bc9b5deaa01 ******/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes vertices from the line (i.e. cleans svtx member).
") ClearVertexes;
		void ClearVertexes();

		/****** IntPatch_RLine::ComputeVertexParameters ******/
		/****** md5 signature: d40a83ea38985e04a786cc6a91935bcb ******/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
") ComputeVertexParameters;
		void ComputeVertexParameters(const double Tol);

		/****** IntPatch_RLine::Curve ******/
		/****** md5 signature: 85daeba20c45cabca516c4174496617e ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Returns set of intersection points.
") Curve;
		opencascade::handle<IntSurf_LineOn2S> Curve();

		/****** IntPatch_RLine::Dump ******/
		/****** md5 signature: dfe4d625dc3ddddf57c55307bf300c5e ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
if (theMode == 0) then prints the information about WLine if (theMode == 1) then prints the list of 3d-points if (theMode == 2) then prints the list of 2d-points on the 1st surface Otherwise, prints list of 2d-points on the 2nd surface.
") Dump;
		void Dump(const int theMode);

		/****** IntPatch_RLine::FirstPoint ******/
		/****** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the FirstPoint. An exception is raised when HasFirstPoint returns False.
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****** IntPatch_RLine::HasFirstPoint ******/
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known First point. This point is given by the method FirstPoint().
") HasFirstPoint;
		bool HasFirstPoint();

		/****** IntPatch_RLine::HasLastPoint ******/
		/****** md5 signature: c85dac3d84a6b6ab2854e34ac0e4ffcb ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known Last point. This point is given by the method LastPoint().
") HasLastPoint;
		bool HasLastPoint();

		/****** IntPatch_RLine::HasPolygon ******/
		/****** md5 signature: 1ec8090b773ab8214040b0060cc03aba ******/
		%feature("compactdefaultargs") HasPolygon;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasPolygon;
		bool HasPolygon();

		/****** IntPatch_RLine::IsArcOnS1 ******/
		/****** md5 signature: 540ae8bda868c3e09a644e17a3643e96 ******/
		%feature("compactdefaultargs") IsArcOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is on the domain of the first patch. Returns False if the intersection is on the domain of the second patch.
") IsArcOnS1;
		bool IsArcOnS1();

		/****** IntPatch_RLine::IsArcOnS2 ******/
		/****** md5 signature: a4fa90d27d64b6fab8caaf2f8fa33413 ******/
		%feature("compactdefaultargs") IsArcOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the intersection is on the domain of the first patch. Returns False if the intersection is on the domain of the second patch.
") IsArcOnS2;
		bool IsArcOnS2();

		/****** IntPatch_RLine::IsOutBox ******/
		/****** md5 signature: 949fc61ecd066adeb9e008aec99ef673 ******/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from 3D-points.
") IsOutBox;
		bool IsOutBox(const gp_Pnt & theP);

		/****** IntPatch_RLine::IsOutSurf1Box ******/
		/****** md5 signature: 7c7caabacfdc3226b0fa996750e53206 ******/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from the points on 1st surface.
") IsOutSurf1Box;
		bool IsOutSurf1Box(const gp_Pnt2d & theP);

		/****** IntPatch_RLine::IsOutSurf2Box ******/
		/****** md5 signature: 63789f5d77e40a37f199f29a1bda4c13 ******/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from the points on 2nd surface.
") IsOutSurf2Box;
		bool IsOutSurf2Box(const gp_Pnt2d & theP);

		/****** IntPatch_RLine::LastPoint ******/
		/****** md5 signature: f1c788d8502e367e84924ee37d5745d2 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the IntPoint corresponding to the LastPoint. An exception is raised when HasLastPoint returns False.
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****** IntPatch_RLine::NbPnts ******/
		/****** md5 signature: a152f3f36f93fb49026b157893ce8def ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection points.
") NbPnts;
		int NbPnts();

		/****** IntPatch_RLine::NbVertex ******/
		/****** md5 signature: ebaeb456af1f95a8ffda38b9a5b83ec3 ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of vertices (IntPatch_Point) of the line.
") NbVertex;
		int NbVertex();

		/****** IntPatch_RLine::ParamOnS1 ******/
		/****** md5 signature: c714310c58557c75aefd5f6fe6a8eecd ******/
		%feature("compactdefaultargs") ParamOnS1;
		%feature("autodoc", "
Parameters
----------

Return
-------
p1: double
p2: double

Description
-----------
No available documentation.
") ParamOnS1;
		void ParamOnS1(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_RLine::ParamOnS2 ******/
		/****** md5 signature: d9038bf0962f3465c6534b61ebd5c11b ******/
		%feature("compactdefaultargs") ParamOnS2;
		%feature("autodoc", "
Parameters
----------

Return
-------
p1: double
p2: double

Description
-----------
No available documentation.
") ParamOnS2;
		void ParamOnS2(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** IntPatch_RLine::Point ******/
		/****** md5 signature: 3d2f6976d96d2bce360f4ef7869804d0 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the intersection point of range Index.
") Point;
		const IntSurf_PntOn2S & Point(const int Index);

		/****** IntPatch_RLine::RemoveVertex ******/
		/****** md5 signature: 439b0c1c29b147d686783349d735f5b4 ******/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes single vertex from the line.
") RemoveVertex;
		void RemoveVertex(const int theIndex);

		/****** IntPatch_RLine::Replace ******/
		/****** md5 signature: d93aae7d3c943860d8f122b7800ad6db ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
Replaces the element of range Index in the list of points.
") Replace;
		void Replace(const int Index, const IntPatch_Point & Pnt);

		/****** IntPatch_RLine::SetArcOnS1 ******/
		/****** md5 signature: 16396892957c40b9d06bd8ad24545a99 ******/
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") SetArcOnS1;
		void SetArcOnS1(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_RLine::SetArcOnS2 ******/
		/****** md5 signature: c6efc090e240adb6cf7df64d0f88353c ******/
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") SetArcOnS2;
		void SetArcOnS2(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_RLine::SetCurve ******/
		/****** md5 signature: bf65967bc9e019b213d3c9bd5deadd2f ******/
		%feature("compactdefaultargs") SetCurve;
		%feature("autodoc", "
Parameters
----------
theNewCurve: IntSurf_LineOn2S

Return
-------
None

Description
-----------
No available documentation.
") SetCurve;
		void SetCurve(const opencascade::handle<IntSurf_LineOn2S> & theNewCurve);

		/****** IntPatch_RLine::SetFirstPoint ******/
		/****** md5 signature: 0e94198440d6157c3796ba6dc67188ce ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
IndFirst: int

Return
-------
None

Description
-----------
No available documentation.
") SetFirstPoint;
		void SetFirstPoint(const int IndFirst);

		/****** IntPatch_RLine::SetLastPoint ******/
		/****** md5 signature: 4408067aa39ef1fcb60f4d638662e849 ******/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "
Parameters
----------
IndLast: int

Return
-------
None

Description
-----------
No available documentation.
") SetLastPoint;
		void SetLastPoint(const int IndLast);

		/****** IntPatch_RLine::SetPoint ******/
		/****** md5 signature: f9a8d26fd2582c682d948cc759cdd150 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
Set the Point of index <Index> in the LineOn2S.
") SetPoint;
		void SetPoint(const int Index, const IntPatch_Point & Pnt);

		/****** IntPatch_RLine::Vertex ******/
		/****** md5 signature: 6502a3e2a1998540a1e04f53605ba32d ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") Vertex;
		const IntPatch_Point & Vertex(const int Index);

};


%make_alias(IntPatch_RLine)

%extend IntPatch_RLine {
	%pythoncode {
	__repr__ = _dumps_object

	@methodnotwrapped
	def SetParamOnS1(self):
		pass

	@methodnotwrapped
	def SetParamOnS2(self):
		pass
	}
};

/***********************
* class IntPatch_WLine *
***********************/
class IntPatch_WLine : public IntPatch_PointLine {
	public:
/* public enums */
enum IntPatch_WLType {
	IntPatch_WLUnknown = 0,
	IntPatch_WLImpImp = 1,
	IntPatch_WLImpPrm = 2,
	IntPatch_WLPrmPrm = 3,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IntPatch_WLType(IntEnum):
	IntPatch_WLUnknown = 0
	IntPatch_WLImpImp = 1
	IntPatch_WLImpPrm = 2
	IntPatch_WLPrmPrm = 3
IntPatch_WLUnknown = IntPatch_WLType.IntPatch_WLUnknown
IntPatch_WLImpImp = IntPatch_WLType.IntPatch_WLImpImp
IntPatch_WLImpPrm = IntPatch_WLType.IntPatch_WLImpPrm
IntPatch_WLPrmPrm = IntPatch_WLType.IntPatch_WLPrmPrm
};
/* end python proxy for enums */

		/****** IntPatch_WLine::IntPatch_WLine ******/
		/****** md5 signature: 8ebbac66696ae44e38c88a10694f402e ******/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "
Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool
Trans1: IntSurf_TypeTrans
Trans2: IntSurf_TypeTrans

Return
-------
None

Description
-----------
Creates a WLine as an intersection when the transitions are In or Out.
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const bool Tang, const IntSurf_TypeTrans Trans1, const IntSurf_TypeTrans Trans2);

		/****** IntPatch_WLine::IntPatch_WLine ******/
		/****** md5 signature: 036bafcf8d07c8a7a3b7f8646f3b88d6 ******/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "
Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool
Situ1: IntSurf_Situation
Situ2: IntSurf_Situation

Return
-------
None

Description
-----------
Creates a WLine as an intersection when the transitions are Touch.
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const bool Tang, const IntSurf_Situation Situ1, const IntSurf_Situation Situ2);

		/****** IntPatch_WLine::IntPatch_WLine ******/
		/****** md5 signature: c071eff87fb595cc918dfe3d430620f9 ******/
		%feature("compactdefaultargs") IntPatch_WLine;
		%feature("autodoc", "
Parameters
----------
Line: IntSurf_LineOn2S
Tang: bool

Return
-------
None

Description
-----------
Creates a WLine as an intersection when the transitions are Undecided.
") IntPatch_WLine;
		 IntPatch_WLine(const opencascade::handle<IntSurf_LineOn2S> & Line, const bool Tang);

		/****** IntPatch_WLine::AddVertex ******/
		/****** md5 signature: ee6fffee78acf3fbaa91b979c907b1ac ******/
		%feature("compactdefaultargs") AddVertex;
		%feature("autodoc", "
Parameters
----------
Pnt: IntPatch_Point
theIsPrepend: bool (optional, default to false)

Return
-------
None

Description
-----------
Adds a vertex in the list. If theIsPrepend == True the new vertex will be added before the first element of vertices sequence. Otherwise, to the end of the sequence.
") AddVertex;
		void AddVertex(const IntPatch_Point & Pnt, const bool theIsPrepend = false);

		/****** IntPatch_WLine::ChangeVertex ******/
		/****** md5 signature: 0a372acda9ebb235078c62b62070dd28 ******/
		%feature("compactdefaultargs") ChangeVertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") ChangeVertex;
		IntPatch_Point & ChangeVertex(const int Index);

		/****** IntPatch_WLine::ClearVertexes ******/
		/****** md5 signature: 0ace2c887bad79cf38d8ceb1c2a36146 ******/
		%feature("compactdefaultargs") ClearVertexes;
		%feature("autodoc", "Return
-------
None

Description
-----------
Removes vertices from the line (i.e. cleans svtx member).
") ClearVertexes;
		void ClearVertexes();

		/****** IntPatch_WLine::ComputeVertexParameters ******/
		/****** md5 signature: d40a83ea38985e04a786cc6a91935bcb ******/
		%feature("compactdefaultargs") ComputeVertexParameters;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Set the parameters of all the vertex on the line. if a vertex is already in the line, its parameter is modified else a new point in the line is inserted.
") ComputeVertexParameters;
		void ComputeVertexParameters(const double Tol);

		/****** IntPatch_WLine::Curve ******/
		/****** md5 signature: 85daeba20c45cabca516c4174496617e ******/
		%feature("compactdefaultargs") Curve;
		%feature("autodoc", "Return
-------
opencascade::handle<IntSurf_LineOn2S>

Description
-----------
Returns set of intersection points.
") Curve;
		opencascade::handle<IntSurf_LineOn2S> Curve();

		/****** IntPatch_WLine::Dump ******/
		/****** md5 signature: dfe4d625dc3ddddf57c55307bf300c5e ******/
		%feature("compactdefaultargs") Dump;
		%feature("autodoc", "
Parameters
----------
theMode: int

Return
-------
None

Description
-----------
if (theMode == 0) then prints the information about WLine if (theMode == 1) then prints the list of 3d-points if (theMode == 2) then prints the list of 2d-points on the 1st surface Otherwise, prints list of 2d-points on the 2nd surface.
") Dump;
		void Dump(const int theMode);

		/****** IntPatch_WLine::EnablePurging ******/
		/****** md5 signature: 75e73573f3ffad2dddaeaad5e7f03f97 ******/
		%feature("compactdefaultargs") EnablePurging;
		%feature("autodoc", "
Parameters
----------
theIsEnabled: bool

Return
-------
None

Description
-----------
Allows or forbids purging of existing WLine.
") EnablePurging;
		void EnablePurging(const bool theIsEnabled);

		/****** IntPatch_WLine::FirstPoint ******/
		/****** md5 signature: a9cf472622afe53ffedbf93049e1ae87 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the Point corresponding to the FirstPoint.
") FirstPoint;
		const IntPatch_Point & FirstPoint();

		/****** IntPatch_WLine::FirstPoint ******/
		/****** md5 signature: 13d7793c0f008eff9320e752c9efdb59 ******/
		%feature("compactdefaultargs") FirstPoint;
		%feature("autodoc", "
Parameters
----------

Return
-------
Indfirst: int

Description
-----------
Returns the Point corresponding to the FirstPoint. Indfirst is the index of the first in the list of vertices.
") FirstPoint;
		const IntPatch_Point & FirstPoint(Standard_Integer &OutValue);

		/****** IntPatch_WLine::GetArcOnS1 ******/
		/****** md5 signature: 12cfec6cf09f5a397a70c92db1e276de ******/
		%feature("compactdefaultargs") GetArcOnS1;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") GetArcOnS1;
		const opencascade::handle<Adaptor2d_Curve2d> & GetArcOnS1();

		/****** IntPatch_WLine::GetArcOnS2 ******/
		/****** md5 signature: e65c0208cec5f2bddfacbd4718d88472 ******/
		%feature("compactdefaultargs") GetArcOnS2;
		%feature("autodoc", "Return
-------
opencascade::handle<Adaptor2d_Curve2d>

Description
-----------
No available documentation.
") GetArcOnS2;
		const opencascade::handle<Adaptor2d_Curve2d> & GetArcOnS2();

		/****** IntPatch_WLine::GetCreatingWay ******/
		/****** md5 signature: f32c6d1c4904acc2c040d4a118a49582 ******/
		%feature("compactdefaultargs") GetCreatingWay;
		%feature("autodoc", "Return
-------
IntPatch_WLine::IntPatch_WLType

Description
-----------
Returns the way of <*this> creation.
") GetCreatingWay;
		IntPatch_WLine::IntPatch_WLType GetCreatingWay();

		/****** IntPatch_WLine::HasArcOnS1 ******/
		/****** md5 signature: da15b2cb71ac127f4ecffa0c00178910 ******/
		%feature("compactdefaultargs") HasArcOnS1;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasArcOnS1;
		bool HasArcOnS1();

		/****** IntPatch_WLine::HasArcOnS2 ******/
		/****** md5 signature: b6691088db3622b967762bb7bf8de311 ******/
		%feature("compactdefaultargs") HasArcOnS2;
		%feature("autodoc", "Return
-------
bool

Description
-----------
No available documentation.
") HasArcOnS2;
		bool HasArcOnS2();

		/****** IntPatch_WLine::HasFirstPoint ******/
		/****** md5 signature: 1bdb89cc339a420f24f2f400d73d6b54 ******/
		%feature("compactdefaultargs") HasFirstPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known First point. This point is given by the method FirstPoint().
") HasFirstPoint;
		bool HasFirstPoint();

		/****** IntPatch_WLine::HasLastPoint ******/
		/****** md5 signature: c85dac3d84a6b6ab2854e34ac0e4ffcb ******/
		%feature("compactdefaultargs") HasLastPoint;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the line has a known Last point. This point is given by the method LastPoint().
") HasLastPoint;
		bool HasLastPoint();

		/****** IntPatch_WLine::InsertVertexBefore ******/
		/****** md5 signature: 6ce8db55d243769f23c6d507aed9ef1b ******/
		%feature("compactdefaultargs") InsertVertexBefore;
		%feature("autodoc", "
Parameters
----------
theIndex: int
thePnt: IntPatch_Point

Return
-------
None

Description
-----------
No available documentation.
") InsertVertexBefore;
		void InsertVertexBefore(const int theIndex, const IntPatch_Point & thePnt);

		/****** IntPatch_WLine::IsOutBox ******/
		/****** md5 signature: 949fc61ecd066adeb9e008aec99ef673 ******/
		%feature("compactdefaultargs") IsOutBox;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from 3D-points.
") IsOutBox;
		bool IsOutBox(const gp_Pnt & theP);

		/****** IntPatch_WLine::IsOutSurf1Box ******/
		/****** md5 signature: 7c7caabacfdc3226b0fa996750e53206 ******/
		%feature("compactdefaultargs") IsOutSurf1Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from the points on 1st surface.
") IsOutSurf1Box;
		bool IsOutSurf1Box(const gp_Pnt2d & theP);

		/****** IntPatch_WLine::IsOutSurf2Box ******/
		/****** md5 signature: 63789f5d77e40a37f199f29a1bda4c13 ******/
		%feature("compactdefaultargs") IsOutSurf2Box;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if theP is out of the box built from the points on 2nd surface.
") IsOutSurf2Box;
		bool IsOutSurf2Box(const gp_Pnt2d & theP);

		/****** IntPatch_WLine::IsPurgingAllowed ******/
		/****** md5 signature: 816345fab9c4f26d47e6020ab4d045d4 ******/
		%feature("compactdefaultargs") IsPurgingAllowed;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if purging is allowed or forbidden for existing WLine.
") IsPurgingAllowed;
		bool IsPurgingAllowed();

		/****** IntPatch_WLine::LastPoint ******/
		/****** md5 signature: f1c788d8502e367e84924ee37d5745d2 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "Return
-------
IntPatch_Point

Description
-----------
Returns the Point corresponding to the LastPoint.
") LastPoint;
		const IntPatch_Point & LastPoint();

		/****** IntPatch_WLine::LastPoint ******/
		/****** md5 signature: 34882b05b8e951bf19b4fad49669fbe8 ******/
		%feature("compactdefaultargs") LastPoint;
		%feature("autodoc", "
Parameters
----------

Return
-------
Indlast: int

Description
-----------
Returns the Point corresponding to the LastPoint. Indlast is the index of the last in the list of vertices.
") LastPoint;
		const IntPatch_Point & LastPoint(Standard_Integer &OutValue);

		/****** IntPatch_WLine::NbPnts ******/
		/****** md5 signature: a152f3f36f93fb49026b157893ce8def ******/
		%feature("compactdefaultargs") NbPnts;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the number of intersection points.
") NbPnts;
		int NbPnts();

		/****** IntPatch_WLine::NbVertex ******/
		/****** md5 signature: ebaeb456af1f95a8ffda38b9a5b83ec3 ******/
		%feature("compactdefaultargs") NbVertex;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns number of vertices (IntPatch_Point) of the line.
") NbVertex;
		int NbVertex();

		/****** IntPatch_WLine::Point ******/
		/****** md5 signature: 3d2f6976d96d2bce360f4ef7869804d0 ******/
		%feature("compactdefaultargs") Point;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntSurf_PntOn2S

Description
-----------
Returns the intersection point of range Index.
") Point;
		const IntSurf_PntOn2S & Point(const int Index);

		/****** IntPatch_WLine::RemoveVertex ******/
		/****** md5 signature: 439b0c1c29b147d686783349d735f5b4 ******/
		%feature("compactdefaultargs") RemoveVertex;
		%feature("autodoc", "
Parameters
----------
theIndex: int

Return
-------
None

Description
-----------
Removes single vertex from the line.
") RemoveVertex;
		void RemoveVertex(const int theIndex);

		/****** IntPatch_WLine::Replace ******/
		/****** md5 signature: d93aae7d3c943860d8f122b7800ad6db ******/
		%feature("compactdefaultargs") Replace;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
Replaces the element of range Index in the list of points. The exception OutOfRange is raised when Index <= 0 or Index > NbVertex.
") Replace;
		void Replace(const int Index, const IntPatch_Point & Pnt);

		/****** IntPatch_WLine::SetArcOnS1 ******/
		/****** md5 signature: 16396892957c40b9d06bd8ad24545a99 ******/
		%feature("compactdefaultargs") SetArcOnS1;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") SetArcOnS1;
		void SetArcOnS1(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_WLine::SetArcOnS2 ******/
		/****** md5 signature: c6efc090e240adb6cf7df64d0f88353c ******/
		%feature("compactdefaultargs") SetArcOnS2;
		%feature("autodoc", "
Parameters
----------
A: Adaptor2d_Curve2d

Return
-------
None

Description
-----------
No available documentation.
") SetArcOnS2;
		void SetArcOnS2(const opencascade::handle<Adaptor2d_Curve2d> & A);

		/****** IntPatch_WLine::SetCreatingWayInfo ******/
		/****** md5 signature: 9b39821f25ff089342ef26192ee163eb ******/
		%feature("compactdefaultargs") SetCreatingWayInfo;
		%feature("autodoc", "
Parameters
----------
theAlgo: IntPatch_WLType

Return
-------
None

Description
-----------
Sets the info about the way of <*this> creation.
") SetCreatingWayInfo;
		void SetCreatingWayInfo(IntPatch_WLType theAlgo);

		/****** IntPatch_WLine::SetFirstPoint ******/
		/****** md5 signature: 0e94198440d6157c3796ba6dc67188ce ******/
		%feature("compactdefaultargs") SetFirstPoint;
		%feature("autodoc", "
Parameters
----------
IndFirst: int

Return
-------
None

Description
-----------
No available documentation.
") SetFirstPoint;
		void SetFirstPoint(const int IndFirst);

		/****** IntPatch_WLine::SetLastPoint ******/
		/****** md5 signature: 4408067aa39ef1fcb60f4d638662e849 ******/
		%feature("compactdefaultargs") SetLastPoint;
		%feature("autodoc", "
Parameters
----------
IndLast: int

Return
-------
None

Description
-----------
No available documentation.
") SetLastPoint;
		void SetLastPoint(const int IndLast);

		/****** IntPatch_WLine::SetPeriod ******/
		/****** md5 signature: deeebcb1bc912698268489169e9ad752 ******/
		%feature("compactdefaultargs") SetPeriod;
		%feature("autodoc", "
Parameters
----------
pu1: double
pv1: double
pu2: double
pv2: double

Return
-------
None

Description
-----------
No available documentation.
") SetPeriod;
		void SetPeriod(const double pu1, const double pv1, const double pu2, const double pv2);

		/****** IntPatch_WLine::SetPoint ******/
		/****** md5 signature: f9a8d26fd2582c682d948cc759cdd150 ******/
		%feature("compactdefaultargs") SetPoint;
		%feature("autodoc", "
Parameters
----------
Index: int
Pnt: IntPatch_Point

Return
-------
None

Description
-----------
Set the Point of index <Index> in the LineOn2S.
") SetPoint;
		void SetPoint(const int Index, const IntPatch_Point & Pnt);

		/****** IntPatch_WLine::U1Period ******/
		/****** md5 signature: 4ff1d2f5dedbdd0517f0951013a2aa70 ******/
		%feature("compactdefaultargs") U1Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") U1Period;
		double U1Period();

		/****** IntPatch_WLine::U2Period ******/
		/****** md5 signature: 0418d5f235ec5c7298d81a80a84dd4a7 ******/
		%feature("compactdefaultargs") U2Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") U2Period;
		double U2Period();

		/****** IntPatch_WLine::V1Period ******/
		/****** md5 signature: 1d5c3b97ef57fd3e871dba52a671ee70 ******/
		%feature("compactdefaultargs") V1Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") V1Period;
		double V1Period();

		/****** IntPatch_WLine::V2Period ******/
		/****** md5 signature: 5dffe70e1d174d26315f5b1f4ad3e7f6 ******/
		%feature("compactdefaultargs") V2Period;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") V2Period;
		double V2Period();

		/****** IntPatch_WLine::Vertex ******/
		/****** md5 signature: 6502a3e2a1998540a1e04f53605ba32d ******/
		%feature("compactdefaultargs") Vertex;
		%feature("autodoc", "
Parameters
----------
Index: int

Return
-------
IntPatch_Point

Description
-----------
Returns the vertex of range Index on the line.
") Vertex;
		const IntPatch_Point & Vertex(const int Index);

};


%make_alias(IntPatch_WLine)

%extend IntPatch_WLine {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* python proxy for excluded classes */
%pythoncode {
@classnotwrapped
class IntPatch_Polyhedron:
	pass

}
/* end python proxy for excluded classes */
/* harray1 classes */
/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
IntPatch_SearchPnt=OCC.Core.Intf.Intf_InterferencePolygon2d
}
/* deprecated methods */
%pythoncode {
@deprecated
def IntPatch_HCurve2dTool_BSpline(*args):
	return IntPatch_HCurve2dTool.BSpline(*args)

@deprecated
def IntPatch_HCurve2dTool_Bezier(*args):
	return IntPatch_HCurve2dTool.Bezier(*args)

@deprecated
def IntPatch_HCurve2dTool_Circle(*args):
	return IntPatch_HCurve2dTool.Circle(*args)

@deprecated
def IntPatch_HCurve2dTool_Continuity(*args):
	return IntPatch_HCurve2dTool.Continuity(*args)

@deprecated
def IntPatch_HCurve2dTool_D0(*args):
	return IntPatch_HCurve2dTool.D0(*args)

@deprecated
def IntPatch_HCurve2dTool_D1(*args):
	return IntPatch_HCurve2dTool.D1(*args)

@deprecated
def IntPatch_HCurve2dTool_D2(*args):
	return IntPatch_HCurve2dTool.D2(*args)

@deprecated
def IntPatch_HCurve2dTool_D3(*args):
	return IntPatch_HCurve2dTool.D3(*args)

@deprecated
def IntPatch_HCurve2dTool_DN(*args):
	return IntPatch_HCurve2dTool.DN(*args)

@deprecated
def IntPatch_HCurve2dTool_Ellipse(*args):
	return IntPatch_HCurve2dTool.Ellipse(*args)

@deprecated
def IntPatch_HCurve2dTool_FirstParameter(*args):
	return IntPatch_HCurve2dTool.FirstParameter(*args)

@deprecated
def IntPatch_HCurve2dTool_GetType(*args):
	return IntPatch_HCurve2dTool.GetType(*args)

@deprecated
def IntPatch_HCurve2dTool_Hyperbola(*args):
	return IntPatch_HCurve2dTool.Hyperbola(*args)

@deprecated
def IntPatch_HCurve2dTool_Intervals(*args):
	return IntPatch_HCurve2dTool.Intervals(*args)

@deprecated
def IntPatch_HCurve2dTool_IsClosed(*args):
	return IntPatch_HCurve2dTool.IsClosed(*args)

@deprecated
def IntPatch_HCurve2dTool_IsPeriodic(*args):
	return IntPatch_HCurve2dTool.IsPeriodic(*args)

@deprecated
def IntPatch_HCurve2dTool_LastParameter(*args):
	return IntPatch_HCurve2dTool.LastParameter(*args)

@deprecated
def IntPatch_HCurve2dTool_Line(*args):
	return IntPatch_HCurve2dTool.Line(*args)

@deprecated
def IntPatch_HCurve2dTool_NbIntervals(*args):
	return IntPatch_HCurve2dTool.NbIntervals(*args)

@deprecated
def IntPatch_HCurve2dTool_NbSamples(*args):
	return IntPatch_HCurve2dTool.NbSamples(*args)

@deprecated
def IntPatch_HCurve2dTool_Parabola(*args):
	return IntPatch_HCurve2dTool.Parabola(*args)

@deprecated
def IntPatch_HCurve2dTool_Period(*args):
	return IntPatch_HCurve2dTool.Period(*args)

@deprecated
def IntPatch_HCurve2dTool_Resolution(*args):
	return IntPatch_HCurve2dTool.Resolution(*args)

@deprecated
def IntPatch_HCurve2dTool_Value(*args):
	return IntPatch_HCurve2dTool.Value(*args)

@deprecated
def IntPatch_HInterTool_Bounds(*args):
	return IntPatch_HInterTool.Bounds(*args)

@deprecated
def IntPatch_HInterTool_HasBeenSeen(*args):
	return IntPatch_HInterTool.HasBeenSeen(*args)

@deprecated
def IntPatch_HInterTool_HasFirstPoint(*args):
	return IntPatch_HInterTool.HasFirstPoint(*args)

@deprecated
def IntPatch_HInterTool_HasLastPoint(*args):
	return IntPatch_HInterTool.HasLastPoint(*args)

@deprecated
def IntPatch_HInterTool_IsAllSolution(*args):
	return IntPatch_HInterTool.IsAllSolution(*args)

@deprecated
def IntPatch_HInterTool_IsVertex(*args):
	return IntPatch_HInterTool.IsVertex(*args)

@deprecated
def IntPatch_HInterTool_NbPoints(*args):
	return IntPatch_HInterTool.NbPoints(*args)

@deprecated
def IntPatch_HInterTool_NbSamplesOnArc(*args):
	return IntPatch_HInterTool.NbSamplesOnArc(*args)

@deprecated
def IntPatch_HInterTool_NbSamplesU(*args):
	return IntPatch_HInterTool.NbSamplesU(*args)

@deprecated
def IntPatch_HInterTool_NbSamplesV(*args):
	return IntPatch_HInterTool.NbSamplesV(*args)

@deprecated
def IntPatch_HInterTool_NbSegments(*args):
	return IntPatch_HInterTool.NbSegments(*args)

@deprecated
def IntPatch_HInterTool_Parameter(*args):
	return IntPatch_HInterTool.Parameter(*args)

@deprecated
def IntPatch_HInterTool_Project(*args):
	return IntPatch_HInterTool.Project(*args)

@deprecated
def IntPatch_HInterTool_SingularOnUMax(*args):
	return IntPatch_HInterTool.SingularOnUMax(*args)

@deprecated
def IntPatch_HInterTool_SingularOnUMin(*args):
	return IntPatch_HInterTool.SingularOnUMin(*args)

@deprecated
def IntPatch_HInterTool_SingularOnVMax(*args):
	return IntPatch_HInterTool.SingularOnVMax(*args)

@deprecated
def IntPatch_HInterTool_SingularOnVMin(*args):
	return IntPatch_HInterTool.SingularOnVMin(*args)

@deprecated
def IntPatch_HInterTool_Tolerance(*args):
	return IntPatch_HInterTool.Tolerance(*args)

@deprecated
def IntPatch_HInterTool_Value(*args):
	return IntPatch_HInterTool.Value(*args)

@deprecated
def IntPatch_HInterTool_Vertex(*args):
	return IntPatch_HInterTool.Vertex(*args)

@deprecated
def IntPatch_Intersection_CheckSingularPoints(*args):
	return IntPatch_Intersection.CheckSingularPoints(*args)

@deprecated
def IntPatch_Intersection_DefineUVMaxStep(*args):
	return IntPatch_Intersection.DefineUVMaxStep(*args)

@deprecated
def IntPatch_Intersection_PrepareSurfaces(*args):
	return IntPatch_Intersection.PrepareSurfaces(*args)

@deprecated
def IntPatch_PolyhedronTool_Bounding(*args):
	return IntPatch_PolyhedronTool.Bounding(*args)

@deprecated
def IntPatch_PolyhedronTool_ComponentsBounding(*args):
	return IntPatch_PolyhedronTool.ComponentsBounding(*args)

@deprecated
def IntPatch_PolyhedronTool_DeflectionOverEstimation(*args):
	return IntPatch_PolyhedronTool.DeflectionOverEstimation(*args)

@deprecated
def IntPatch_PolyhedronTool_NbTriangles(*args):
	return IntPatch_PolyhedronTool.NbTriangles(*args)

@deprecated
def IntPatch_PolyhedronTool_Point(*args):
	return IntPatch_PolyhedronTool.Point(*args)

@deprecated
def IntPatch_PolyhedronTool_TriConnex(*args):
	return IntPatch_PolyhedronTool.TriConnex(*args)

@deprecated
def IntPatch_PolyhedronTool_Triangle(*args):
	return IntPatch_PolyhedronTool.Triangle(*args)

@deprecated
def IntPatch_RstInt_PutVertexOnLine(*args):
	return IntPatch_RstInt.PutVertexOnLine(*args)

@deprecated
def IntPatch_SpecialPoints_AddCrossUVIsoPoint(*args):
	return IntPatch_SpecialPoints.AddCrossUVIsoPoint(*args)

@deprecated
def IntPatch_SpecialPoints_AddPointOnUorVIso(*args):
	return IntPatch_SpecialPoints.AddPointOnUorVIso(*args)

@deprecated
def IntPatch_SpecialPoints_AddSingularPole(*args):
	return IntPatch_SpecialPoints.AddSingularPole(*args)

@deprecated
def IntPatch_SpecialPoints_AdjustPointAndVertex(*args):
	return IntPatch_SpecialPoints.AdjustPointAndVertex(*args)

@deprecated
def IntPatch_SpecialPoints_ContinueAfterSpecialPoint(*args):
	return IntPatch_SpecialPoints.ContinueAfterSpecialPoint(*args)

@deprecated
def IntPatch_WLineTool_ComputePurgedWLine(*args):
	return IntPatch_WLineTool.ComputePurgedWLine(*args)

@deprecated
def IntPatch_WLineTool_ExtendTwoWLines(*args):
	return IntPatch_WLineTool.ExtendTwoWLines(*args)

@deprecated
def IntPatch_WLineTool_JoinWLines(*args):
	return IntPatch_WLineTool.JoinWLines(*args)

@deprecated
def IntPatch_PointLine_CurvatureRadiusOfIntersLine(*args):
	return IntPatch_PointLine.CurvatureRadiusOfIntersLine(*args)

}
