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
%define BNDDOCSTRING
"Bnd module, see official documentation at
https://dev.opencascade.org/doc/occt-7.9.0/refman/html/package_bnd.html"
%enddef
%module (package="OCC.Core", docstring=BNDDOCSTRING) Bnd


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
#include<Bnd_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TColStd_module.hxx>
#include<gp_module.hxx>
#include<TColgp_module.hxx>
#include<BVH_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TColStd.i
%import gp.i
%import TColgp.i
%import BVH.i

%pythoncode {
from enum import IntEnum
from OCC.Core.Exception import *
};

/* public enums */
/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {
};
/* end python proxy for enums */

/* handles */
/* end handles declaration */

/* templates */
%template(Bnd_Array1OfBox) NCollection_Array1<Bnd_Box>;
Array1ExtendIter(Bnd_Box)

%template(Bnd_Array1OfBox2d) NCollection_Array1<Bnd_Box2d>;
Array1ExtendIter(Bnd_Box2d)

%template(Bnd_Array1OfSphere) NCollection_Array1<Bnd_Sphere>;
Array1ExtendIter(Bnd_Sphere)

/* end templates declaration */

/* typedefs */
typedef NCollection_Array1<Bnd_Box> Bnd_Array1OfBox;
typedef NCollection_Array1<Bnd_Box2d> Bnd_Array1OfBox2d;
typedef NCollection_Array1<Bnd_Sphere> Bnd_Array1OfSphere;
typedef NCollection_HArray1<Bnd_Box> Bnd_HArray1OfBox;
typedef NCollection_HArray1<Bnd_Box2d> Bnd_HArray1OfBox2d;
typedef NCollection_HArray1<Bnd_Sphere> Bnd_HArray1OfSphere;
/* end typedefs declaration */

