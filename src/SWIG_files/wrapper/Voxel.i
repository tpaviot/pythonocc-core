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
%module (package="OCC") Voxel

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


%include Voxel_headers.i


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
typedef NCollection_DataMap <iXYZ , Standard_Byte> iXYZBool;
typedef NCollection_DataMap <iXYZ , Standard_Integer> iXYZIndex;
/* end typedefs declaration */

/* public enums */
enum Voxel_VoxelDisplayMode {
	Voxel_VDM_POINTS = 0,
	Voxel_VDM_NEARESTPOINTS = 1,
	Voxel_VDM_BOXES = 2,
	Voxel_VDM_NEARESTBOXES = 3,
};

enum Voxel_VoxelFileFormat {
	Voxel_VFF_ASCII = 0,
	Voxel_VFF_BINARY = 1,
};

/* end public enums declaration */

%nodefaultctor Voxel_BooleanOperation;
class Voxel_BooleanOperation {
	public:
		%feature("compactdefaultargs") Voxel_BooleanOperation;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_BooleanOperation;
		 Voxel_BooleanOperation ();
		%feature("compactdefaultargs") Fuse;
		%feature("autodoc", "	* Fuses two cubes of voxels. It modifies the first cube of voxels. It returns false in case of different dimension of the cube, different number of voxels.

	:param theVoxels1:
	:type theVoxels1: Voxel_BoolDS &
	:param theVoxels2:
	:type theVoxels2: Voxel_BoolDS &
	:rtype: bool
") Fuse;
		Standard_Boolean Fuse (Voxel_BoolDS & theVoxels1,const Voxel_BoolDS & theVoxels2);
		%feature("compactdefaultargs") Fuse;
		%feature("autodoc", "	* Fuses two cubes of voxels. It modifies the first cube of voxels. It returns false in case of different dimension of the cube, different number of voxels. It summerizes the value of corresponding voxels and puts the result to theVoxels1. If the result exceeds 15 or becomes greater, it keeps 15.

	:param theVoxels1:
	:type theVoxels1: Voxel_ColorDS &
	:param theVoxels2:
	:type theVoxels2: Voxel_ColorDS &
	:rtype: bool
") Fuse;
		Standard_Boolean Fuse (Voxel_ColorDS & theVoxels1,const Voxel_ColorDS & theVoxels2);
		%feature("compactdefaultargs") Fuse;
		%feature("autodoc", "	* Fuses two cubes of voxels. It modifies the first cube of voxels. It returns false in case of different dimension of the cube, different number of voxels. It summerizes the value of corresponding voxels and puts the result to theVoxels1.

	:param theVoxels1:
	:type theVoxels1: Voxel_FloatDS &
	:param theVoxels2:
	:type theVoxels2: Voxel_FloatDS &
	:rtype: bool
") Fuse;
		Standard_Boolean Fuse (Voxel_FloatDS & theVoxels1,const Voxel_FloatDS & theVoxels2);
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "	* Cuts two cubes of voxels. It modifies the first cube of voxels. It returns false in case of different dimension of the cube, different number of voxels.

	:param theVoxels1:
	:type theVoxels1: Voxel_BoolDS &
	:param theVoxels2:
	:type theVoxels2: Voxel_BoolDS &
	:rtype: bool
") Cut;
		Standard_Boolean Cut (Voxel_BoolDS & theVoxels1,const Voxel_BoolDS & theVoxels2);
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "	* Cuts two cubes of voxels. It modifies the first cube of voxels. It returns false in case of different dimension of the cube, different number of voxels. It subtracts the value of corresponding voxels and puts the result to theVoxels1.

	:param theVoxels1:
	:type theVoxels1: Voxel_ColorDS &
	:param theVoxels2:
	:type theVoxels2: Voxel_ColorDS &
	:rtype: bool
") Cut;
		Standard_Boolean Cut (Voxel_ColorDS & theVoxels1,const Voxel_ColorDS & theVoxels2);
		%feature("compactdefaultargs") Cut;
		%feature("autodoc", "	* Cuts two cubes of voxels. It modifies the first cube of voxels. It returns false in case of different dimension of the cube, different number of voxels. It subtracts the value of corresponding voxels and puts the result to theVoxels1.

	:param theVoxels1:
	:type theVoxels1: Voxel_FloatDS &
	:param theVoxels2:
	:type theVoxels2: Voxel_FloatDS &
	:rtype: bool
") Cut;
		Standard_Boolean Cut (Voxel_FloatDS & theVoxels1,const Voxel_FloatDS & theVoxels2);
};


%extend Voxel_BooleanOperation {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_CollisionDetection;
class Voxel_CollisionDetection {
	public:
		%feature("compactdefaultargs") Voxel_CollisionDetection;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_CollisionDetection;
		 Voxel_CollisionDetection ();
		%feature("compactdefaultargs") Voxel_CollisionDetection;
		%feature("autodoc", "	* A constructor. It defines deflection of triangulation for the shapes. As lower the deflection is, as proper the triangulation is generated. Also, it defines number of splits along X, Y and Z axes for generation of voxels. As greater the numbers are, as greater number of voxels is used for detection of collision.

	:param deflection:
	:type deflection: float
	:param nbx:
	:type nbx: int
	:param nby:
	:type nby: int
	:param nbz:
	:type nbz: int
	:rtype: None
") Voxel_CollisionDetection;
		 Voxel_CollisionDetection (const Standard_Real deflection,const Standard_Integer nbx,const Standard_Integer nby,const Standard_Integer nbz);
		%feature("compactdefaultargs") AddShape;
		%feature("autodoc", "	* Adds a shape. Returns an index of the shape.

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: int
") AddShape;
		Standard_Integer AddShape (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") ReplaceShape;
		%feature("autodoc", "	* Replaces a shape by another one. <ishape> is an index of the shape. This method is useful for moving shape, for example.

	:param ishape:
	:type ishape: int
	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: bool
") ReplaceShape;
		Standard_Boolean ReplaceShape (const Standard_Integer ishape,const TopoDS_Shape & shape);
		%feature("compactdefaultargs") SetDeflection;
		%feature("autodoc", "	* Defines the deflection of triangulation of shapes.

	:param deflection:
	:type deflection: float
	:rtype: None
") SetDeflection;
		void SetDeflection (const Standard_Real deflection);
		%feature("compactdefaultargs") SetNbVoxels;
		%feature("autodoc", "	* Defines the number of voxels along X, Y and Z axes.

	:param nbx:
	:type nbx: int
	:param nby:
	:type nby: int
	:param nbz:
	:type nbz: int
	:rtype: None
") SetNbVoxels;
		void SetNbVoxels (const Standard_Integer nbx,const Standard_Integer nby,const Standard_Integer nbz);
		%feature("compactdefaultargs") SetBoundaryBox;
		%feature("autodoc", "	* Defines a user-defined boundary box for generation of voxels. If this method is not called, the algorithm calculates the boundary box itself.

	:param box:
	:type box: Bnd_Box &
	:rtype: None
") SetBoundaryBox;
		void SetBoundaryBox (const Bnd_Box & box);
		%feature("compactdefaultargs") SetUsageOfVolume;
		%feature("autodoc", "	* Defines usage of volume of shapes in collision detection algorithm. Beware, usage of volume a little bit decreases the speed of algorithm.

	:param usage:
	:type usage: bool
	:rtype: None
") SetUsageOfVolume;
		void SetUsageOfVolume (const Standard_Boolean usage);
		%feature("compactdefaultargs") KeepCollisions;
		%feature("autodoc", "	* Doesn't clean the collision points on new call to the method Compute(). It allows to see the collisions for a moving shape.

	:param keep:
	:type keep: bool
	:rtype: None
") KeepCollisions;
		void KeepCollisions (const Standard_Boolean keep);
		%feature("compactdefaultargs") Voxelize;
		%feature("autodoc", "	* Prepares data for computation of collisions. It checks the inner parameters (number of voxels along X, Y and Z axes) and voxelizes the shapes. If the shape is not changed since the last call to this method, this method may be not called for this shape. <ishape> - is the index of the shape for processing by this method. If it is equal to -1, all shapes will be processed.

	:param ishape: default value is -1
	:type ishape: int
	:rtype: bool
") Voxelize;
		Standard_Boolean Voxelize (const Standard_Integer ishape = -1);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* Computes the collisions. This method may be called many times if, for example, the shapes are being moved.

	:rtype: bool
") Compute;
		Standard_Boolean Compute ();
		%feature("compactdefaultargs") HasCollisions;
		%feature("autodoc", "	* Returns true if a collision is detected.

	:rtype: bool
") HasCollisions;
		Standard_Boolean HasCollisions ();
		%feature("compactdefaultargs") GetCollisions;
		%feature("autodoc", "	* Returns the collided voxels.

	:rtype: Voxel_BoolDS
") GetCollisions;
		const Voxel_BoolDS & GetCollisions ();
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* A destructor.

	:rtype: None
") Destroy;
		void Destroy ();
};


%extend Voxel_CollisionDetection {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_DS;
class Voxel_DS {
	public:
		%feature("compactdefaultargs") Voxel_DS;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_DS;
		 Voxel_DS ();
		%feature("compactdefaultargs") Voxel_DS;
		%feature("autodoc", "	* A constructor initializing the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: None
") Voxel_DS;
		 Voxel_DS (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialization of the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions. The methods below return initial data of the voxel model.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") GetX;
		%feature("autodoc", "	:rtype: float
") GetX;
		Standard_Real GetX ();
		%feature("compactdefaultargs") GetY;
		%feature("autodoc", "	:rtype: float
") GetY;
		Standard_Real GetY ();
		%feature("compactdefaultargs") GetZ;
		%feature("autodoc", "	:rtype: float
") GetZ;
		Standard_Real GetZ ();
		%feature("compactdefaultargs") GetXLen;
		%feature("autodoc", "	:rtype: float
") GetXLen;
		Standard_Real GetXLen ();
		%feature("compactdefaultargs") GetYLen;
		%feature("autodoc", "	:rtype: float
") GetYLen;
		Standard_Real GetYLen ();
		%feature("compactdefaultargs") GetZLen;
		%feature("autodoc", "	:rtype: float
") GetZLen;
		Standard_Real GetZLen ();
		%feature("compactdefaultargs") GetNbX;
		%feature("autodoc", "	:rtype: int
") GetNbX;
		Standard_Integer GetNbX ();
		%feature("compactdefaultargs") GetNbY;
		%feature("autodoc", "	:rtype: int
") GetNbY;
		Standard_Integer GetNbY ();
		%feature("compactdefaultargs") GetNbZ;
		%feature("autodoc", "	:rtype: int
") GetNbZ;
		Standard_Integer GetNbZ ();
		%feature("compactdefaultargs") GetCenter;
		%feature("autodoc", "	* Returns the center point of a voxel with co-ordinates (ix, iy, iz).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param xc:
	:type xc: float &
	:param yc:
	:type yc: float &
	:param zc:
	:type zc: float &
	:rtype: None
") GetCenter;
		void GetCenter (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetOrigin;
		%feature("autodoc", "	* Returns the origin point of a voxel with co-ordinates (ix, iy, iz).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param x0:
	:type x0: float &
	:param y0:
	:type y0: float &
	:param z0:
	:type z0: float &
	:rtype: None
") GetOrigin;
		void GetOrigin (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetVoxel;
		%feature("autodoc", "	* Finds a voxel corresponding to a 3D point. Returns true if it is found.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param ix:
	:type ix: int &
	:param iy:
	:type iy: int &
	:param iz:
	:type iz: int &
	:rtype: bool
") GetVoxel;
		Standard_Boolean GetVoxel (const Standard_Real x,const Standard_Real y,const Standard_Real z,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetVoxelX;
		%feature("autodoc", "	* Returns x-index of a voxel corresponding to x-coordinate.

	:param x:
	:type x: float
	:param ix:
	:type ix: int &
	:rtype: bool
") GetVoxelX;
		Standard_Boolean GetVoxelX (const Standard_Real x,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetVoxelY;
		%feature("autodoc", "	* Returns y-index of a voxel corresponding to y-coordinate.

	:param y:
	:type y: float
	:param iy:
	:type iy: int &
	:rtype: bool
") GetVoxelY;
		Standard_Boolean GetVoxelY (const Standard_Real y,Standard_Integer &OutValue);
		%feature("compactdefaultargs") GetVoxelZ;
		%feature("autodoc", "	* Returns z-index of a voxel corresponding to z-coordinate.

	:param z:
	:type z: float
	:param iz:
	:type iz: int &
	:rtype: bool
") GetVoxelZ;
		Standard_Boolean GetVoxelZ (const Standard_Real z,Standard_Integer &OutValue);
};


%extend Voxel_DS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_FastConverter;
class Voxel_FastConverter {
	public:
		%feature("compactdefaultargs") Voxel_FastConverter;
		%feature("autodoc", "	* A constructor for conversion of a shape into a cube of boolean voxels. It allocates the voxels in memory. 'nbthreads' defines the number of threads used to convert the shape.

	:param shape:
	:type shape: TopoDS_Shape &
	:param voxels:
	:type voxels: Voxel_BoolDS &
	:param deflection: default value is 0.1
	:type deflection: float
	:param nbx: default value is 10
	:type nbx: int
	:param nby: default value is 10
	:type nby: int
	:param nbz: default value is 10
	:type nbz: int
	:param nbthreads: default value is 1
	:type nbthreads: int
	:param useExistingTriangulation: default value is Standard_False
	:type useExistingTriangulation: bool
	:rtype: None
") Voxel_FastConverter;
		 Voxel_FastConverter (const TopoDS_Shape & shape,Voxel_BoolDS & voxels,const Standard_Real deflection = 0.1,const Standard_Integer nbx = 10,const Standard_Integer nby = 10,const Standard_Integer nbz = 10,const Standard_Integer nbthreads = 1,const Standard_Boolean useExistingTriangulation = Standard_False);
		%feature("compactdefaultargs") Voxel_FastConverter;
		%feature("autodoc", "	* A constructor for conversion of a shape into a cube of colored voxels. It allocates the voxels in memory. 'nbthreads' defines the number of threads used to convert the shape.

	:param shape:
	:type shape: TopoDS_Shape &
	:param voxels:
	:type voxels: Voxel_ColorDS &
	:param deflection: default value is 0.1
	:type deflection: float
	:param nbx: default value is 10
	:type nbx: int
	:param nby: default value is 10
	:type nby: int
	:param nbz: default value is 10
	:type nbz: int
	:param nbthreads: default value is 1
	:type nbthreads: int
	:param useExistingTriangulation: default value is Standard_False
	:type useExistingTriangulation: bool
	:rtype: None
") Voxel_FastConverter;
		 Voxel_FastConverter (const TopoDS_Shape & shape,Voxel_ColorDS & voxels,const Standard_Real deflection = 0.1,const Standard_Integer nbx = 10,const Standard_Integer nby = 10,const Standard_Integer nbz = 10,const Standard_Integer nbthreads = 1,const Standard_Boolean useExistingTriangulation = Standard_False);
		%feature("compactdefaultargs") Voxel_FastConverter;
		%feature("autodoc", "	* A constructor for conversion of a shape into a cube of boolean voxels split into 8 sub-voxels recursively. It allocates the voxels in memory. 'nbthreads' defines the number of threads used to convert the shape.

	:param shape:
	:type shape: TopoDS_Shape &
	:param voxels:
	:type voxels: Voxel_ROctBoolDS &
	:param deflection: default value is 0.1
	:type deflection: float
	:param nbx: default value is 10
	:type nbx: int
	:param nby: default value is 10
	:type nby: int
	:param nbz: default value is 10
	:type nbz: int
	:param nbthreads: default value is 1
	:type nbthreads: int
	:param useExistingTriangulation: default value is Standard_False
	:type useExistingTriangulation: bool
	:rtype: None
") Voxel_FastConverter;
		 Voxel_FastConverter (const TopoDS_Shape & shape,Voxel_ROctBoolDS & voxels,const Standard_Real deflection = 0.1,const Standard_Integer nbx = 10,const Standard_Integer nby = 10,const Standard_Integer nbz = 10,const Standard_Integer nbthreads = 1,const Standard_Boolean useExistingTriangulation = Standard_False);
		%feature("compactdefaultargs") Convert;
		%feature("autodoc", "	* Converts a shape into a voxel representation. It sets to 0 the outside volume of the shape and 1 for surfacic part of the shape. 'ithread' is the index of the thread for current call of ::Convert(). Start numeration of 'ithread' with 1, please.

	:param progress:
	:type progress: int &
	:param ithread: default value is 1
	:type ithread: int
	:rtype: bool
") Convert;
		Standard_Boolean Convert (Standard_Integer &OutValue,const Standard_Integer ithread = 1);
		%feature("compactdefaultargs") ConvertUsingSAT;
		%feature("autodoc", "	* Converts a shape into a voxel representation using separating axis theorem. It sets to 0 the outside volume of the shape and 1 for surfacic part of the shape. 'ithread' is the index of the thread for current call of ::Convert(). Start numeration of 'ithread' with 1, please.

	:param progress:
	:type progress: int &
	:param ithread: default value is 1
	:type ithread: int
	:rtype: bool
") ConvertUsingSAT;
		Standard_Boolean ConvertUsingSAT (Standard_Integer &OutValue,const Standard_Integer ithread = 1);
		%feature("compactdefaultargs") FillInVolume;
		%feature("autodoc", "	* Fills-in volume of the shape by a value.

	:param inner:
	:type inner: Standard_Byte
	:param ithread: default value is 1
	:type ithread: int
	:rtype: bool
") FillInVolume;
		Standard_Boolean FillInVolume (const Standard_Byte inner,const Standard_Integer ithread = 1);
		%feature("compactdefaultargs") FillInVolume;
		%feature("autodoc", "	* Fills-in volume of the shape by a value. Uses the topological information from the provided shape to judge whether points are inside the shape or not (only when processing vertical faces). The inner value has to be positive.

	:param inner:
	:type inner: Standard_Byte
	:param shape:
	:type shape: TopoDS_Shape &
	:param ithread: default value is 1
	:type ithread: int
	:rtype: bool
") FillInVolume;
		Standard_Boolean FillInVolume (const Standard_Byte inner,const TopoDS_Shape & shape,const Standard_Integer ithread = 1);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* A destructor.

	:rtype: None
") Destroy;
		void Destroy ();
};


%extend Voxel_FastConverter {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_Prs;
class Voxel_Prs : public AIS_InteractiveObject {
	public:
		%feature("compactdefaultargs") Voxel_Prs;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_Prs;
		 Voxel_Prs ();
		%feature("compactdefaultargs") SetBoolVoxels;
		%feature("autodoc", "	* <theVoxels> is a Voxel_BoolDS* object.

	:param theVoxels:
	:type theVoxels: Standard_Address
	:rtype: None
") SetBoolVoxels;
		void SetBoolVoxels (const Standard_Address theVoxels);
		%feature("compactdefaultargs") SetColorVoxels;
		%feature("autodoc", "	* <theVoxels> is a Voxel_ColorDS* object.

	:param theVoxels:
	:type theVoxels: Standard_Address
	:rtype: None
") SetColorVoxels;
		void SetColorVoxels (const Standard_Address theVoxels);
		%feature("compactdefaultargs") SetROctBoolVoxels;
		%feature("autodoc", "	* <theVoxels> is a Voxel_ROctBoolDS* object.

	:param theVoxels:
	:type theVoxels: Standard_Address
	:rtype: None
") SetROctBoolVoxels;
		void SetROctBoolVoxels (const Standard_Address theVoxels);
		%feature("compactdefaultargs") SetTriangulation;
		%feature("autodoc", "	* Sets a triangulation for visualization.

	:param theTriangulation:
	:type theTriangulation: Handle_Poly_Triangulation &
	:rtype: None
") SetTriangulation;
		void SetTriangulation (const Handle_Poly_Triangulation & theTriangulation);
		%feature("compactdefaultargs") SetDisplayMode;
		%feature("autodoc", "	* Sets a display mode for voxels.

	:param theMode:
	:type theMode: Voxel_VoxelDisplayMode
	:rtype: None
") SetDisplayMode;
		void SetDisplayMode (const Voxel_VoxelDisplayMode theMode);
		%feature("compactdefaultargs") SetColor;
		%feature("autodoc", "	* Defines the color of points, quadrangles ... for BoolDS.

	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") SetColor;
		virtual void SetColor (const Quantity_Color & theColor);
		%feature("compactdefaultargs") SetColors;
		%feature("autodoc", "	* Defines the color of points, quadrangles... for ColorDS. For ColorDS the size of array is 0 .. 15. 0 - means no color, this voxel is not drawn.

	:param theColors:
	:type theColors: Handle_Quantity_HArray1OfColor &
	:rtype: None
") SetColors;
		void SetColors (const Handle_Quantity_HArray1OfColor & theColors);
		%feature("compactdefaultargs") SetPointSize;
		%feature("autodoc", "	* Defines the size of points for all types of voxels.

	:param theSize:
	:type theSize: float
	:rtype: None
") SetPointSize;
		void SetPointSize (const Standard_Real theSize);
		%feature("compactdefaultargs") SetQuadrangleSize;
		%feature("autodoc", "	* Defines the size of quadrangles in per cents (0 .. 100).

	:param theSize:
	:type theSize: int
	:rtype: None
") SetQuadrangleSize;
		void SetQuadrangleSize (const Standard_Integer theSize);
		%feature("compactdefaultargs") SetTransparency;
		%feature("autodoc", "	* Defines the transparency value [0 .. 1] for quadrangular visualization.

	:param theTransparency:
	:type theTransparency: float
	:rtype: void
") SetTransparency;
		virtual void SetTransparency (const Standard_Real theTransparency);
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* Highlights a voxel. It doesn't re-computes the whole interactive object, but only marks a voxels as 'highlighted'. The voxel becomes highlighted on next swapping of buffers. In order to unhighlight a voxel, set ix = iy = iz = -1.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: None
") Highlight;
		void Highlight (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* A destructor of presentation data.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") SetDegenerateMode;
		%feature("autodoc", "	* Simplifies visualization of voxels in case of view rotation, panning and zooming.

	:param theDegenerate:
	:type theDegenerate: bool
	:rtype: None
") SetDegenerateMode;
		void SetDegenerateMode (const Standard_Boolean theDegenerate);
		%feature("compactdefaultargs") SetUsageOfGLlists;
		%feature("autodoc", "	* GL lists accelerate view rotation, panning and zooming operations, but it takes additional memory... It is up to the user of this interactive object to decide whether he has enough memory and may use GL lists or he is lack of memory and usage of GL lists is not recommended. By default, usage of GL lists is on. Also, as I noticed, the view without GL lists looks more precisely.

	:param theUsage:
	:type theUsage: bool
	:rtype: None
") SetUsageOfGLlists;
		void SetUsageOfGLlists (const Standard_Boolean theUsage);
		%feature("compactdefaultargs") SetSmoothPoints;
		%feature("autodoc", "	* Switches visualization of points from smooth to rough.

	:param theSmooth:
	:type theSmooth: bool
	:rtype: None
") SetSmoothPoints;
		void SetSmoothPoints (const Standard_Boolean theSmooth);
		%feature("compactdefaultargs") SetColorRange;
		%feature("autodoc", "	* Defines min-max values for visualization of voxels of ColorDS structure. By default, min value = 1, max value = 15 (all non-zero values).

	:param theMinValue:
	:type theMinValue: Standard_Byte
	:param theMaxValue:
	:type theMaxValue: Standard_Byte
	:rtype: None
") SetColorRange;
		void SetColorRange (const Standard_Byte theMinValue,const Standard_Byte theMaxValue);
		%feature("compactdefaultargs") SetSizeRange;
		%feature("autodoc", "	* Defines the displayed area of voxels. By default, the range is equal to the box of voxels (all voxels are displayed).

	:param theDisplayedXMin:
	:type theDisplayedXMin: float
	:param theDisplayedXMax:
	:type theDisplayedXMax: float
	:param theDisplayedYMin:
	:type theDisplayedYMin: float
	:param theDisplayedYMax:
	:type theDisplayedYMax: float
	:param theDisplayedZMin:
	:type theDisplayedZMin: float
	:param theDisplayedZMax:
	:type theDisplayedZMax: float
	:rtype: None
") SetSizeRange;
		void SetSizeRange (const Standard_Real theDisplayedXMin,const Standard_Real theDisplayedXMax,const Standard_Real theDisplayedYMin,const Standard_Real theDisplayedYMax,const Standard_Real theDisplayedZMin,const Standard_Real theDisplayedZMax);
};


%extend Voxel_Prs {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_Voxel_Prs(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_Voxel_Prs::Handle_Voxel_Prs %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_Voxel_Prs;
class Handle_Voxel_Prs : public Handle_AIS_InteractiveObject {

    public:
        // constructors
        Handle_Voxel_Prs();
        Handle_Voxel_Prs(const Handle_Voxel_Prs &aHandle);
        Handle_Voxel_Prs(const Voxel_Prs *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_Voxel_Prs DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Voxel_Prs {
    Voxel_Prs* _get_reference() {
    return (Voxel_Prs*)$self->Access();
    }
};

%extend Handle_Voxel_Prs {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend Voxel_Prs {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_Reader;
class Voxel_Reader {
	public:
		%feature("compactdefaultargs") Voxel_Reader;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_Reader;
		 Voxel_Reader ();
		%feature("compactdefaultargs") Read;
		%feature("autodoc", "	* Reads the voxels from disk

	:param file:
	:type file: TCollection_ExtendedString &
	:rtype: bool
") Read;
		Standard_Boolean Read (const TCollection_ExtendedString & file);
		%feature("compactdefaultargs") IsBoolVoxels;
		%feature("autodoc", "	* Informs the user about the type of voxels he has read.

	:rtype: bool
") IsBoolVoxels;
		Standard_Boolean IsBoolVoxels ();
		%feature("compactdefaultargs") IsColorVoxels;
		%feature("autodoc", "	* Informs the user about the type of voxels he has read.

	:rtype: bool
") IsColorVoxels;
		Standard_Boolean IsColorVoxels ();
		%feature("compactdefaultargs") IsFloatVoxels;
		%feature("autodoc", "	* Informs the user about the type of voxels he has read.

	:rtype: bool
") IsFloatVoxels;
		Standard_Boolean IsFloatVoxels ();
		%feature("compactdefaultargs") GetBoolVoxels;
		%feature("autodoc", "	* Returns a pointer to the read 1bit voxels.

	:rtype: Standard_Address
") GetBoolVoxels;
		Standard_Address GetBoolVoxels ();
		%feature("compactdefaultargs") GetColorVoxels;
		%feature("autodoc", "	* Returns a pointer to the read 4bit voxels.

	:rtype: Standard_Address
") GetColorVoxels;
		Standard_Address GetColorVoxels ();
		%feature("compactdefaultargs") GetFloatVoxels;
		%feature("autodoc", "	* Returns a pointer to the read 4bytes voxels.

	:rtype: Standard_Address
") GetFloatVoxels;
		Standard_Address GetFloatVoxels ();
};


%extend Voxel_Reader {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_Selector;
class Voxel_Selector {
	public:
		%feature("compactdefaultargs") Voxel_Selector;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_Selector;
		 Voxel_Selector ();
		%feature("compactdefaultargs") Voxel_Selector;
		%feature("autodoc", "	* A constructor of the selector, which initializes the classes by a view, where the user selects the voxels.

	:param view:
	:type view: Handle_V3d_View &
	:rtype: None
") Voxel_Selector;
		 Voxel_Selector (const Handle_V3d_View & view);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes the selector by a view, where the user selects the voxels.

	:param view:
	:type view: Handle_V3d_View &
	:rtype: None
") Init;
		void Init (const Handle_V3d_View & view);
		%feature("compactdefaultargs") SetVoxels;
		%feature("autodoc", "	* Defines the voxels (1bit).

	:param voxels:
	:type voxels: Voxel_BoolDS &
	:rtype: None
") SetVoxels;
		void SetVoxels (const Voxel_BoolDS & voxels);
		%feature("compactdefaultargs") SetVoxels;
		%feature("autodoc", "	* Defines the voxels (4bit).

	:param voxels:
	:type voxels: Voxel_ColorDS &
	:rtype: None
") SetVoxels;
		void SetVoxels (const Voxel_ColorDS & voxels);
		%feature("compactdefaultargs") SetVoxels;
		%feature("autodoc", "	* Defines the voxels (1bit recursive splitting).

	:param voxels:
	:type voxels: Voxel_ROctBoolDS &
	:rtype: None
") SetVoxels;
		void SetVoxels (const Voxel_ROctBoolDS & voxels);
		%feature("compactdefaultargs") Detect;
		%feature("autodoc", "	* Detects a voxel under the mouse cursor.

	:param winx:
	:type winx: int
	:param winy:
	:type winy: int
	:param ix:
	:type ix: int &
	:param iy:
	:type iy: int &
	:param iz:
	:type iz: int &
	:rtype: bool
") Detect;
		Standard_Boolean Detect (const Standard_Integer winx,const Standard_Integer winy,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
};


%extend Voxel_Selector {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_SplitData;
class Voxel_SplitData {
	public:
		%feature("compactdefaultargs") Voxel_SplitData;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_SplitData;
		 Voxel_SplitData ();
		%feature("compactdefaultargs") GetValues;
		%feature("autodoc", "	* Gives access to the values.

	:rtype: Standard_Address
") GetValues;
		Standard_Address & GetValues ();
		%feature("compactdefaultargs") GetSplitData;
		%feature("autodoc", "	* Gives access to the next split data.

	:rtype: Standard_Address
") GetSplitData;
		Standard_Address & GetSplitData ();
};


%extend Voxel_SplitData {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_Writer;
class Voxel_Writer {
	public:
		%feature("compactdefaultargs") Voxel_Writer;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_Writer;
		 Voxel_Writer ();
		%feature("compactdefaultargs") SetFormat;
		%feature("autodoc", "	* Defines the file format for voxels. ASCII - slow and occupies more space on disk. BINARY - fast and occupies less space on disk.

	:param format:
	:type format: Voxel_VoxelFileFormat
	:rtype: None
") SetFormat;
		void SetFormat (const Voxel_VoxelFileFormat format);
		%feature("compactdefaultargs") SetVoxels;
		%feature("autodoc", "	* Defines the voxels (1bit).

	:param voxels:
	:type voxels: Voxel_BoolDS &
	:rtype: None
") SetVoxels;
		void SetVoxels (const Voxel_BoolDS & voxels);
		%feature("compactdefaultargs") SetVoxels;
		%feature("autodoc", "	* Defines the voxels (4bit).

	:param voxels:
	:type voxels: Voxel_ColorDS &
	:rtype: None
") SetVoxels;
		void SetVoxels (const Voxel_ColorDS & voxels);
		%feature("compactdefaultargs") SetVoxels;
		%feature("autodoc", "	* Defines the voxels (4bytes).

	:param voxels:
	:type voxels: Voxel_FloatDS &
	:rtype: None
") SetVoxels;
		void SetVoxels (const Voxel_FloatDS & voxels);
		%feature("compactdefaultargs") Write;
		%feature("autodoc", "	* Writes the voxels on disk using the defined format and file name.

	:param file:
	:type file: TCollection_ExtendedString &
	:rtype: bool
") Write;
		Standard_Boolean Write (const TCollection_ExtendedString & file);
};


%extend Voxel_Writer {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_BoolDS;
class Voxel_BoolDS : public Voxel_DS {
	public:
		%feature("compactdefaultargs") Voxel_BoolDS;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_BoolDS;
		 Voxel_BoolDS ();
		%feature("compactdefaultargs") Voxel_BoolDS;
		%feature("autodoc", "	* A constructor initializing the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: None
") Voxel_BoolDS;
		 Voxel_BoolDS (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialization of the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* A destructor of the voxel model.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") SetZero;
		%feature("autodoc", "	* The method sets all values equal to 0 (false) and releases the memory.

	:rtype: None
") SetZero;
		void SetZero ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Defines a value for voxel with co-ordinates (ix, iy, iz). Initial state of the model is so that all voxels have value 0 (false), and this data doesn't occupy memory. Memory for data is allocating during setting non-zero values (true).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param data: default value is Standard_True
	:type data: bool
	:rtype: None
") Set;
		void Set (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Boolean data = Standard_True);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the value of voxel with co-ordinates (ix, iy, iz).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: bool
") Get;
		Standard_Boolean Get (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);
};


%extend Voxel_BoolDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_ColorDS;
class Voxel_ColorDS : public Voxel_DS {
	public:
		%feature("compactdefaultargs") Voxel_ColorDS;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_ColorDS;
		 Voxel_ColorDS ();
		%feature("compactdefaultargs") Voxel_ColorDS;
		%feature("autodoc", "	* A constructor initializing the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: None
") Voxel_ColorDS;
		 Voxel_ColorDS (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialization of the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* A destructor of the voxel model.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") SetZero;
		%feature("autodoc", "	* The method sets all values equal to 0 (false) and releases the memory.

	:rtype: None
") SetZero;
		void SetZero ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Defines a value for voxel with co-ordinates (ix, iy, iz). Only the first four bits are used! Initial state of the model is so that all voxels have value 0x0000, and this data doesn't occupy memory. Memory for data is allocating during setting non-zero values (0x0101, for example).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param data:
	:type data: Standard_Byte
	:rtype: None
") Set;
		void Set (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Byte data);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the value of voxel with co-ordinates (ix, iy, iz).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: Standard_Byte
") Get;
		Standard_Byte Get (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);
};


%extend Voxel_ColorDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_FloatDS;
class Voxel_FloatDS : public Voxel_DS {
	public:
		%feature("compactdefaultargs") Voxel_FloatDS;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_FloatDS;
		 Voxel_FloatDS ();
		%feature("compactdefaultargs") Voxel_FloatDS;
		%feature("autodoc", "	* A constructor initializing the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: None
") Voxel_FloatDS;
		 Voxel_FloatDS (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialization of the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* A destructor of the voxel model.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") SetZero;
		%feature("autodoc", "	* The method sets all values equal to 0 (false) and releases the memory.

	:rtype: None
") SetZero;
		void SetZero ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Defines a value for voxel with co-ordinates (ix, iy, iz). Initial state of the model is so that all voxels have value 0.0f, and this data doesn't occupy memory. Memory for data is allocating during setting non-zero values.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param data:
	:type data: Standard_ShortReal
	:rtype: None
") Set;
		void Set (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_ShortReal data);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the value of voxel with co-ordinates (ix, iy, iz).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: Standard_ShortReal
") Get;
		Standard_ShortReal Get (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);
};


%extend Voxel_FloatDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_OctBoolDS;
class Voxel_OctBoolDS : public Voxel_DS {
	public:
		%feature("compactdefaultargs") Voxel_OctBoolDS;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_OctBoolDS;
		 Voxel_OctBoolDS ();
		%feature("compactdefaultargs") Voxel_OctBoolDS;
		%feature("autodoc", "	* A constructor initializing the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: None
") Voxel_OctBoolDS;
		 Voxel_OctBoolDS (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialization of the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* A destructor of the voxel model.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") SetZero;
		%feature("autodoc", "	* The method sets all values equal to 0 (false) and releases the memory.

	:rtype: None
") SetZero;
		void SetZero ();
		%feature("compactdefaultargs") OptimizeMemory;
		%feature("autodoc", "	* The method searches voxels with equal-value of sub-voxels and removes them (remaining the value for the voxel).

	:rtype: None
") OptimizeMemory;
		void OptimizeMemory ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Defines a value for voxel with co-ordinates (ix, iy, iz). If the voxel is split into 8 sub-voxels, the split disappears. Initial state of the model is so that all voxels have value 0 (false), and this data doesn't occupy memory. Memory for data is allocating during setting non-zero values (true).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param data:
	:type data: bool
	:rtype: None
") Set;
		void Set (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Boolean data);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Defines a value for a sub-voxel of a voxel with co-ordinates (ix, iy, iz). If the voxel is not split into 8 sub-voxels yet, this method splits the voxel. Range of sub-voxels is 0 - 7.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param ioct:
	:type ioct: int
	:param data:
	:type data: bool
	:rtype: None
") Set;
		void Set (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Integer ioct,const Standard_Boolean data);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the value of voxel with co-ordinates (ix, iy, iz). Warning!: the returned value may not coincide with the value of its 8 sub-voxels. Use the method ::IsSplit() to check whether a voxel has sub-voxels.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: bool
") Get;
		Standard_Boolean Get (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the value of a sub-voxel of a voxel with co-ordinates (ix, iy, iz). If the voxel is not split, it returns the value of the voxel. Range of sub-voxels is 0 - 7.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param ioct:
	:type ioct: int
	:rtype: bool
") Get;
		Standard_Boolean Get (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Integer ioct);
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "	* Returns true if the voxel is split into 8 sub-voxels.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: bool
") IsSplit;
		Standard_Boolean IsSplit (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);
};


%extend Voxel_OctBoolDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Voxel_ROctBoolDS;
class Voxel_ROctBoolDS : public Voxel_DS {
	public:
		%feature("compactdefaultargs") Voxel_ROctBoolDS;
		%feature("autodoc", "	* An empty constructor.

	:rtype: None
") Voxel_ROctBoolDS;
		 Voxel_ROctBoolDS ();
		%feature("compactdefaultargs") Voxel_ROctBoolDS;
		%feature("autodoc", "	* A constructor initializing the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: None
") Voxel_ROctBoolDS;
		 Voxel_ROctBoolDS (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initialization of the voxel model. (x, y, z) - the start point of the box. (x_len, y_len, z_len) - lengths in x, y and z directions along axes of a co-ordinate system. (nb_x, nb_y, nb_z) - number of splits (voxels) along x, y and z directions.

	:param x:
	:type x: float
	:param y:
	:type y: float
	:param z:
	:type z: float
	:param x_len:
	:type x_len: float
	:param y_len:
	:type y_len: float
	:param z_len:
	:type z_len: float
	:param nb_x:
	:type nb_x: int
	:param nb_y:
	:type nb_y: int
	:param nb_z:
	:type nb_z: int
	:rtype: void
") Init;
		virtual void Init (const Standard_Real x,const Standard_Real y,const Standard_Real z,const Standard_Real x_len,const Standard_Real y_len,const Standard_Real z_len,const Standard_Integer nb_x,const Standard_Integer nb_y,const Standard_Integer nb_z);
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* A destructor of the voxel model.

	:rtype: None
") Destroy;
		void Destroy ();
		%feature("compactdefaultargs") SetZero;
		%feature("autodoc", "	* The method sets all values equal to 0 (false) and releases the memory.

	:rtype: None
") SetZero;
		void SetZero ();
		%feature("compactdefaultargs") OptimizeMemory;
		%feature("autodoc", "	* The method searches voxels with equal-value of sub-voxels and removes them (remaining the value for the voxel).

	:rtype: None
") OptimizeMemory;
		void OptimizeMemory ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Defines a value for voxel with co-ordinates (ix, iy, iz). If the voxel is split into 8 sub-voxels, the split disappears. Initial state of the model is so that all voxels have value 0 (false), and this data doesn't occupy memory. Memory for data is allocating during setting non-zero values (true).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param data:
	:type data: bool
	:rtype: None
") Set;
		void Set (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Boolean data);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Defines a value for a sub-voxel of a voxel with co-ordinates (ix, iy, iz). If the voxel is not split into 8 sub-voxels yet, this method splits the voxel. Range of sub-voxels is 0 - 7.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param ioct1:
	:type ioct1: int
	:param data:
	:type data: bool
	:rtype: None
") Set;
		void Set (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Integer ioct1,const Standard_Boolean data);
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Defines a value for a sub-voxel of a sub-voxel of a voxel with co-ordinates (ix, iy, iz). If the voxel is not split into 8 sub-voxels yet, this method splits the voxel. Range of sub-voxels is 0 - 7.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param ioct1:
	:type ioct1: int
	:param ioct2:
	:type ioct2: int
	:param data:
	:type data: bool
	:rtype: None
") Set;
		void Set (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Integer ioct1,const Standard_Integer ioct2,const Standard_Boolean data);
		%feature("compactdefaultargs") IsSplit;
		%feature("autodoc", "	* Returns true if the voxel is split into 8 sub-voxels.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: bool
") IsSplit;
		Standard_Boolean IsSplit (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);
		%feature("compactdefaultargs") Deepness;
		%feature("autodoc", "	* Returns the deepness of splits of a voxel. 0 - no splits (::IsSplit() being called would return false). 1 - the voxel is split into 8 sub-voxels. 2 - the voxels is split into 8 sub-voxels, and each of the sub-voxels is split into 8 sub-sub-voxels. 3 - ...

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: int
") Deepness;
		Standard_Integer Deepness (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the value of voxel with co-ordinates (ix, iy, iz). Warning!: the returned value may not coincide with the value of its 8 sub-voxels. Use the method ::IsSplit() to check whether a voxel has sub-voxels.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:rtype: bool
") Get;
		Standard_Boolean Get (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the value of a sub-voxel of a voxel with co-ordinates (ix, iy, iz). If the voxel is not split, it returns the value of the voxel. Range of sub-voxels is 0 - 7.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param ioct1:
	:type ioct1: int
	:rtype: bool
") Get;
		Standard_Boolean Get (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Integer ioct1);
		%feature("compactdefaultargs") Get;
		%feature("autodoc", "	* Returns the value of a sub-voxel of a sub-voxel of a voxel with co-ordinates (ix, iy, iz). If the voxel is not split, it returns the value of the voxel. Range of sub-voxels is 0 - 7.

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param ioct1:
	:type ioct1: int
	:param ioct2:
	:type ioct2: int
	:rtype: bool
") Get;
		Standard_Boolean Get (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Integer ioct1,const Standard_Integer ioct2);
		%feature("compactdefaultargs") GetCenter;
		%feature("autodoc", "	* Returns the center point of a sub-voxel with co-ordinates (ix, iy, iz, i).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param i:
	:type i: int
	:param xc:
	:type xc: float &
	:param yc:
	:type yc: float &
	:param zc:
	:type zc: float &
	:rtype: None
") GetCenter;
		void GetCenter (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Integer i,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") GetCenter;
		%feature("autodoc", "	* Returns the center point of a sub-voxel with co-ordinates (ix, iy, iz, i, j).

	:param ix:
	:type ix: int
	:param iy:
	:type iy: int
	:param iz:
	:type iz: int
	:param i:
	:type i: int
	:param j:
	:type j: int
	:param xc:
	:type xc: float &
	:param yc:
	:type yc: float &
	:param zc:
	:type zc: float &
	:rtype: None
") GetCenter;
		void GetCenter (const Standard_Integer ix,const Standard_Integer iy,const Standard_Integer iz,const Standard_Integer i,const Standard_Integer j,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
};


%extend Voxel_ROctBoolDS {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