/***************
* class Bnd_B2 *
***************/
/***************
* class Bnd_B3 *
***************/
/*************************
* class Bnd_BoundSortBox *
*************************/
class Bnd_BoundSortBox {
	public:
		/****** Bnd_BoundSortBox::Bnd_BoundSortBox ******/
		/****** md5 signature: 432937775309e427743273a6bdbe335c ******/
		%feature("compactdefaultargs") Bnd_BoundSortBox;
		%feature("autodoc", "Return
-------
None

Description
-----------
Constructs an empty comparison algorithm for bounding boxes. The bounding boxes are then defined using the Initialize function.
") Bnd_BoundSortBox;
		 Bnd_BoundSortBox();

		/****** Bnd_BoundSortBox::Add ******/
		/****** md5 signature: abd6c54b58988950f9ed344eacecfdc3 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box
theIndex: int

Return
-------
None

Description
-----------
Adds the bounding box theBox at position boxIndex in the internal array of boxes to be sorted by this comparison algorithm. This function is used only in conjunction with the Initialize(const Bnd_Box&, const int) method. Exceptions: - Standard_OutOfRange if boxIndex is not in the range [ 1,nbComponents ] where nbComponents is the maximum number of bounding boxes declared for this algorithm at initialization. - Standard_MultiplyDefined if a box already exists at position @p theIndex in the internal array of boxes. 
Parameter theBox The bounding box to be added. 
Parameter theIndex The index of the bounding box in the internal array where the box will be added. The index is 1-based.
") Add;
		void Add(const Bnd_Box & theBox, const int theIndex);

		/****** Bnd_BoundSortBox::Compare ******/
		/****** md5 signature: f58ca215fce34659c68be73c76ddd79a ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
TColStd_ListOfInteger

Description
-----------
Compares the bounding box theBox, with the set of bounding boxes provided to this algorithm at initialization, and returns the list of indices of bounding boxes that intersect the @p theBox or are inside it. The indices correspond to the indices of the bounding boxes in the array provided to this algorithm at initialization. 
Parameter theBox The bounding box to be compared. 
Return: The list of indices of bounding boxes that intersect the bounding box theBox or are inside it.
") Compare;
		const TColStd_ListOfInteger & Compare(const Bnd_Box & theBox);

		/****** Bnd_BoundSortBox::Compare ******/
		/****** md5 signature: 214533d338091dd6a4f5f4693ffc0975 ******/
		%feature("compactdefaultargs") Compare;
		%feature("autodoc", "
Parameters
----------
thePlane: gp_Pln

Return
-------
TColStd_ListOfInteger

Description
-----------
Compares the plane @p thePlane with the set of bounding boxes provided to this algorithm at initialization, and returns the list of indices of bounding boxes that intersect the @p thePlane. The indices correspond to the indices of the bounding boxes in the array provided to this algorithm at initialization. 
Parameter thePlane The plane to be compared. 
Return: The list of indices of bounding boxes that intersect the plane thePlane.
") Compare;
		const TColStd_ListOfInteger & Compare(const gp_Pln & thePlane);

		/****** Bnd_BoundSortBox::Initialize ******/
		/****** md5 signature: 86ef064eae0e1ef0a06746103ef6e690 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theSetOfBoxes: NCollection_HArray1<Bnd_Box

Return
-------
None

Description
-----------
Initializes this comparison algorithm with the set of boxes. 
Parameter theSetOfBoxes The set of bounding boxes to be used by this algorithm.
") Initialize;
		void Initialize(const opencascade::handle<NCollection_HArray1<Bnd_Box>> & theSetOfBoxes);

		/****** Bnd_BoundSortBox::Initialize ******/
		/****** md5 signature: 24dc1f1a6c0d6cd1be61d5a62c4f5407 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theEnclosingBox: Bnd_Box
theSetOfBoxes: NCollection_HArray1<Bnd_Box

Return
-------
None

Description
-----------
Initializes this comparison algorithm with the set of boxes and the bounding box that encloses all those boxes. This version of initialization can be used if complete box is known in advance to avoid calculating it again inside the algorithm. 
Parameter theEnclosingBox The bounding box that contains all the boxes in @p theSetOfBoxes. 
Parameter theSetOfBoxes The set of bounding boxes to be used by this algorithm.
") Initialize;
		void Initialize(const Bnd_Box & theEnclosingBox, const opencascade::handle<NCollection_HArray1<Bnd_Box>> & theSetOfBoxes);

		/****** Bnd_BoundSortBox::Initialize ******/
		/****** md5 signature: 5437f93deb6b3f3215aa43310d58ea10 ******/
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "
Parameters
----------
theEnclosingBox: Bnd_Box
theNbBoxes: int

Return
-------
None

Description
-----------
Initializes this comparison algorithm with the bounding box that encloses all the boxes that will be used by this algorithm. and the expected number of those boxes. Boxes to be considered can then be added using the Add() method. 
Parameter theEnclosingBox The bounding box that contains all the boxes to be sorted. 
Parameter theNbComponents The number of components to be added.
") Initialize;
		void Initialize(const Bnd_Box & theEnclosingBox, const int theNbBoxes);

};


%extend Bnd_BoundSortBox {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class Bnd_Box *
****************/
class Bnd_Box {
	public:
		class Limits {};
		/****** Bnd_Box::Bnd_Box ******/
		/****** md5 signature: 0107e876b8c0dbba6b6cb32626834413 ******/
		%feature("compactdefaultargs") Bnd_Box;
		%feature("autodoc", "Return
-------
None

Description
-----------
Creates an empty Box. The constructed box is qualified Void. Its gap is null.
") Bnd_Box;
		 Bnd_Box();

		/****** Bnd_Box::Bnd_Box ******/
		/****** md5 signature: 52d5adf515a58ad40b43fd036359bed5 ******/
		%feature("compactdefaultargs") Bnd_Box;
		%feature("autodoc", "
Parameters
----------
theMin: gp_Pnt
theMax: gp_Pnt

Return
-------
None

Description
-----------
Creates a bounding box, it contains: - minimum/maximum point of bounding box, The constructed box is qualified Void. Its gap is null.
") Bnd_Box;
		 Bnd_Box(const gp_Pnt & theMin, const gp_Pnt & theMax);

		/****** Bnd_Box::Add ******/
		/****** md5 signature: f26c3b18c425c9af5e181dcf97365f7d ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box

Return
-------
None

Description
-----------
Adds the box <Other> to <self>.
") Add;
		void Add(const Bnd_Box & Other);

		/****** Bnd_Box::Add ******/
		/****** md5 signature: b714bfb888eecda75b87221b873365bd ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Adds a Pnt to the box.
") Add;
		void Add(const gp_Pnt & P);

		/****** Bnd_Box::Add ******/
		/****** md5 signature: 7e55d9c284ce09cd4dd63f85011cde45 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
D: gp_Dir

Return
-------
None

Description
-----------
Extends <self> from the Pnt <P> in the direction <D>.
") Add;
		void Add(const gp_Pnt & P, const gp_Dir & D);

		/****** Bnd_Box::Add ******/
		/****** md5 signature: f5e67a29cde6a6d52768287ab5d77897 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir

Return
-------
None

Description
-----------
Extends the Box in the given Direction, i.e. adds an half-line. The box may become infinite in 1,2 or 3 directions.
") Add;
		void Add(const gp_Dir & D);

		/****** Bnd_Box::Center ******/
		/****** md5 signature: e216ccbbdea606873018732da221ee2b ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
std::optional<gp_Pnt >

Description
-----------
Returns the center of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Returns std::nullopt if the box is void.
") Center;
		std::optional<gp_Pnt > Center();

		/****** Bnd_Box::Contains ******/
		/****** md5 signature: a15648a04bd93d12caabaa31b58298b4 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Returns True if the point is inside or on the boundary of this box.
") Contains;
		bool Contains(const gp_Pnt & theP);

		/****** Bnd_Box::CornerMax ******/
		/****** md5 signature: ba66cc3b9f07809e242d6acf3b7b399a ******/
		%feature("compactdefaultargs") CornerMax;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the upper corner of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Standard_ConstructionError exception will be thrown if the box is void. if IsVoid().
") CornerMax;
		gp_Pnt CornerMax();

		/****** Bnd_Box::CornerMin ******/
		/****** md5 signature: 986487b80ef67f31dfd8ba819cb4b46e ******/
		%feature("compactdefaultargs") CornerMin;
		%feature("autodoc", "Return
-------
gp_Pnt

Description
-----------
Returns the lower corner of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Standard_ConstructionError exception will be thrown if the box is void. if IsVoid().
") CornerMin;
		gp_Pnt CornerMin();

		/****** Bnd_Box::Distance ******/
		/****** md5 signature: ba292b65295ca4974bfdaef1a2f7fec9 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box

Return
-------
double

Description
-----------
Computes the minimum distance between two boxes.
") Distance;
		double Distance(const Bnd_Box & Other);

		/****** Bnd_Box::Dump ******/
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


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Bnd_Box::Enlarge ******/
		/****** md5 signature: 5a2b1d3f88c57bd89625daba8d998664 ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Enlarges the box with a tolerance value. (minvalues-std::abs(<tol>) and maxvalues+std::abs(<tol>)) This means that the minimum values of its X, Y and Z intervals of definition, when they are finite, are reduced by the absolute value of Tol, while the maximum values are increased by the same amount.
") Enlarge;
		void Enlarge(const double Tol);

		/****** Bnd_Box::FinitePart ******/
		/****** md5 signature: 39c254e56331b8464e81ab7259725e4c ******/
		%feature("compactdefaultargs") FinitePart;
		%feature("autodoc", "Return
-------
Bnd_Box

Description
-----------
Returns a finite part of an infinite bounding box (returns self if this is already finite box). This can be a Void box in case if its sides has been defined as infinite (Open) without adding any finite points. WARNING! This method relies on Open flags, the infinite points added using Add() method will be returned as is.
") FinitePart;
		Bnd_Box FinitePart();

		/****** Bnd_Box::Get ******/
		/****** md5 signature: 5e1b8d42297b4a79546122a890e9946e ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------

Return
-------
theXmin: double
theYmin: double
theZmin: double
theXmax: double
theYmax: double
theZmax: double

Description
-----------
Returns the bounds of this bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Standard_ConstructionError exception will be thrown if the box is void. if IsVoid().
") Get;
		void Get(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bnd_Box::Get ******/
		/****** md5 signature: 870c0291227918a8611c6f42df5107df ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
Bnd_Box::Limits

Description
-----------
Returns the bounds of this bounding box as a Limits structure. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). If the box is void, returns raw internal values. Can be used with C++17 structured bindings: @code auto [xmin, xmax, ymin, ymax, zmin, zmax] = aBox.Get(); @endcode.
") Get;
		Bnd_Box::Limits Get();

		/****** Bnd_Box::GetGap ******/
		/****** md5 signature: 3170c07d29b894bad8aff9a1de58aafb ******/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the gap of this bounding box.
") GetGap;
		double GetGap();

		/****** Bnd_Box::GetXMax ******/
		/****** md5 signature: a505be33172b921c136fa12f41ab16ac ******/
		%feature("compactdefaultargs") GetXMax;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Xmax value (IsOpenXmax() ? Precision::Infinite(): Xmax + GetGap()).
") GetXMax;
		double GetXMax();

		/****** Bnd_Box::GetXMin ******/
		/****** md5 signature: a4fe5af18cf67e4f1efa35fd8bd69899 ******/
		%feature("compactdefaultargs") GetXMin;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Xmin value (IsOpenXmin() ? -Precision::Infinite(): Xmin - GetGap()).
") GetXMin;
		double GetXMin();

		/****** Bnd_Box::GetYMax ******/
		/****** md5 signature: 5d9e1630a9216c2ee8b512099e75f5d9 ******/
		%feature("compactdefaultargs") GetYMax;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Ymax value (IsOpenYmax() ? Precision::Infinite(): Ymax + GetGap()).
") GetYMax;
		double GetYMax();

		/****** Bnd_Box::GetYMin ******/
		/****** md5 signature: 49c6c929c12167b9c98f5d34765a9648 ******/
		%feature("compactdefaultargs") GetYMin;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Ymin value (IsOpenYmin() ? -Precision::Infinite(): Ymin - GetGap()).
") GetYMin;
		double GetYMin();

		/****** Bnd_Box::GetZMax ******/
		/****** md5 signature: 4afcace634b49aa1ab8344b242b9a342 ******/
		%feature("compactdefaultargs") GetZMax;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Zmax value (IsOpenZmax() ? Precision::Infinite(): Zmax + GetGap()).
") GetZMax;
		double GetZMax();

		/****** Bnd_Box::GetZMin ******/
		/****** md5 signature: 9aba774e0cf2c5807f7976ddd78b996c ******/
		%feature("compactdefaultargs") GetZMin;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Zmin value (IsOpenZmin() ? -Precision::Infinite(): Zmin - GetGap()).
") GetZMin;
		double GetZMin();

		/****** Bnd_Box::HasFinitePart ******/
		/****** md5 signature: 431965c2c3b95581d4ab0dc35008ec24 ******/
		%feature("compactdefaultargs") HasFinitePart;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if this box has finite part.
") HasFinitePart;
		bool HasFinitePart();


        /****************** InitFromJson ******************/
        %feature("autodoc", "
Parameters
----------
json_string: the string

Return
-------
bool

Description
-----------
Init the object from a JSON string.
") InitFromJson;
        %extend{
            bool InitFromJson(std::string json_string) {
            std::stringstream s(json_string);
            Standard_Integer pos=2;
            return self->InitFromJson(s, pos);}
        };
		/****** Bnd_Box::Intersects ******/
		/****** md5 signature: 3db2e9fd58e3fd2c7198bb3f33c97e83 ******/
		%feature("compactdefaultargs") Intersects;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Box

Return
-------
bool

Description
-----------
Returns True if the other box intersects or is inside this box.
") Intersects;
		bool Intersects(const Bnd_Box & theOther);

		/****** Bnd_Box::IsOpen ******/
		/****** md5 signature: 405356c49964725cc0377c37c438c6e7 ******/
		%feature("compactdefaultargs") IsOpen;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box has at least one open direction.
") IsOpen;
		bool IsOpen();

		/****** Bnd_Box::IsOpenXmax ******/
		/****** md5 signature: 984634054031c88c3072a4bce5297874 ******/
		%feature("compactdefaultargs") IsOpenXmax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Xmax direction.
") IsOpenXmax;
		bool IsOpenXmax();

		/****** Bnd_Box::IsOpenXmin ******/
		/****** md5 signature: 3ecd88ae6a6a5ef453bde4166abf5cb7 ******/
		%feature("compactdefaultargs") IsOpenXmin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Xmin direction.
") IsOpenXmin;
		bool IsOpenXmin();

		/****** Bnd_Box::IsOpenYmax ******/
		/****** md5 signature: 48a2659a24a0e266c30359689b02bf3b ******/
		%feature("compactdefaultargs") IsOpenYmax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Ymax direction.
") IsOpenYmax;
		bool IsOpenYmax();

		/****** Bnd_Box::IsOpenYmin ******/
		/****** md5 signature: 672a78c903111bffa5f36a8668b4dc00 ******/
		%feature("compactdefaultargs") IsOpenYmin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Ymin direction.
") IsOpenYmin;
		bool IsOpenYmin();

		/****** Bnd_Box::IsOpenZmax ******/
		/****** md5 signature: 0bc30cd64d61a1076c6b8105a3de6947 ******/
		%feature("compactdefaultargs") IsOpenZmax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Zmax direction.
") IsOpenZmax;
		bool IsOpenZmax();

		/****** Bnd_Box::IsOpenZmin ******/
		/****** md5 signature: ac775f20f2a640401c77113a57e5c231 ******/
		%feature("compactdefaultargs") IsOpenZmin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Zmin direction.
") IsOpenZmin;
		bool IsOpenZmin();

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: 19cec80ad9b050cb2f6ecfa22b6e6ccb ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
bool

Description
-----------
Returns True if the Pnt is out the box.
") IsOut;
		bool IsOut(const gp_Pnt & P);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: 69cce2403836b8edb2ddfef1a5a66e7f ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
L: gp_Lin

Return
-------
bool

Description
-----------
Returns False if the line intersects the box.
") IsOut;
		bool IsOut(const gp_Lin & L);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: b6c3999fc0d813008d29f882eae4997d ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
P: gp_Pln

Return
-------
bool

Description
-----------
Returns False if the plane intersects the box.
") IsOut;
		bool IsOut(const gp_Pln & P);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: bab295626142ef2f3c04bae8f895002e ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box

Return
-------
bool

Description
-----------
Returns False if the <Box> intersects or is inside <self>.
") IsOut;
		bool IsOut(const Bnd_Box & Other);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: a31cf0c7d05d156bcee71d6132af6b86 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box
T: gp_Trsf

Return
-------
bool

Description
-----------
Returns False if the transformed <Box> intersects or is inside <self>.
") IsOut;
		bool IsOut(const Bnd_Box & Other, const gp_Trsf & T);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: 71f75f7e4ae215899216c7cdc8e9d8af ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
T1: gp_Trsf
Other: Bnd_Box
T2: gp_Trsf

Return
-------
bool

Description
-----------
Returns False if the transformed <Box> intersects or is inside the transformed box <self>.
") IsOut;
		bool IsOut(const gp_Trsf & T1, const Bnd_Box & Other, const gp_Trsf & T2);

		/****** Bnd_Box::IsOut ******/
		/****** md5 signature: a3300236343f65a0a85f984218638d55 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
P1: gp_Pnt
P2: gp_Pnt
D: gp_Dir

Return
-------
bool

Description
-----------
Returns False if the flat band lying between two parallel lines represented by their reference points <P1>, <P2> and direction <D> intersects the box.
") IsOut;
		bool IsOut(const gp_Pnt & P1, const gp_Pnt & P2, const gp_Dir & D);

		/****** Bnd_Box::IsThin ******/
		/****** md5 signature: 8096d0243817889b6400c5760ec2a089 ******/
		%feature("compactdefaultargs") IsThin;
		%feature("autodoc", "
Parameters
----------
tol: double

Return
-------
bool

Description
-----------
Returns true if IsXThin, IsYThin and IsZThin are all true, i.e. if the box is thin in all three dimensions.
") IsThin;
		bool IsThin(const double tol);

		/****** Bnd_Box::IsVoid ******/
		/****** md5 signature: d1e990d2cffeff4ddaa3dff6aed4ec5e ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is empty (Void flag).
") IsVoid;
		bool IsVoid();

		/****** Bnd_Box::IsWhole ******/
		/****** md5 signature: 44e5165de884a8ed14c61d2cad39234f ******/
		%feature("compactdefaultargs") IsWhole;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is infinite in all 6 directions (WholeSpace flag).
") IsWhole;
		bool IsWhole();

		/****** Bnd_Box::IsXThin ******/
		/****** md5 signature: 97d62e6c3fc90eb9c597d3b143c2ce62 ******/
		%feature("compactdefaultargs") IsXThin;
		%feature("autodoc", "
Parameters
----------
tol: double

Return
-------
bool

Description
-----------
true if xmax-xmin < tol.
") IsXThin;
		bool IsXThin(const double tol);

		/****** Bnd_Box::IsYThin ******/
		/****** md5 signature: 6dff638a0dd76e9fe2458a0b5293fb38 ******/
		%feature("compactdefaultargs") IsYThin;
		%feature("autodoc", "
Parameters
----------
tol: double

Return
-------
bool

Description
-----------
true if ymax-ymin < tol.
") IsYThin;
		bool IsYThin(const double tol);

		/****** Bnd_Box::IsZThin ******/
		/****** md5 signature: b953befe232c4e86af5e41fca28a2394 ******/
		%feature("compactdefaultargs") IsZThin;
		%feature("autodoc", "
Parameters
----------
tol: double

Return
-------
bool

Description
-----------
true if zmax-zmin < tol.
") IsZThin;
		bool IsZThin(const double tol);

		/****** Bnd_Box::OpenXmax ******/
		/****** md5 signature: 9c062e7606d56cd6bfce55a74805f1cc ******/
		%feature("compactdefaultargs") OpenXmax;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Xmax direction.
") OpenXmax;
		void OpenXmax();

		/****** Bnd_Box::OpenXmin ******/
		/****** md5 signature: 2a1cfdb03c109f3be9df7661e921ce44 ******/
		%feature("compactdefaultargs") OpenXmin;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Xmin direction.
") OpenXmin;
		void OpenXmin();

		/****** Bnd_Box::OpenYmax ******/
		/****** md5 signature: b12093f88b870ad6dd254acd4c961e89 ******/
		%feature("compactdefaultargs") OpenYmax;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Ymax direction.
") OpenYmax;
		void OpenYmax();

		/****** Bnd_Box::OpenYmin ******/
		/****** md5 signature: 01213cd11278efaa450bc8117f13da8f ******/
		%feature("compactdefaultargs") OpenYmin;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Ymin direction.
") OpenYmin;
		void OpenYmin();

		/****** Bnd_Box::OpenZmax ******/
		/****** md5 signature: 85973028b2eef3b55d114f62578867a6 ******/
		%feature("compactdefaultargs") OpenZmax;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Zmax direction.
") OpenZmax;
		void OpenZmax();

		/****** Bnd_Box::OpenZmin ******/
		/****** md5 signature: d2a0be8ba49fc9f657ac946ed0a6afc6 ******/
		%feature("compactdefaultargs") OpenZmin;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Zmin direction.
") OpenZmin;
		void OpenZmin();

		/****** Bnd_Box::Set ******/
		/****** md5 signature: db883cf63ff497749765a1588d5f0509 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt

Return
-------
None

Description
-----------
Sets this bounding box so that it bounds - the point P. This involves first setting this bounding box to be void and then adding the point P.
") Set;
		void Set(const gp_Pnt & P);

		/****** Bnd_Box::Set ******/
		/****** md5 signature: 945d824f108c7dfcd3451b159d172d3a ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt
D: gp_Dir

Return
-------
None

Description
-----------
Sets this bounding box so that it bounds the half-line defined by point P and direction D, i.e. all points M defined by M=P+u*D, where u is greater than or equal to 0, are inside the bounding volume. This involves first setting this box to be void and then adding the half-line.
") Set;
		void Set(const gp_Pnt & P, const gp_Dir & D);

		/****** Bnd_Box::SetGap ******/
		/****** md5 signature: 3a22b15c6a65643cf9917899ea56719b ******/
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Set the gap of this bounding box to abs(Tol).
") SetGap;
		void SetGap(const double Tol);

		/****** Bnd_Box::SetVoid ******/
		/****** md5 signature: ba0d9efd7de5be322d525cd09fd4850e ******/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets this bounding box so that it is empty. All points are outside a void box.
") SetVoid;
		void SetVoid();

		/****** Bnd_Box::SetWhole ******/
		/****** md5 signature: 6d3ae3d96c06be082ca4ab7dccad18aa ******/
		%feature("compactdefaultargs") SetWhole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets this bounding box so that it covers the whole of 3D space. It is infinitely long in all directions.
") SetWhole;
		void SetWhole();

		/****** Bnd_Box::SquareExtent ******/
		/****** md5 signature: 2670917100beea6c92bfc8e284a16c89 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the squared diagonal of me.
") SquareExtent;
		double SquareExtent();

		/****** Bnd_Box::Transformed ******/
		/****** md5 signature: f8f0492ba8a9ca40222a08025b8b8169 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf

Return
-------
Bnd_Box

Description
-----------
Returns a bounding box which is the result of applying the transformation T to this bounding box. Warning Applying a geometric transformation (for example, a rotation) to a bounding box generally increases its dimensions. This is not optimal for algorithms which use it.
") Transformed;
		Bnd_Box Transformed(const gp_Trsf & T);

		/****** Bnd_Box::Update ******/
		/****** md5 signature: 8b0f5b5da4eba2c7aa04e81c35dff07f ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aXmin: double
aYmin: double
aZmin: double
aXmax: double
aYmax: double
aZmax: double

Return
-------
None

Description
-----------
Enlarges this bounding box, if required, so that it contains at least: - interval [ aXmin,aXmax ] in the 'X Direction', - interval [ aYmin,aYmax ] in the 'Y Direction', - interval [ aZmin,aZmax ] in the 'Z Direction';.
") Update;
		void Update(const double aXmin, const double aYmin, const double aZmin, const double aXmax, const double aYmax, const double aZmax);

		/****** Bnd_Box::Update ******/
		/****** md5 signature: bb55713848d8ab53d0fdfc5d7ca6647c ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double
Z: double

Return
-------
None

Description
-----------
Adds a point of coordinates (X,Y,Z) to this bounding box.
") Update;
		void Update(const double X, const double Y, const double Z);

};



%extend Bnd_Box {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_Box {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_Box()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_Box')
    }
};
%extend Bnd_Box {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Bnd_Box2d *
******************/
class Bnd_Box2d {
	public:
		class Limits {};
		/****** Bnd_Box2d::Add ******/
		/****** md5 signature: 6f044365f28f5f8cfea2a8ef87b5d3d8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box2d

Return
-------
None

Description
-----------
Adds the 2d box <Other> to <self>.
") Add;
		void Add(const Bnd_Box2d & Other);

		/****** Bnd_Box2d::Add ******/
		/****** md5 signature: df3a4658199adf4aaaea4103ebf863e8 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d

Return
-------
None

Description
-----------
Adds the 2d point.
") Add;
		void Add(const gp_Pnt2d & thePnt);

		/****** Bnd_Box2d::Add ******/
		/****** md5 signature: b9501ccf4cd221c76e5930c72aa9480f ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d
theDir: gp_Dir2d

Return
-------
None

Description
-----------
Extends bounding box from thePnt in the direction theDir.
") Add;
		void Add(const gp_Pnt2d & thePnt, const gp_Dir2d & theDir);

		/****** Bnd_Box2d::Add ******/
		/****** md5 signature: 17bccdca6c22026d7b33e0b35baadcc7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
D: gp_Dir2d

Return
-------
None

Description
-----------
Extends the Box in the given Direction, i.e. adds a half-line. The box may become infinite in 1 or 2 directions.
") Add;
		void Add(const gp_Dir2d & D);

		/****** Bnd_Box2d::Center ******/
		/****** md5 signature: bbb96fd23dc4d409ec24d96e0cd7858a ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
std::optional<gp_Pnt2d >

Description
-----------
Returns the center of this 2D bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). Returns std::nullopt if the box is void.
") Center;
		std::optional<gp_Pnt2d > Center();

		/****** Bnd_Box2d::Contains ******/
		/****** md5 signature: d03d2aa8c6765d3d917aaceb1f95d9ec ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if the 2d point is inside or on the boundary of this box.
") Contains;
		bool Contains(const gp_Pnt2d & theP);

		/****** Bnd_Box2d::Distance ******/
		/****** md5 signature: de57095bcfea4be3120598b0bb44e5b2 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Box2d

Return
-------
double

Description
-----------
Computes the minimum distance between two 2D boxes.
") Distance;
		double Distance(const Bnd_Box2d & theOther);

		/****** Bnd_Box2d::Dump ******/
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

		/****** Bnd_Box2d::Enlarge ******/
		/****** md5 signature: c336cb884b7d0ba2c8f10236380f74c3 ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
theTol: double

Return
-------
None

Description
-----------
Enlarges the box with a tolerance value. This means that the minimum values of its X and Y intervals of definition, when they are finite, are reduced by the absolute value of Tol, while the maximum values are increased by the same amount.
") Enlarge;
		void Enlarge(const double theTol);

		/****** Bnd_Box2d::Get ******/
		/****** md5 signature: 6f13b380bf6960049f0fb4ba0da4078f ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "
Parameters
----------

Return
-------
aXmin: double
aYmin: double
aXmax: double
aYmax: double

Description
-----------
Returns the bounds of this 2D bounding box. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). if IsVoid().
") Get;
		void Get(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bnd_Box2d::Get ******/
		/****** md5 signature: 870c0291227918a8611c6f42df5107df ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
Bnd_Box2d::Limits

Description
-----------
Returns the bounds of this 2D bounding box as a Limits structure. The gap is included. If this bounding box is infinite (i.e. 'open'), returned values may be equal to +/- Precision::Infinite(). If the box is void, returns raw internal values. Can be used with C++17 structured bindings: @code auto [xmin, xmax, ymin, ymax] = aBox.Get(); @endcode.
") Get;
		Bnd_Box2d::Limits Get();

		/****** Bnd_Box2d::GetGap ******/
		/****** md5 signature: 3170c07d29b894bad8aff9a1de58aafb ******/
		%feature("compactdefaultargs") GetGap;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the gap of this 2D bounding box.
") GetGap;
		double GetGap();

		/****** Bnd_Box2d::GetXMax ******/
		/****** md5 signature: a505be33172b921c136fa12f41ab16ac ******/
		%feature("compactdefaultargs") GetXMax;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Xmax value (IsOpenXmax() ? Precision::Infinite(): Xmax + GetGap()).
") GetXMax;
		double GetXMax();

		/****** Bnd_Box2d::GetXMin ******/
		/****** md5 signature: a4fe5af18cf67e4f1efa35fd8bd69899 ******/
		%feature("compactdefaultargs") GetXMin;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Xmin value (IsOpenXmin() ? -Precision::Infinite(): Xmin - GetGap()).
") GetXMin;
		double GetXMin();

		/****** Bnd_Box2d::GetYMax ******/
		/****** md5 signature: 5d9e1630a9216c2ee8b512099e75f5d9 ******/
		%feature("compactdefaultargs") GetYMax;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Ymax value (IsOpenYmax() ? Precision::Infinite(): Ymax + GetGap()).
") GetYMax;
		double GetYMax();

		/****** Bnd_Box2d::GetYMin ******/
		/****** md5 signature: 49c6c929c12167b9c98f5d34765a9648 ******/
		%feature("compactdefaultargs") GetYMin;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Ymin value (IsOpenYmin() ? -Precision::Infinite(): Ymin - GetGap()).
") GetYMin;
		double GetYMin();

		/****** Bnd_Box2d::Intersects ******/
		/****** md5 signature: 4e8ebbca35413c058483f0832115db40 ******/
		%feature("compactdefaultargs") Intersects;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Box2d

Return
-------
bool

Description
-----------
Returns True if the other 2d box intersects or is inside this box.
") Intersects;
		bool Intersects(const Bnd_Box2d & theOther);

		/****** Bnd_Box2d::IsOpenXmax ******/
		/****** md5 signature: 984634054031c88c3072a4bce5297874 ******/
		%feature("compactdefaultargs") IsOpenXmax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Xmax direction.
") IsOpenXmax;
		bool IsOpenXmax();

		/****** Bnd_Box2d::IsOpenXmin ******/
		/****** md5 signature: 3ecd88ae6a6a5ef453bde4166abf5cb7 ******/
		%feature("compactdefaultargs") IsOpenXmin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Xmin direction.
") IsOpenXmin;
		bool IsOpenXmin();

		/****** Bnd_Box2d::IsOpenYmax ******/
		/****** md5 signature: 48a2659a24a0e266c30359689b02bf3b ******/
		%feature("compactdefaultargs") IsOpenYmax;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Ymax direction.
") IsOpenYmax;
		bool IsOpenYmax();

		/****** Bnd_Box2d::IsOpenYmin ******/
		/****** md5 signature: 672a78c903111bffa5f36a8668b4dc00 ******/
		%feature("compactdefaultargs") IsOpenYmin;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is open in the Ymin direction.
") IsOpenYmin;
		bool IsOpenYmin();

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: d1fdc08d3d47e5891a4d9e8ab3be5d86 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
P: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if the 2d pnt <P> is out <self>.
") IsOut;
		bool IsOut(const gp_Pnt2d & P);

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: 7c2c19fa0f23b8d1e0aeb982707608f8 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theL: gp_Lin2d

Return
-------
bool

Description
-----------
Returns True if the line doesn't intersect the box.
") IsOut;
		bool IsOut(const gp_Lin2d & theL);

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: 36d13db2d4e732dae6146a555d5eb361 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theP0: gp_Pnt2d
theP1: gp_Pnt2d

Return
-------
bool

Description
-----------
Returns True if the segment doesn't intersect the box.
") IsOut;
		bool IsOut(const gp_Pnt2d & theP0, const gp_Pnt2d & theP1);

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: 1f9bfec62b4c039a7e83db914631c492 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
Other: Bnd_Box2d

Return
-------
bool

Description
-----------
Returns True if <Box2d> is out <self>.
") IsOut;
		bool IsOut(const Bnd_Box2d & Other);

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: 89549fb04c80c3741ed23cb56eeddcc8 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Box2d
theTrsf: gp_Trsf2d

Return
-------
bool

Description
-----------
Returns True if transformed <Box2d> is out <self>.
") IsOut;
		bool IsOut(const Bnd_Box2d & theOther, const gp_Trsf2d & theTrsf);

		/****** Bnd_Box2d::IsOut ******/
		/****** md5 signature: 6c6e9e44ccb3c656c8b24082246e0930 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
T1: gp_Trsf2d
Other: Bnd_Box2d
T2: gp_Trsf2d

Return
-------
bool

Description
-----------
Compares a transformed bounding with a transformed bounding. The default implementation is to make a copy of <self> and <Other>, to transform them and to test.
") IsOut;
		bool IsOut(const gp_Trsf2d & T1, const Bnd_Box2d & Other, const gp_Trsf2d & T2);

		/****** Bnd_Box2d::IsVoid ******/
		/****** md5 signature: d1e990d2cffeff4ddaa3dff6aed4ec5e ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this 2D bounding box is empty (Void flag).
") IsVoid;
		bool IsVoid();

		/****** Bnd_Box2d::IsWhole ******/
		/****** md5 signature: 44e5165de884a8ed14c61d2cad39234f ******/
		%feature("compactdefaultargs") IsWhole;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns true if this bounding box is infinite in all 4 directions (Whole Space flag).
") IsWhole;
		bool IsWhole();

		/****** Bnd_Box2d::OpenXmax ******/
		/****** md5 signature: 9c062e7606d56cd6bfce55a74805f1cc ******/
		%feature("compactdefaultargs") OpenXmax;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Xmax direction.
") OpenXmax;
		void OpenXmax();

		/****** Bnd_Box2d::OpenXmin ******/
		/****** md5 signature: 2a1cfdb03c109f3be9df7661e921ce44 ******/
		%feature("compactdefaultargs") OpenXmin;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Xmin direction.
") OpenXmin;
		void OpenXmin();

		/****** Bnd_Box2d::OpenYmax ******/
		/****** md5 signature: b12093f88b870ad6dd254acd4c961e89 ******/
		%feature("compactdefaultargs") OpenYmax;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Ymax direction.
") OpenYmax;
		void OpenYmax();

		/****** Bnd_Box2d::OpenYmin ******/
		/****** md5 signature: 01213cd11278efaa450bc8117f13da8f ******/
		%feature("compactdefaultargs") OpenYmin;
		%feature("autodoc", "Return
-------
None

Description
-----------
The Box will be infinitely long in the Ymin direction.
") OpenYmin;
		void OpenYmin();

		/****** Bnd_Box2d::Set ******/
		/****** md5 signature: 20e194d14a202c4fee73c68b1bd68f73 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d

Return
-------
None

Description
-----------
Sets this 2D bounding box so that it bounds the point P. This involves first setting this bounding box to be void and then adding the point PThe rectangle bounds the point <P>.
") Set;
		void Set(const gp_Pnt2d & thePnt);

		/****** Bnd_Box2d::Set ******/
		/****** md5 signature: 3c944f7f0f286da9b8af1532b3c8f1d6 ******/
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_Pnt2d
theDir: gp_Dir2d

Return
-------
None

Description
-----------
Sets this 2D bounding box so that it bounds the half-line defined by point P and direction D, i.e. all points M defined by M=P+u*D, where u is greater than or equal to 0, are inside the bounding area. This involves first setting this 2D box to be void and then adding the half-line.
") Set;
		void Set(const gp_Pnt2d & thePnt, const gp_Dir2d & theDir);

		/****** Bnd_Box2d::SetGap ******/
		/****** md5 signature: 3a22b15c6a65643cf9917899ea56719b ******/
		%feature("compactdefaultargs") SetGap;
		%feature("autodoc", "
Parameters
----------
Tol: double

Return
-------
None

Description
-----------
Set the gap of this 2D bounding box to abs(Tol).
") SetGap;
		void SetGap(const double Tol);

		/****** Bnd_Box2d::SetVoid ******/
		/****** md5 signature: ba0d9efd7de5be322d525cd09fd4850e ******/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets this 2D bounding box so that it is empty. All points are outside a void box.
") SetVoid;
		void SetVoid();

		/****** Bnd_Box2d::SetWhole ******/
		/****** md5 signature: 6d3ae3d96c06be082ca4ab7dccad18aa ******/
		%feature("compactdefaultargs") SetWhole;
		%feature("autodoc", "Return
-------
None

Description
-----------
Sets this bounding box so that it covers the whole 2D space, i.e. it is infinite in all directions.
") SetWhole;
		void SetWhole();

		/****** Bnd_Box2d::SquareExtent ******/
		/****** md5 signature: 2670917100beea6c92bfc8e284a16c89 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
double

Description
-----------
Computes the squared diagonal of me.
") SquareExtent;
		double SquareExtent();

		/****** Bnd_Box2d::Transformed ******/
		/****** md5 signature: 9f68554d14860db57f14fcdad98487d8 ******/
		%feature("compactdefaultargs") Transformed;
		%feature("autodoc", "
Parameters
----------
T: gp_Trsf2d

Return
-------
Bnd_Box2d

Description
-----------
Returns a bounding box which is the result of applying the transformation T to this bounding box. Warning Applying a geometric transformation (for example, a rotation) to a bounding box generally increases its dimensions. This is not optimal for algorithms which use it.
") Transformed;
		Bnd_Box2d Transformed(const gp_Trsf2d & T);

		/****** Bnd_Box2d::Update ******/
		/****** md5 signature: f7bafc4c0b75c80bb127580c5933d7a9 ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
aXmin: double
aYmin: double
aXmax: double
aYmax: double

Return
-------
None

Description
-----------
Enlarges this 2D bounding box, if required, so that it contains at least: - interval [ aXmin,aXmax ] in the 'X Direction', - interval [ aYmin,aYmax ] in the 'Y Direction'.
") Update;
		void Update(const double aXmin, const double aYmin, const double aXmax, const double aYmax);

		/****** Bnd_Box2d::Update ******/
		/****** md5 signature: b46735f0fa10b3d617b838fc0fbc269f ******/
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "
Parameters
----------
X: double
Y: double

Return
-------
None

Description
-----------
Adds a point of coordinates (X,Y) to this bounding box.
") Update;
		void Update(const double X, const double Y);

};



%extend Bnd_Box2d {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_Box2d {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_Box2d()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_Box2d')
    }
};
%extend Bnd_Box2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/****************
* class Bnd_OBB *
****************/
class Bnd_OBB {
	public:
		class HalfSizes {};
		/****** Bnd_OBB::Bnd_OBB ******/
		/****** md5 signature: 89e871e268e0b019a1a62d73fd55eb19 ******/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Bnd_OBB;
		 Bnd_OBB();

		/****** Bnd_OBB::Bnd_OBB ******/
		/****** md5 signature: 6aed424808a1a8cee29ee4675d6c92dd ******/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt
theXDirection: gp_Dir
theYDirection: gp_Dir
theZDirection: gp_Dir
theHXSize: double
theHYSize: double
theHZSize: double

Return
-------
None

Description
-----------
Constructor taking all defining parameters.
") Bnd_OBB;
		 Bnd_OBB(const gp_Pnt & theCenter, const gp_Dir & theXDirection, const gp_Dir & theYDirection, const gp_Dir & theZDirection, const double theHXSize, const double theHYSize, const double theHZSize);

		/****** Bnd_OBB::Bnd_OBB ******/
		/****** md5 signature: 5c80c49300d6c6d28ac3791ffa9f9dfb ******/
		%feature("compactdefaultargs") Bnd_OBB;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
None

Description
-----------
Constructor to create OBB from AABB.
") Bnd_OBB;
		 Bnd_OBB(const Bnd_Box & theBox);

		/****** Bnd_OBB::Add ******/
		/****** md5 signature: 1f61a26817c8d333e27dfcdd5e33f7c7 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_OBB

Return
-------
None

Description
-----------
Rebuilds this in order to include all previous objects (which it was created from) and theOther.
") Add;
		void Add(const Bnd_OBB & theOther);

		/****** Bnd_OBB::Add ******/
		/****** md5 signature: 67fb36a9dbd11d4528c03db6f935bcb9 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
None

Description
-----------
Rebuilds this in order to include all previous objects (which it was created from) and theP.
") Add;
		void Add(const gp_Pnt & theP);

		/****** Bnd_OBB::Center ******/
		/****** md5 signature: c672454dc07910e9a8767ab25aa95a44 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the center of OBB.
") Center;
		const gp_XYZ Center();

		/****** Bnd_OBB::Contains ******/
		/****** md5 signature: a15648a04bd93d12caabaa31b58298b4 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Returns True if the point is inside or on the boundary of this OBB.
") Contains;
		bool Contains(const gp_Pnt & theP);


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Bnd_OBB::Enlarge ******/
		/****** md5 signature: 7adb2e912741e492c5d17e84c779f0e3 ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
theGapAdd: double

Return
-------
None

Description
-----------
Enlarges the box with the given value.
") Enlarge;
		void Enlarge(const double theGapAdd);

		/****** Bnd_OBB::GetHalfSizes ******/
		/****** md5 signature: de3995b1a1e13dc0a430893e7d86d0cf ******/
		%feature("compactdefaultargs") GetHalfSizes;
		%feature("autodoc", "Return
-------
Bnd_OBB::HalfSizes

Description
-----------
Returns the half-size dimensions of the OBB as a HalfSizes structure. Can be used with C++17 structured bindings: @code auto [aHX, aHY, aHZ] = anOBB.GetHalfSizes(); @endcode.
") GetHalfSizes;
		Bnd_OBB::HalfSizes GetHalfSizes();

		/****** Bnd_OBB::GetVertex ******/
		/****** md5 signature: eacfc75c17c0445fa52b4c476b1ddc3a ******/
		%feature("compactdefaultargs") GetVertex;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Returns the array of vertices in <this>. The local coordinate of the vertex depending on the index of the array are follow: Index == 0: (-XHSize(), -YHSize(), -ZHSize()) Index == 1: ( XHSize(), -YHSize(), -ZHSize()) Index == 2: (-XHSize(), YHSize(), -ZHSize()) Index == 3: ( XHSize(), YHSize(), -ZHSize()) Index == 4: (-XHSize(), -YHSize(), ZHSize()) Index == 5: ( XHSize(), -YHSize(), ZHSize()) Index == 6: (-XHSize(), YHSize(), ZHSize()) Index == 7: ( XHSize(), YHSize(), ZHSize()).
") GetVertex;
		bool GetVertex(gp_Pnt theP[8]);

		/****** Bnd_OBB::Intersects ******/
		/****** md5 signature: c500ca5b2ad536e2bb41efc3b8e7b4fc ******/
		%feature("compactdefaultargs") Intersects;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_OBB

Return
-------
bool

Description
-----------
Returns True if the other OBB intersects or is inside this OBB.
") Intersects;
		bool Intersects(const Bnd_OBB & theOther);

		/****** Bnd_OBB::IsAABox ******/
		/****** md5 signature: bf0e71bd3b4d73a721799b070d984f80 ******/
		%feature("compactdefaultargs") IsAABox;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns True if the box is axes aligned.
") IsAABox;
		bool IsAABox();

		/****** Bnd_OBB::IsCompletelyInside ******/
		/****** md5 signature: 4fc0fa48325b31925d3a9ce233e6dc1a ******/
		%feature("compactdefaultargs") IsCompletelyInside;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_OBB

Return
-------
bool

Description
-----------
Check if the theOther is completely inside *this.
") IsCompletelyInside;
		bool IsCompletelyInside(const Bnd_OBB & theOther);

		/****** Bnd_OBB::IsOut ******/
		/****** md5 signature: 64e71859b4c3801a8dedc3582065bfe0 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_OBB

Return
-------
bool

Description
-----------
Check if the box do not interfere the other box.
") IsOut;
		bool IsOut(const Bnd_OBB & theOther);

		/****** Bnd_OBB::IsOut ******/
		/****** md5 signature: 46e8b9ac84e78cc7316d411ab02fe29f ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theP: gp_Pnt

Return
-------
bool

Description
-----------
Check if the point is inside of <this>.
") IsOut;
		bool IsOut(const gp_Pnt & theP);

		/****** Bnd_OBB::IsVoid ******/
		/****** md5 signature: d1e990d2cffeff4ddaa3dff6aed4ec5e ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Checks if the box is empty.
") IsVoid;
		bool IsVoid();

		/****** Bnd_OBB::Position ******/
		/****** md5 signature: abac85ad2868eb73ea9b953e87e8f5a6 ******/
		%feature("compactdefaultargs") Position;
		%feature("autodoc", "Return
-------
gp_Ax3

Description
-----------
Returns the local coordinates system of this oriented box. So that applying it to axis-aligned box ((-XHSize, -YHSize, -ZHSize), (XHSize, YHSize, ZHSize)) will produce this oriented box. @code gp_Trsf aLoc; aLoc.SetTransformation (theOBB.Position(), gp::XOY()); @endcode.
") Position;
		gp_Ax3 Position();

		/****** Bnd_OBB::ReBuild ******/
		/****** md5 signature: 711c8397094e3e98a5df2ca0ea789167 ******/
		%feature("compactdefaultargs") ReBuild;
		%feature("autodoc", "
Parameters
----------
theListOfPoints: TColgp_Array1OfPnt
theListOfTolerances: TColStd_Array1OfReal * (optional, default to nullptr)
theIsOptimal: bool (optional, default to false)

Return
-------
None

Description
-----------
Creates new OBB covering every point in theListOfPoints. Tolerance of every such point is set by *theListOfTolerances array. If this array is not void (not null-pointer) then the resulted Bnd_OBB will be enlarged using tolerances of points lying on the box surface. <theIsOptimal> flag defines the mode in which the OBB will be built. Constructing Optimal box takes more time, but the resulting box is usually more tight. In case of construction of Optimal OBB more possible axes are checked.
") ReBuild;
		void ReBuild(const TColgp_Array1OfPnt & theListOfPoints, const TColStd_Array1OfReal * theListOfTolerances = nullptr, const bool theIsOptimal = false);

		/****** Bnd_OBB::SetAABox ******/
		/****** md5 signature: d5f9ef6bcfedbe77b201524974699250 ******/
		%feature("compactdefaultargs") SetAABox;
		%feature("autodoc", "
Parameters
----------
theFlag: bool

Return
-------
None

Description
-----------
Sets the flag for axes aligned box.
") SetAABox;
		void SetAABox(const bool & theFlag);

		/****** Bnd_OBB::SetCenter ******/
		/****** md5 signature: ecf3b6f0e545b80cc6040218013c7da9 ******/
		%feature("compactdefaultargs") SetCenter;
		%feature("autodoc", "
Parameters
----------
theCenter: gp_Pnt

Return
-------
None

Description
-----------
Sets the center of OBB.
") SetCenter;
		void SetCenter(const gp_Pnt & theCenter);

		/****** Bnd_OBB::SetVoid ******/
		/****** md5 signature: 4e44fd52f6a76368c77b381fe1482a21 ******/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Clears this box.
") SetVoid;
		void SetVoid();

		/****** Bnd_OBB::SetXComponent ******/
		/****** md5 signature: a84934ed76d451989cce4bca2ca22e0b ******/
		%feature("compactdefaultargs") SetXComponent;
		%feature("autodoc", "
Parameters
----------
theXDirection: gp_Dir
theHXSize: double

Return
-------
None

Description
-----------
Sets the X component of OBB - direction and size.
") SetXComponent;
		void SetXComponent(const gp_Dir & theXDirection, const double theHXSize);

		/****** Bnd_OBB::SetYComponent ******/
		/****** md5 signature: b236b95cb8bed3effbbbca15fdf7c4d4 ******/
		%feature("compactdefaultargs") SetYComponent;
		%feature("autodoc", "
Parameters
----------
theYDirection: gp_Dir
theHYSize: double

Return
-------
None

Description
-----------
Sets the Y component of OBB - direction and size.
") SetYComponent;
		void SetYComponent(const gp_Dir & theYDirection, const double theHYSize);

		/****** Bnd_OBB::SetZComponent ******/
		/****** md5 signature: 30f7e259ab5143cf30bd90062710d4a2 ******/
		%feature("compactdefaultargs") SetZComponent;
		%feature("autodoc", "
Parameters
----------
theZDirection: gp_Dir
theHZSize: double

Return
-------
None

Description
-----------
Sets the Z component of OBB - direction and size.
") SetZComponent;
		void SetZComponent(const gp_Dir & theZDirection, const double theHZSize);

		/****** Bnd_OBB::SquareExtent ******/
		/****** md5 signature: 2670917100beea6c92bfc8e284a16c89 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns square diagonal of this box.
") SquareExtent;
		double SquareExtent();

		/****** Bnd_OBB::XDirection ******/
		/****** md5 signature: 1fd415b6ff8d9c6656fb63cc404f35ba ******/
		%feature("compactdefaultargs") XDirection;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the X Direction of OBB.
") XDirection;
		const gp_XYZ XDirection();

		/****** Bnd_OBB::XHSize ******/
		/****** md5 signature: 2bf5c5d370309f623d018cd081a491cb ******/
		%feature("compactdefaultargs") XHSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the X Dimension of OBB.
") XHSize;
		double XHSize();

		/****** Bnd_OBB::YDirection ******/
		/****** md5 signature: 462074baa47d26f0bb072e10f6788316 ******/
		%feature("compactdefaultargs") YDirection;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the Y Direction of OBB.
") YDirection;
		const gp_XYZ YDirection();

		/****** Bnd_OBB::YHSize ******/
		/****** md5 signature: 5022dd8c88ec577c9622feb23f9bd11f ******/
		%feature("compactdefaultargs") YHSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Y Dimension of OBB.
") YHSize;
		double YHSize();

		/****** Bnd_OBB::ZDirection ******/
		/****** md5 signature: 69e56ceda5bab75fcbb60d553bc80bbd ******/
		%feature("compactdefaultargs") ZDirection;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns the Z Direction of OBB.
") ZDirection;
		const gp_XYZ ZDirection();

		/****** Bnd_OBB::ZHSize ******/
		/****** md5 signature: a944b0e1cd115fed03e965617db0fa77 ******/
		%feature("compactdefaultargs") ZHSize;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the Z Dimension of OBB.
") ZHSize;
		double ZHSize();

};



%extend Bnd_OBB {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_OBB {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_OBB()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_OBB')
    }
};
%extend Bnd_OBB {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Bnd_Range *
******************/
class Bnd_Range {
	public:
		class Bounds {};
/* public enums */
enum IntersectStatus {
	IntersectStatus_Out = 0,
	IntersectStatus_In = 1,
	IntersectStatus_Boundary = 2,
};

/* end public enums declaration */

/* python proxy classes for enums */
%pythoncode {

class IntersectStatus(IntEnum):
	IntersectStatus_Out = 0
	IntersectStatus_In = 1
	IntersectStatus_Boundary = 2
IntersectStatus_Out = IntersectStatus.IntersectStatus_Out
IntersectStatus_In = IntersectStatus.IntersectStatus_In
IntersectStatus_Boundary = IntersectStatus.IntersectStatus_Boundary
};
/* end python proxy for enums */

		/****** Bnd_Range::Bnd_Range ******/
		/****** md5 signature: c4e1ef542ad0477e9971285d75047d7d ******/
		%feature("compactdefaultargs") Bnd_Range;
		%feature("autodoc", "Return
-------
None

Description
-----------
Default constructor. Creates VOID range.
") Bnd_Range;
		 Bnd_Range();

		/****** Bnd_Range::Bnd_Range ******/
		/****** md5 signature: 97013621468f37120e9da6758c779de6 ******/
		%feature("compactdefaultargs") Bnd_Range;
		%feature("autodoc", "
Parameters
----------
theMin: double
theMax: double

Return
-------
None

Description
-----------
Constructor. Never creates VOID range.
") Bnd_Range;
		 Bnd_Range(const double theMin, const double theMax);

		/****** Bnd_Range::Add ******/
		/****** md5 signature: 32b61a249e5210cff3ad639d821aa3bc ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theParameter: double

Return
-------
None

Description
-----------
Extends <this> to include theParameter.
") Add;
		void Add(const double theParameter);

		/****** Bnd_Range::Add ******/
		/****** md5 signature: 49550d5c240c310670e3adabff0f2431 ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theRange: Bnd_Range

Return
-------
None

Description
-----------
Extends this range to include both ranges. 
See also: use method ::Union() to check if two ranges overlap method merging.
") Add;
		void Add(const Bnd_Range & theRange);

		/****** Bnd_Range::Center ******/
		/****** md5 signature: c6ebf89562278931fda69fd3b9fc9aa9 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
std::optional<double >

Description
-----------
Returns the center of this range ((Min + Max) / 2). Returns std::nullopt if IsVoid().
") Center;
		std::optional<double > Center();

		/****** Bnd_Range::Common ******/
		/****** md5 signature: 9f5a37a4e8b0025ffc11bc0d0f8c7cd1 ******/
		%feature("compactdefaultargs") Common;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Range

Return
-------
None

Description
-----------
Replaces <this> with common-part of <this> and theOther.
") Common;
		void Common(const Bnd_Range & theOther);

		/****** Bnd_Range::Contains ******/
		/****** md5 signature: 30ff4f7faaa7d6b79ea006aa9517da34 ******/
		%feature("compactdefaultargs") Contains;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
bool

Description
-----------
Returns True if the value is within this range.
") Contains;
		bool Contains(double theValue);

		/****** Bnd_Range::Delta ******/
		/****** md5 signature: e53a86c0436ead3268872ced8ae97cfd ******/
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns range value (MAX-MIN). Returns negative value for VOID range.
") Delta;
		double Delta();


        /****************** DumpJson ******************/
        %feature("autodoc", "
Parameters
----------
depth: int, default=-1

Return
-------
str

Description
-----------
Dump the object to JSON string.
") DumpJson;
        %extend{
            std::string DumpJson(int depth=-1) {
            std::stringstream s;
            self->DumpJson(s, depth);
            return "{" + s.str() + "}" ;}
        };
		/****** Bnd_Range::Enlarge ******/
		/****** md5 signature: 142e8ca1e2838ddaf9528da079ba522a ******/
		%feature("compactdefaultargs") Enlarge;
		%feature("autodoc", "
Parameters
----------
theDelta: double

Return
-------
None

Description
-----------
Extends this to the given value (in both side).
") Enlarge;
		void Enlarge(const double theDelta);

		/****** Bnd_Range::Get ******/
		/****** md5 signature: 75d3b56c23463369e8151f5a2fa87435 ******/
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "Return
-------
std::optional<Bounds >

Description
-----------
Returns the bounds of this range as a Bounds structure. Returns std::nullopt if IsVoid(). Can be used with C++17 structured bindings: @code if (auto aBounds = aRange.Get()) { auto [aMin, aMax] = *aBounds; } @endcode.
") Get;
		std::optional<Bounds > Get();

		/****** Bnd_Range::GetBounds ******/
		/****** md5 signature: e66c16d837aa344d213ab9bdb15ec953 ******/
		%feature("compactdefaultargs") GetBounds;
		%feature("autodoc", "
Parameters
----------

Return
-------
theFirstPar: double
theLastPar: double

Description
-----------
Obtain first and last boundary of <this>. If <this> is VOID the method returns false.
") GetBounds;
		bool GetBounds(Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bnd_Range::GetIntermediatePoint ******/
		/****** md5 signature: 66af57813c8e51dfd13b17de69e82daa ******/
		%feature("compactdefaultargs") GetIntermediatePoint;
		%feature("autodoc", "
Parameters
----------
theLambda: double

Return
-------
theParameter: double

Description
-----------
Obtain theParameter satisfied to the equation (theParameter-MIN)/(MAX-MIN) == theLambda. * theLambda == 0 --> MIN boundary will be returned; * theLambda == 0.5 --> Middle point will be returned; * theLambda == 1 --> MAX boundary will be returned; * theLambda < 0 --> the value less than MIN will be returned; * theLambda > 1 --> the value greater than MAX will be returned. If <this> is VOID the method returns false.
") GetIntermediatePoint;
		bool GetIntermediatePoint(const double theLambda, Standard_Real &OutValue);

		/****** Bnd_Range::GetMax ******/
		/****** md5 signature: bdc5202fef0967e34bb061a58a2634f2 ******/
		%feature("compactdefaultargs") GetMax;
		%feature("autodoc", "
Parameters
----------

Return
-------
thePar: double

Description
-----------
Obtain MAX boundary of <this>. If <this> is VOID the method returns false.
") GetMax;
		bool GetMax(Standard_Real &OutValue);

		/****** Bnd_Range::GetMin ******/
		/****** md5 signature: 639d85098d05ec7c010c7aac5a761fc8 ******/
		%feature("compactdefaultargs") GetMin;
		%feature("autodoc", "
Parameters
----------

Return
-------
thePar: double

Description
-----------
Obtain MIN boundary of <this>. If <this> is VOID the method returns false.
") GetMin;
		bool GetMin(Standard_Real &OutValue);

		/****** Bnd_Range::Intersects ******/
		/****** md5 signature: fb006f1994de3dd53b3942eb897d0b2c ******/
		%feature("compactdefaultargs") Intersects;
		%feature("autodoc", "
Parameters
----------
theRange: Bnd_Range

Return
-------
bool

Description
-----------
Returns True if the given range intersects (overlaps with) this range.
") Intersects;
		bool Intersects(const Bnd_Range & theRange);

		/****** Bnd_Range::IsIntersected ******/
		/****** md5 signature: 9c9af4323f281c4f3b55f2e0c26020d8 ******/
		%feature("compactdefaultargs") IsIntersected;
		%feature("autodoc", "
Parameters
----------
theVal: double
thePeriod: double (optional, default to 0.0)

Return
-------
Bnd_Range::IntersectStatus

Description
-----------
Checks if <this> intersects values like theVal+k*thePeriod, where k is an integer number (k = 0, +/-1, +/-2, ...). //! ATTENTION!!! If (myFirst == myLast) then this function will return only either Out or Boundary.
") IsIntersected;
		Bnd_Range::IntersectStatus IsIntersected(const double theVal, const double thePeriod = 0.0);

		/****** Bnd_Range::IsOut ******/
		/****** md5 signature: 6a8ac6f12903d300f286639f7613b15b ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theValue: double

Return
-------
bool

Description
-----------
Returns True if the value is out of this range.
") IsOut;
		bool IsOut(double theValue);

		/****** Bnd_Range::IsOut ******/
		/****** md5 signature: 8562fc0ba5b0a4d19d771dc9fe028c08 ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theRange: Bnd_Range

Return
-------
bool

Description
-----------
Returns True if the given range is out of this range.
") IsOut;
		bool IsOut(const Bnd_Range & theRange);

		/****** Bnd_Range::IsVoid ******/
		/****** md5 signature: d1e990d2cffeff4ddaa3dff6aed4ec5e ******/
		%feature("compactdefaultargs") IsVoid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Is <this> initialized.
") IsVoid;
		bool IsVoid();

		/****** Bnd_Range::Max ******/
		/****** md5 signature: 63a708d7f63c53f880b4df896bbb0e24 ******/
		%feature("compactdefaultargs") Max;
		%feature("autodoc", "Return
-------
std::optional<double >

Description
-----------
Returns the MAX boundary of <this>. Returns std::nullopt if IsVoid().
") Max;
		std::optional<double > Max();

		/****** Bnd_Range::Min ******/
		/****** md5 signature: ee1a40d10a181be88426f4cd3374ab0d ******/
		%feature("compactdefaultargs") Min;
		%feature("autodoc", "Return
-------
std::optional<double >

Description
-----------
Returns the MIN boundary of <this>. Returns std::nullopt if IsVoid().
") Min;
		std::optional<double > Min();

		/****** Bnd_Range::SetVoid ******/
		/****** md5 signature: ba0d9efd7de5be322d525cd09fd4850e ******/
		%feature("compactdefaultargs") SetVoid;
		%feature("autodoc", "Return
-------
None

Description
-----------
Initializes <this> by default parameters. Makes <this> VOID.
") SetVoid;
		void SetVoid();

		/****** Bnd_Range::Shift ******/
		/****** md5 signature: 310f301dc953c7e2dee8ce033a13453e ******/
		%feature("compactdefaultargs") Shift;
		%feature("autodoc", "
Parameters
----------
theVal: double

Return
-------
None

Description
-----------
Shifts <*this> by theVal.
") Shift;
		void Shift(const double theVal);

		/****** Bnd_Range::Shifted ******/
		/****** md5 signature: 76531730138356da56e159e6c969e080 ******/
		%feature("compactdefaultargs") Shifted;
		%feature("autodoc", "
Parameters
----------
theVal: double

Return
-------
Bnd_Range

Description
-----------
Returns the copy of <*this> shifted by theVal.
") Shifted;
		Bnd_Range Shifted(const double theVal);

		/****** Bnd_Range::Split ******/
		/****** md5 signature: 9b49214c6e1e28e7aa87670d82b55dcc ******/
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "
Parameters
----------
theVal: double
theList: NCollection_List<Bnd_Range>
thePeriod: double (optional, default to 0.0)

Return
-------
None

Description
-----------
Splits <this> to several sub-ranges by theVal value (e.g. range [3, 15] will be split by theVal==5 to the two ranges: [3, 5] and [5, 15]). New ranges will be pushed to theList (theList must be initialized correctly before calling this method). If thePeriod != 0.0 then at least one boundary of new ranges (if <*this> intersects theVal+k*thePeriod) will be equal to theVal+thePeriod*k, where k is an integer number (k = 0, +/-1, +/-2, ...). (let thePeriod in above example be 4 ==> we will obtain four ranges: [3, 5], [5, 9], [9, 13] and [13, 15].
") Split;
		void Split(const double theVal, NCollection_List<Bnd_Range> & theList, const double thePeriod = 0.0);

		/****** Bnd_Range::TrimFrom ******/
		/****** md5 signature: 32335e33d0cdf43d6f6bfda749b97c8b ******/
		%feature("compactdefaultargs") TrimFrom;
		%feature("autodoc", "
Parameters
----------
theValLower: double

Return
-------
None

Description
-----------
Trims the First value in range by the given lower limit. Marks range as Void if the given Lower value is greater than range Max.
") TrimFrom;
		void TrimFrom(const double theValLower);

		/****** Bnd_Range::TrimTo ******/
		/****** md5 signature: b7745add7c88ff0b65970f317a4d238b ******/
		%feature("compactdefaultargs") TrimTo;
		%feature("autodoc", "
Parameters
----------
theValUpper: double

Return
-------
None

Description
-----------
Trim the Last value in range by the given Upper limit. Marks range as Void if the given Upper value is smaller than range Max.
") TrimTo;
		void TrimTo(const double theValUpper);

		/****** Bnd_Range::Union ******/
		/****** md5 signature: b8140f2e16984c24e7679b10595aea0f ******/
		%feature("compactdefaultargs") Union;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Range

Return
-------
bool

Description
-----------
Joins *this and theOther to one interval. Replaces *this to the result. Returns false if the operation cannot be done (e.g. input arguments are empty or separated). 
See also: use method ::Add() to merge two ranges unconditionally.
") Union;
		bool Union(const Bnd_Range & theOther);


%extend{
    bool __eq_wrapper__(const Bnd_Range other) {
        if (*self==other) return true;
        else return false;
    }
}
%pythoncode {
def __eq__(self, right):
    try:
        return self.__eq_wrapper__(right)
    except:
        return False
}
};



%extend Bnd_Range {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_Range {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_Range()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_Range')
    }
};
%extend Bnd_Range {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/*******************
* class Bnd_Sphere *
*******************/
class Bnd_Sphere {
	public:
		/****** Bnd_Sphere::Bnd_Sphere ******/
		/****** md5 signature: c7419981813f88f5869f6cf8e039de21 ******/
		%feature("compactdefaultargs") Bnd_Sphere;
		%feature("autodoc", "Return
-------
None

Description
-----------
Empty constructor.
") Bnd_Sphere;
		 Bnd_Sphere();

		/****** Bnd_Sphere::Bnd_Sphere ******/
		/****** md5 signature: f3b2563029d56117339b1ec4a9a3a422 ******/
		%feature("compactdefaultargs") Bnd_Sphere;
		%feature("autodoc", "
Parameters
----------
theCntr: gp_XYZ
theRad: double
theU: int
theV: int

Return
-------
None

Description
-----------
Constructor of a definite sphere.
") Bnd_Sphere;
		 Bnd_Sphere(const gp_XYZ & theCntr, const double theRad, const int theU, const int theV);

		/****** Bnd_Sphere::Add ******/
		/****** md5 signature: e63556631cbf2ba437d3318f36771c8b ******/
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Sphere

Return
-------
None

Description
-----------
No available documentation.
") Add;
		void Add(const Bnd_Sphere & theOther);

		/****** Bnd_Sphere::Center ******/
		/****** md5 signature: c672454dc07910e9a8767ab25aa95a44 ******/
		%feature("compactdefaultargs") Center;
		%feature("autodoc", "Return
-------
gp_XYZ

Description
-----------
Returns center of sphere object.
") Center;
		const gp_XYZ Center();

		/****** Bnd_Sphere::Distance ******/
		/****** md5 signature: 98323e82c274c8c71e1cf624c6f80098 ******/
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "
Parameters
----------
theNode: gp_XYZ

Return
-------
double

Description
-----------
No available documentation.
") Distance;
		double Distance(const gp_XYZ & theNode);

		/****** Bnd_Sphere::Distances ******/
		/****** md5 signature: bb4ee8228566a8eb4fbd3101c9fc3521 ******/
		%feature("compactdefaultargs") Distances;
		%feature("autodoc", "
Parameters
----------
theXYZ: gp_XYZ

Return
-------
theMin: double
theMax: double

Description
-----------
Calculate and return minimal and maximal distance to sphere. NOTE: This function is tightly optimized; any modifications may affect performance!.
") Distances;
		void Distances(const gp_XYZ & theXYZ, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bnd_Sphere::IsOut ******/
		/****** md5 signature: 65f9681d16bb705339058c51e0a2d4df ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
theOther: Bnd_Sphere

Return
-------
bool

Description
-----------
No available documentation.
") IsOut;
		bool IsOut(const Bnd_Sphere & theOther);

		/****** Bnd_Sphere::IsOut ******/
		/****** md5 signature: 015e1cac5c546bd725347ca180065d6d ******/
		%feature("compactdefaultargs") IsOut;
		%feature("autodoc", "
Parameters
----------
thePnt: gp_XYZ

Return
-------
theMaxDist: double

Description
-----------
No available documentation.
") IsOut;
		bool IsOut(const gp_XYZ & thePnt, Standard_Real &OutValue);

		/****** Bnd_Sphere::IsValid ******/
		/****** md5 signature: f6c8ceac22636b510354e0423665508c ******/
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "Return
-------
bool

Description
-----------
Returns validity status, indicating that this sphere corresponds to a real entity.
") IsValid;
		bool IsValid();

		/****** Bnd_Sphere::Project ******/
		/****** md5 signature: d18fa7c877305ef2c9ee8016eb1d3637 ******/
		%feature("compactdefaultargs") Project;
		%feature("autodoc", "
Parameters
----------
theNode: gp_XYZ
theProjNode: gp_XYZ

Return
-------
theDist: double
theInside: bool

Description
-----------
Projects a point on entity. Returns true if success.
") Project;
		bool Project(const gp_XYZ & theNode, gp_XYZ & theProjNode, Standard_Real &OutValue, Standard_Boolean &OutValue);

		/****** Bnd_Sphere::Radius ******/
		/****** md5 signature: 0eb935d3ea690d15c7a1828977599f04 ******/
		%feature("compactdefaultargs") Radius;
		%feature("autodoc", "Return
-------
double

Description
-----------
Returns the radius value.
") Radius;
		double Radius();

		/****** Bnd_Sphere::SetValid ******/
		/****** md5 signature: 162394d66ae94046225d61608916848b ******/
		%feature("compactdefaultargs") SetValid;
		%feature("autodoc", "
Parameters
----------
isValid: bool

Return
-------
None

Description
-----------
No available documentation.
") SetValid;
		void SetValid(const bool isValid);

		/****** Bnd_Sphere::SquareDistance ******/
		/****** md5 signature: aa9d5c5a0e96c6b23fc3aba8321690ac ******/
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "
Parameters
----------
theNode: gp_XYZ

Return
-------
double

Description
-----------
No available documentation.
") SquareDistance;
		double SquareDistance(const gp_XYZ & theNode);

		/****** Bnd_Sphere::SquareDistances ******/
		/****** md5 signature: 3cd4d1efb966ee4da2c03a464668483a ******/
		%feature("compactdefaultargs") SquareDistances;
		%feature("autodoc", "
Parameters
----------
theXYZ: gp_XYZ

Return
-------
theMin: double
theMax: double

Description
-----------
Calculate and return minimal and maximal distance to sphere. NOTE: This function is tightly optimized; any modifications may affect performance!.
") SquareDistances;
		void SquareDistances(const gp_XYZ & theXYZ, Standard_Real &OutValue, Standard_Real &OutValue);

		/****** Bnd_Sphere::SquareExtent ******/
		/****** md5 signature: 46271d4a81089e893d860cd4dfe49ad8 ******/
		%feature("compactdefaultargs") SquareExtent;
		%feature("autodoc", "Return
-------
double

Description
-----------
No available documentation.
") SquareExtent;
		double SquareExtent();

		/****** Bnd_Sphere::U ******/
		/****** md5 signature: 865bbd639616299a6c7ee6316893b232 ******/
		%feature("compactdefaultargs") U;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the U parameter on shape.
") U;
		int U();

		/****** Bnd_Sphere::V ******/
		/****** md5 signature: 4b195d776d1f8d08c96590cfddbcbc6a ******/
		%feature("compactdefaultargs") V;
		%feature("autodoc", "Return
-------
int

Description
-----------
Returns the V parameter on shape.
") V;
		int V();

};



%extend Bnd_Sphere {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_Sphere {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_Sphere()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_Sphere')
    }
};
%extend Bnd_Sphere {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/******************
* class Bnd_Tools *
******************/
class Bnd_Tools {
	public:
		/****** Bnd_Tools::Bnd2BVH ******/
		/****** md5 signature: e1dc8c56b474159662b2c5d1993298f4 ******/
		%feature("compactdefaultargs") Bnd2BVH;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box2d

Return
-------
BVH_Box<double, 2 >

Description
-----------
Converts the given Bnd_Box2d to BVH_Box.
") Bnd2BVH;
		static BVH_Box<double, 2 > Bnd2BVH(const Bnd_Box2d & theBox);

		/****** Bnd_Tools::Bnd2BVH ******/
		/****** md5 signature: 011aca5d5e27b9cf5fd7065e60a4ec3a ******/
		%feature("compactdefaultargs") Bnd2BVH;
		%feature("autodoc", "
Parameters
----------
theBox: Bnd_Box

Return
-------
BVH_Box<double, 3 >

Description
-----------
Converts the given Bnd_Box to BVH_Box.
") Bnd2BVH;
		static BVH_Box<double, 3 > Bnd2BVH(const Bnd_Box & theBox);

};



%extend Bnd_Tools {
%pythoncode {
    def __getstate__(self):
        return self.DumpJson()
    }
};

%extend Bnd_Tools {
%pythoncode {
    def __setstate__(self, state):
        inst = Bnd_Tools()
        if inst.InitFromJson(state):
            self.this = inst.this
        else:
            raise IOError('Failed to set state of Bnd_Tools')
    }
};
%extend Bnd_Tools {
	%pythoncode {
	__repr__ = _dumps_object
	}
};

/* harray1 classes */

class Bnd_HArray1OfBox : public NCollection_Array1<Bnd_Box>, public Standard_Transient {
  public:
    Bnd_HArray1OfBox(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfBox(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<Bnd_Box>::value_type& theValue);
    Bnd_HArray1OfBox(const NCollection_Array1<Bnd_Box>& theOther);
    const NCollection_Array1<Bnd_Box>& Array1();
    NCollection_Array1<Bnd_Box>& ChangeArray1();
};
%make_alias(Bnd_HArray1OfBox)


class Bnd_HArray1OfBox2d : public NCollection_Array1<Bnd_Box2d>, public Standard_Transient {
  public:
    Bnd_HArray1OfBox2d(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfBox2d(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<Bnd_Box2d>::value_type& theValue);
    Bnd_HArray1OfBox2d(const NCollection_Array1<Bnd_Box2d>& theOther);
    const NCollection_Array1<Bnd_Box2d>& Array1();
    NCollection_Array1<Bnd_Box2d>& ChangeArray1();
};
%make_alias(Bnd_HArray1OfBox2d)


class Bnd_HArray1OfSphere : public NCollection_Array1<Bnd_Sphere>, public Standard_Transient {
  public:
    Bnd_HArray1OfSphere(const Standard_Integer theLower, const Standard_Integer theUpper);
    Bnd_HArray1OfSphere(const Standard_Integer theLower, const Standard_Integer theUpper, const NCollection_Array1<Bnd_Sphere>::value_type& theValue);
    Bnd_HArray1OfSphere(const NCollection_Array1<Bnd_Sphere>& theOther);
    const NCollection_Array1<Bnd_Sphere>& Array1();
    NCollection_Array1<Bnd_Sphere>& ChangeArray1();
};
%make_alias(Bnd_HArray1OfSphere)

/* harray2 classes */
/* hsequence classes */
/* class aliases */
%pythoncode {
}
/* deprecated methods */
%pythoncode {
@deprecated
def Bnd_Tools_Bnd2BVH(*args):
	return Bnd_Tools.Bnd2BVH(*args)

@deprecated
def Bnd_Tools_Bnd2BVH(*args):
	return Bnd_Tools.Bnd2BVH(*args)

}
