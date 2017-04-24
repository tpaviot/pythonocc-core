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
%module (package="OCC") ShapeFix

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


%include ShapeFix_headers.i


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

%rename(shapefix) ShapeFix;
class ShapeFix {
	public:
		%feature("compactdefaultargs") SameParameter;
		%feature("autodoc", "	* Runs SameParameter from BRepLib with these adaptations : <enforce> forces computations, else they are made only on Edges with flag SameParameter false <preci>, if not precised, is taken for each EDge as its own Tolerance Returns True when done, False if an exception has been raised In case of exception anyway, as many edges as possible have been processed. The passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.

	:param shape:
	:type shape: TopoDS_Shape &
	:param enforce:
	:type enforce: bool
	:param preci: default value is 0.0
	:type preci: float
	:param theProgress: default value is 0
	:type theProgress: Handle_Message_ProgressIndicator &
	:param theMsgReg: default value is 0
	:type theMsgReg: Handle_ShapeExtend_BasicMsgRegistrator &
	:rtype: bool
") SameParameter;
		static Standard_Boolean SameParameter (const TopoDS_Shape & shape,const Standard_Boolean enforce,const Standard_Real preci = 0.0,const Handle_Message_ProgressIndicator & theProgress = 0,const Handle_ShapeExtend_BasicMsgRegistrator & theMsgReg = 0);
		%feature("compactdefaultargs") EncodeRegularity;
		%feature("autodoc", "	* Runs EncodeRegularity from BRepLib taking into account shared components of assemblies, so that each component is processed only once

	:param shape:
	:type shape: TopoDS_Shape &
	:param tolang: default value is 1.0e-10
	:type tolang: float
	:rtype: void
") EncodeRegularity;
		static void EncodeRegularity (const TopoDS_Shape & shape,const Standard_Real tolang = 1.0e-10);
		%feature("compactdefaultargs") RemoveSmallEdges;
		%feature("autodoc", "	* Removes edges which are less than given tolerance from shape with help of ShapeFix_Wire::FixSmall()

	:param shape:
	:type shape: TopoDS_Shape &
	:param Tolerance:
	:type Tolerance: float
	:param context:
	:type context: Handle_ShapeBuild_ReShape &
	:rtype: TopoDS_Shape
") RemoveSmallEdges;
		static TopoDS_Shape RemoveSmallEdges (TopoDS_Shape & shape,const Standard_Real Tolerance,Handle_ShapeBuild_ReShape & context);
		%feature("compactdefaultargs") FixVertexPosition;
		%feature("autodoc", "	* Fix position of the vertices having tolerance more tnan specified one.;

	:param theshape:
	:type theshape: TopoDS_Shape &
	:param theTolerance:
	:type theTolerance: float
	:param thecontext:
	:type thecontext: Handle_ShapeBuild_ReShape &
	:rtype: bool
") FixVertexPosition;
		static Standard_Boolean FixVertexPosition (TopoDS_Shape & theshape,const Standard_Real theTolerance,const Handle_ShapeBuild_ReShape & thecontext);
		%feature("compactdefaultargs") LeastEdgeSize;
		%feature("autodoc", "	* Calculate size of least edge;

	:param theshape:
	:type theshape: TopoDS_Shape &
	:rtype: float
") LeastEdgeSize;
		static Standard_Real LeastEdgeSize (TopoDS_Shape & theshape);
};


%extend ShapeFix {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d;
class ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d : public TCollection_BasicMapIterator {
	public:
		%feature("compactdefaultargs") ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d;
		%feature("autodoc", "	:rtype: None
") ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d;
		 ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d ();
		%feature("compactdefaultargs") ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d;
		%feature("autodoc", "	:param aMap:
	:type aMap: ShapeFix_DataMapOfShapeBox2d &
	:rtype: None
") ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d;
		 ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d (const ShapeFix_DataMapOfShapeBox2d & aMap);
		%feature("compactdefaultargs") Initialize;
		%feature("autodoc", "	:param aMap:
	:type aMap: ShapeFix_DataMapOfShapeBox2d &
	:rtype: None
") Initialize;
		void Initialize (const ShapeFix_DataMapOfShapeBox2d & aMap);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		const TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Bnd_Box2d
") Value;
		const Bnd_Box2d & Value ();
};


%extend ShapeFix_DataMapIteratorOfDataMapOfShapeBox2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_DataMapNodeOfDataMapOfShapeBox2d;
class ShapeFix_DataMapNodeOfDataMapOfShapeBox2d : public TCollection_MapNode {
	public:
		%feature("compactdefaultargs") ShapeFix_DataMapNodeOfDataMapOfShapeBox2d;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Bnd_Box2d &
	:param n:
	:type n: TCollection_MapNodePtr &
	:rtype: None
") ShapeFix_DataMapNodeOfDataMapOfShapeBox2d;
		 ShapeFix_DataMapNodeOfDataMapOfShapeBox2d (const TopoDS_Shape & K,const Bnd_Box2d & I,const TCollection_MapNodePtr & n);
		%feature("compactdefaultargs") Key;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Key;
		TopoDS_Shape  Key ();
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: Bnd_Box2d
") Value;
		Bnd_Box2d & Value ();
};


%extend ShapeFix_DataMapNodeOfDataMapOfShapeBox2d {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d::Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d;
class Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d : public Handle_TCollection_MapNode {

    public:
        // constructors
        Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d();
        Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d(const Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d &aHandle);
        Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d(const ShapeFix_DataMapNodeOfDataMapOfShapeBox2d *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d {
    ShapeFix_DataMapNodeOfDataMapOfShapeBox2d* _get_reference() {
    return (ShapeFix_DataMapNodeOfDataMapOfShapeBox2d*)$self->Access();
    }
};

%extend Handle_ShapeFix_DataMapNodeOfDataMapOfShapeBox2d {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_DataMapNodeOfDataMapOfShapeBox2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_DataMapOfShapeBox2d;
class ShapeFix_DataMapOfShapeBox2d : public TCollection_BasicMap {
	public:
		%feature("compactdefaultargs") ShapeFix_DataMapOfShapeBox2d;
		%feature("autodoc", "	:param NbBuckets: default value is 1
	:type NbBuckets: int
	:rtype: None
") ShapeFix_DataMapOfShapeBox2d;
		 ShapeFix_DataMapOfShapeBox2d (const Standard_Integer NbBuckets = 1);
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ShapeFix_DataMapOfShapeBox2d &
	:rtype: ShapeFix_DataMapOfShapeBox2d
") Assign;
		ShapeFix_DataMapOfShapeBox2d & Assign (const ShapeFix_DataMapOfShapeBox2d & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ShapeFix_DataMapOfShapeBox2d &
	:rtype: ShapeFix_DataMapOfShapeBox2d
") operator =;
		ShapeFix_DataMapOfShapeBox2d & operator = (const ShapeFix_DataMapOfShapeBox2d & Other);
		%feature("compactdefaultargs") ReSize;
		%feature("autodoc", "	:param NbBuckets:
	:type NbBuckets: int
	:rtype: None
") ReSize;
		void ReSize (const Standard_Integer NbBuckets);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Bind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:param I:
	:type I: Bnd_Box2d &
	:rtype: bool
") Bind;
		Standard_Boolean Bind (const TopoDS_Shape & K,const Bnd_Box2d & I);
		%feature("compactdefaultargs") IsBound;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") IsBound;
		Standard_Boolean IsBound (const TopoDS_Shape & K);
		%feature("compactdefaultargs") UnBind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: bool
") UnBind;
		Standard_Boolean UnBind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Bnd_Box2d
") Find;
		const Bnd_Box2d & Find (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Bnd_Box2d
") ChangeFind;
		Bnd_Box2d & ChangeFind (const TopoDS_Shape & K);
		%feature("compactdefaultargs") Find1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") Find1;
		Standard_Address Find1 (const TopoDS_Shape & K);
		%feature("compactdefaultargs") ChangeFind1;
		%feature("autodoc", "	:param K:
	:type K: TopoDS_Shape &
	:rtype: Standard_Address
") ChangeFind1;
		Standard_Address ChangeFind1 (const TopoDS_Shape & K);
};


%extend ShapeFix_DataMapOfShapeBox2d {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_Edge;
class ShapeFix_Edge : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeFix_Edge;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") ShapeFix_Edge;
		 ShapeFix_Edge ();
		%feature("compactdefaultargs") Projector;
		%feature("autodoc", "	* Returns the projector used for recomputing missing pcurves Can be used for adjusting parameters of projector

	:rtype: Handle_ShapeConstruct_ProjectCurveOnSurface
") Projector;
		Handle_ShapeConstruct_ProjectCurveOnSurface Projector ();
		%feature("compactdefaultargs") FixRemovePCurve;
		%feature("autodoc", "	:param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:rtype: bool
") FixRemovePCurve;
		Standard_Boolean FixRemovePCurve (const TopoDS_Edge & edge,const TopoDS_Face & face);
		%feature("compactdefaultargs") FixRemovePCurve;
		%feature("autodoc", "	* Removes the pcurve(s) of the edge if it does not match the vertices Check is done Use : It is to be called when pcurve of an edge can be wrong (e.g., after import from IGES) Returns: True, if does not match, removed (status DONE) False, (status OK) if matches or (status FAIL) if no pcurve, nothing done

	:param edge:
	:type edge: TopoDS_Edge &
	:param surface:
	:type surface: Handle_Geom_Surface &
	:param location:
	:type location: TopLoc_Location &
	:rtype: bool
") FixRemovePCurve;
		Standard_Boolean FixRemovePCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location);
		%feature("compactdefaultargs") FixRemoveCurve3d;
		%feature("autodoc", "	* Removes 3d curve of the edge if it does not match the vertices Returns: True, if does not match, removed (status DONE) False, (status OK) if matches or (status FAIL) if no 3d curve, nothing done

	:param edge:
	:type edge: TopoDS_Edge &
	:rtype: bool
") FixRemoveCurve3d;
		Standard_Boolean FixRemoveCurve3d (const TopoDS_Edge & edge);
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "	* See method below for information

	:param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:param isSeam:
	:type isSeam: bool
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool
") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Boolean isSeam,const Standard_Real prec = 0.0);
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "	* See method below for information

	:param edge:
	:type edge: TopoDS_Edge &
	:param surface:
	:type surface: Handle_Geom_Surface &
	:param location:
	:type location: TopLoc_Location &
	:param isSeam:
	:type isSeam: bool
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool
") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location,const Standard_Boolean isSeam,const Standard_Real prec = 0.0);
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "	* See method below for information

	:param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:param isSeam:
	:type isSeam: bool
	:param surfana:
	:type surfana: Handle_ShapeAnalysis_Surface &
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool
") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const TopoDS_Face & face,const Standard_Boolean isSeam,const Handle_ShapeAnalysis_Surface & surfana,const Standard_Real prec = 0.0);
		%feature("compactdefaultargs") FixAddPCurve;
		%feature("autodoc", "	* Adds pcurve(s) of the edge if missing (by projecting 3d curve) Parameter isSeam indicates if the edge is a seam. The parameter <prec> defines the precision for calculations. If it is 0 (default), the tolerance of the edge is taken. Remark : This method is rather for internal use since it accepts parameter <surfana> for optimization of computations Use : It is to be called after FixRemovePCurve (if removed) or in any case when edge can have no pcurve Returns: True if pcurve was added, else False Status : OK : Pcurve exists FAIL1: No 3d curve FAIL2: fail during projecting DONE1: Pcurve was added DONE2: specific case of pcurve going through degenerated point on sphere encountered during projection (see class ShapeConstruct_ProjectCurveOnSurface for more info)

	:param edge:
	:type edge: TopoDS_Edge &
	:param surface:
	:type surface: Handle_Geom_Surface &
	:param location:
	:type location: TopLoc_Location &
	:param isSeam:
	:type isSeam: bool
	:param surfana:
	:type surfana: Handle_ShapeAnalysis_Surface &
	:param prec: default value is 0.0
	:type prec: float
	:rtype: bool
") FixAddPCurve;
		Standard_Boolean FixAddPCurve (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location,const Standard_Boolean isSeam,const Handle_ShapeAnalysis_Surface & surfana,const Standard_Real prec = 0.0);
		%feature("compactdefaultargs") FixAddCurve3d;
		%feature("autodoc", "	* Tries to build 3d curve of the edge if missing Use : It is to be called after FixRemoveCurve3d (if removed) or in any case when edge can have no 3d curve Returns: True if 3d curve was added, else False Status : OK : 3d curve exists FAIL1: BRepLib::BuildCurve3d() has failed DONE1: 3d curve was added

	:param edge:
	:type edge: TopoDS_Edge &
	:rtype: bool
") FixAddCurve3d;
		Standard_Boolean FixAddCurve3d (const TopoDS_Edge & edge);
		%feature("compactdefaultargs") FixVertexTolerance;
		%feature("autodoc", "	:param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:rtype: bool
") FixVertexTolerance;
		Standard_Boolean FixVertexTolerance (const TopoDS_Edge & edge,const TopoDS_Face & face);
		%feature("compactdefaultargs") FixVertexTolerance;
		%feature("autodoc", "	* Increases the tolerances of the edge vertices to comprise the ends of 3d curve and pcurve on the given face (first method) or all pcurves stored in an edge (second one) Returns: True, if tolerances have been increased, otherwise False Status: OK : the original tolerances have not been changed DONE1: the tolerance of first vertex has been increased DONE2: the tolerance of last vertex has been increased

	:param edge:
	:type edge: TopoDS_Edge &
	:rtype: bool
") FixVertexTolerance;
		Standard_Boolean FixVertexTolerance (const TopoDS_Edge & edge);
		%feature("compactdefaultargs") FixReversed2d;
		%feature("autodoc", "	:param edge:
	:type edge: TopoDS_Edge &
	:param face:
	:type face: TopoDS_Face &
	:rtype: bool
") FixReversed2d;
		Standard_Boolean FixReversed2d (const TopoDS_Edge & edge,const TopoDS_Face & face);
		%feature("compactdefaultargs") FixReversed2d;
		%feature("autodoc", "	* Fixes edge if pcurve is directed opposite to 3d curve Check is done by call to the function ShapeAnalysis_Edge::CheckCurve3dWithPCurve() Warning: For seam edge this method will check and fix the pcurve in only one direction. Hence, it should be called twice for seam edge: once with edge orientation FORWARD and once with REVERSED. Returns: False if nothing done, True if reversed (status DONE) Status: OK - pcurve OK, nothing done FAIL1 - no pcurve FAIL2 - no 3d curve DONE1 - pcurve was reversed

	:param edge:
	:type edge: TopoDS_Edge &
	:param surface:
	:type surface: Handle_Geom_Surface &
	:param location:
	:type location: TopLoc_Location &
	:rtype: bool
") FixReversed2d;
		Standard_Boolean FixReversed2d (const TopoDS_Edge & edge,const Handle_Geom_Surface & surface,const TopLoc_Location & location);
		%feature("compactdefaultargs") FixSameParameter;
		%feature("autodoc", "	* Tries to make edge SameParameter and sets corresponding tolerance and SameParameter flag. First, it makes edge same range if SameRange flag is not set. //! If flag SameParameter is set, this method calls the function ShapeAnalysis_Edge::CheckSameParameter() that calculates the maximal deviation of pcurves of the edge from its 3d curve. If deviation > tolerance, the tolerance of edge is increased to a value of deviation. If deviation < tolerance nothing happens. //! If flag SameParameter is not set, this method chooses the best variant (one that has minimal tolerance), either a. only after computing deviation (as above) or b. after calling standard procedure BRepLib::SameParameter and computing deviation (as above). If <tolerance> > 0, it is used as parameter for BRepLib::SameParameter, otherwise, tolerance of the edge is used. //! Use : Is to be called after all pcurves and 3d curve of the edge are correctly computed Remark : SameParameter flag is always set to True after this method Returns: True, if something done, else False Status : OK - edge was initially SameParameter, nothing is done FAIL1 - computation of deviation of pcurves from 3d curve has failed FAIL2 - BRepLib::SameParameter() has failed DONE1 - tolerance of the edge was increased DONE2 - flag SameParameter was set to True (only if BRepLib::SameParameter() did not set it) DONE3 - edge was modified by BRepLib::SameParameter() to SameParameter DONE4 - not used anymore DONE5 - if the edge resulting from BRepLib has been chosen, i.e. variant b. above (only for edges with not set SameParameter)

	:param edge:
	:type edge: TopoDS_Edge &
	:param tolerance: default value is 0.0
	:type tolerance: float
	:rtype: bool
") FixSameParameter;
		Standard_Boolean FixSameParameter (const TopoDS_Edge & edge,const Standard_Real tolerance = 0.0);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status (in the form of True/False) of last Fix

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
};


%extend ShapeFix_Edge {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_Edge(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_Edge::Handle_ShapeFix_Edge %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_Edge;
class Handle_ShapeFix_Edge : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeFix_Edge();
        Handle_ShapeFix_Edge(const Handle_ShapeFix_Edge &aHandle);
        Handle_ShapeFix_Edge(const ShapeFix_Edge *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Edge DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Edge {
    ShapeFix_Edge* _get_reference() {
    return (ShapeFix_Edge*)$self->Access();
    }
};

%extend Handle_ShapeFix_Edge {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_Edge {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_EdgeConnect;
class ShapeFix_EdgeConnect {
	public:
		%feature("compactdefaultargs") ShapeFix_EdgeConnect;
		%feature("autodoc", "	:rtype: None
") ShapeFix_EdgeConnect;
		 ShapeFix_EdgeConnect ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds information on connectivity between start vertex of second edge and end vertex of first edge, taking edges orientation into account

	:param aFirst:
	:type aFirst: TopoDS_Edge &
	:param aSecond:
	:type aSecond: TopoDS_Edge &
	:rtype: None
") Add;
		void Add (const TopoDS_Edge & aFirst,const TopoDS_Edge & aSecond);
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds connectivity information for the whole shape. Note: edges in wires must be well ordered Note: flag Closed should be set for closed wires

	:param aShape:
	:type aShape: TopoDS_Shape &
	:rtype: None
") Add;
		void Add (const TopoDS_Shape & aShape);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	* Builds shared vertices, updates their positions and tolerances

	:rtype: None
") Build;
		void Build ();
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears internal data structure

	:rtype: None
") Clear;
		void Clear ();
};


%extend ShapeFix_EdgeConnect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_EdgeProjAux;
class ShapeFix_EdgeProjAux : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeFix_EdgeProjAux;
		%feature("autodoc", "	:rtype: None
") ShapeFix_EdgeProjAux;
		 ShapeFix_EdgeProjAux ();
		%feature("compactdefaultargs") ShapeFix_EdgeProjAux;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") ShapeFix_EdgeProjAux;
		 ShapeFix_EdgeProjAux (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:param E:
	:type E: TopoDS_Edge &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & F,const TopoDS_Edge & E);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param preci:
	:type preci: float
	:rtype: None
") Compute;
		void Compute (const Standard_Real preci);
		%feature("compactdefaultargs") IsFirstDone;
		%feature("autodoc", "	:rtype: bool
") IsFirstDone;
		Standard_Boolean IsFirstDone ();
		%feature("compactdefaultargs") IsLastDone;
		%feature("autodoc", "	:rtype: bool
") IsLastDone;
		Standard_Boolean IsLastDone ();
		%feature("compactdefaultargs") FirstParam;
		%feature("autodoc", "	:rtype: float
") FirstParam;
		Standard_Real FirstParam ();
		%feature("compactdefaultargs") LastParam;
		%feature("autodoc", "	:rtype: float
") LastParam;
		Standard_Real LastParam ();
		%feature("compactdefaultargs") IsIso;
		%feature("autodoc", "	:param C:
	:type C: Handle_Geom2d_Curve &
	:rtype: bool
") IsIso;
		Standard_Boolean IsIso (const Handle_Geom2d_Curve & C);
};


%extend ShapeFix_EdgeProjAux {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_EdgeProjAux(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_EdgeProjAux::Handle_ShapeFix_EdgeProjAux %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_EdgeProjAux;
class Handle_ShapeFix_EdgeProjAux : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeFix_EdgeProjAux();
        Handle_ShapeFix_EdgeProjAux(const Handle_ShapeFix_EdgeProjAux &aHandle);
        Handle_ShapeFix_EdgeProjAux(const ShapeFix_EdgeProjAux *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_EdgeProjAux DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_EdgeProjAux {
    ShapeFix_EdgeProjAux* _get_reference() {
    return (ShapeFix_EdgeProjAux*)$self->Access();
    }
};

%extend Handle_ShapeFix_EdgeProjAux {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_EdgeProjAux {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_FaceConnect;
class ShapeFix_FaceConnect {
	public:
		%feature("compactdefaultargs") ShapeFix_FaceConnect;
		%feature("autodoc", "	:rtype: None
") ShapeFix_FaceConnect;
		 ShapeFix_FaceConnect ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	:param aFirst:
	:type aFirst: TopoDS_Face &
	:param aSecond:
	:type aSecond: TopoDS_Face &
	:rtype: bool
") Add;
		Standard_Boolean Add (const TopoDS_Face & aFirst,const TopoDS_Face & aSecond);
		%feature("compactdefaultargs") Build;
		%feature("autodoc", "	:param shell:
	:type shell: TopoDS_Shell &
	:param sewtoler:
	:type sewtoler: float
	:param fixtoler:
	:type fixtoler: float
	:rtype: TopoDS_Shell
") Build;
		TopoDS_Shell Build (const TopoDS_Shell & shell,const Standard_Real sewtoler,const Standard_Real fixtoler);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears internal data structure

	:rtype: None
") Clear;
		void Clear ();
};


%extend ShapeFix_FaceConnect {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_FreeBounds;
class ShapeFix_FreeBounds {
	public:
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds ();
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "	* Builds forecasting free bounds of the <shape> and connects open wires with tolerance <closetoler>. <shape> should be a compound of faces. Tolerance <closetoler> should be greater than tolerance <sewtoler> used for initializing sewing analyzer, otherwise connection of open wires is not performed.

	:param shape:
	:type shape: TopoDS_Shape &
	:param sewtoler:
	:type sewtoler: float
	:param closetoler:
	:type closetoler: float
	:param splitclosed:
	:type splitclosed: bool
	:param splitopen:
	:type splitopen: bool
	:rtype: None
") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds (const TopoDS_Shape & shape,const Standard_Real sewtoler,const Standard_Real closetoler,const Standard_Boolean splitclosed,const Standard_Boolean splitopen);
		%feature("compactdefaultargs") ShapeFix_FreeBounds;
		%feature("autodoc", "	* Builds actual free bounds of the <shape> and connects open wires with tolerance <closetoler>. <shape> should be a compound of shells.

	:param shape:
	:type shape: TopoDS_Shape &
	:param closetoler:
	:type closetoler: float
	:param splitclosed:
	:type splitclosed: bool
	:param splitopen:
	:type splitopen: bool
	:rtype: None
") ShapeFix_FreeBounds;
		 ShapeFix_FreeBounds (const TopoDS_Shape & shape,const Standard_Real closetoler,const Standard_Boolean splitclosed,const Standard_Boolean splitopen);
		%feature("compactdefaultargs") GetClosedWires;
		%feature("autodoc", "	* Returns compound of closed wires out of free edges.

	:rtype: TopoDS_Compound
") GetClosedWires;
		const TopoDS_Compound  GetClosedWires ();
		%feature("compactdefaultargs") GetOpenWires;
		%feature("autodoc", "	* Returns compound of open wires out of free edges.

	:rtype: TopoDS_Compound
") GetOpenWires;
		const TopoDS_Compound  GetOpenWires ();
		%feature("compactdefaultargs") GetShape;
		%feature("autodoc", "	* Returns modified source shape.

	:rtype: TopoDS_Shape
") GetShape;
		const TopoDS_Shape  GetShape ();
};


%extend ShapeFix_FreeBounds {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_IntersectionTool;
class ShapeFix_IntersectionTool {
	public:
		%feature("compactdefaultargs") ShapeFix_IntersectionTool;
		%feature("autodoc", "	* Constructor

	:param context:
	:type context: Handle_ShapeBuild_ReShape &
	:param preci:
	:type preci: float
	:param maxtol: default value is 1.0
	:type maxtol: float
	:rtype: None
") ShapeFix_IntersectionTool;
		 ShapeFix_IntersectionTool (const Handle_ShapeBuild_ReShape & context,const Standard_Real preci,const Standard_Real maxtol = 1.0);
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	* Returns context

	:rtype: Handle_ShapeBuild_ReShape
") Context;
		Handle_ShapeBuild_ReShape Context ();
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "	* Split edge on two new edges using new vertex 'vert' and 'param' - parameter for splitting The 'face' is necessary for pcurves and using TransferParameterProj

	:param edge:
	:type edge: TopoDS_Edge &
	:param param:
	:type param: float
	:param vert:
	:type vert: TopoDS_Vertex &
	:param face:
	:type face: TopoDS_Face &
	:param newE1:
	:type newE1: TopoDS_Edge &
	:param newE2:
	:type newE2: TopoDS_Edge &
	:param preci:
	:type preci: float
	:rtype: bool
") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real param,const TopoDS_Vertex & vert,const TopoDS_Face & face,TopoDS_Edge & newE1,TopoDS_Edge & newE2,const Standard_Real preci);
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "	* Cut edge by parameters pend and cut

	:param edge:
	:type edge: TopoDS_Edge &
	:param pend:
	:type pend: float
	:param cut:
	:type cut: float
	:param face:
	:type face: TopoDS_Face &
	:param iscutline:
	:type iscutline: bool
	:rtype: bool
") CutEdge;
		Standard_Boolean CutEdge (const TopoDS_Edge & edge,const Standard_Real pend,const Standard_Real cut,const TopoDS_Face & face,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") FixSelfIntersectWire;
		%feature("autodoc", "	:param sewd:
	:type sewd: Handle_ShapeExtend_WireData &
	:param face:
	:type face: TopoDS_Face &
	:param NbSplit:
	:type NbSplit: int &
	:param NbCut:
	:type NbCut: int &
	:param NbRemoved:
	:type NbRemoved: int &
	:rtype: bool
") FixSelfIntersectWire;
		Standard_Boolean FixSelfIntersectWire (Handle_ShapeExtend_WireData & sewd,const TopoDS_Face & face,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") FixIntersectingWires;
		%feature("autodoc", "	:param face:
	:type face: TopoDS_Face &
	:rtype: bool
") FixIntersectingWires;
		Standard_Boolean FixIntersectingWires (TopoDS_Face & face);
};


%extend ShapeFix_IntersectionTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_Root;
class ShapeFix_Root : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") ShapeFix_Root;
		%feature("autodoc", "	* Empty Constructor (no context is created)

	:rtype: None
") ShapeFix_Root;
		 ShapeFix_Root ();
		%feature("compactdefaultargs") Set;
		%feature("autodoc", "	* Copy all fields from another Root object

	:param Root:
	:type Root: Handle_ShapeFix_Root &
	:rtype: void
") Set;
		virtual void Set (const Handle_ShapeFix_Root & Root);
		%feature("compactdefaultargs") SetContext;
		%feature("autodoc", "	* Sets context

	:param context:
	:type context: Handle_ShapeBuild_ReShape &
	:rtype: void
") SetContext;
		virtual void SetContext (const Handle_ShapeBuild_ReShape & context);
		%feature("compactdefaultargs") Context;
		%feature("autodoc", "	* Returns context

	:rtype: Handle_ShapeBuild_ReShape
") Context;
		Handle_ShapeBuild_ReShape Context ();
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "	* Sets message registrator

	:param msgreg:
	:type msgreg: Handle_ShapeExtend_BasicMsgRegistrator &
	:rtype: void
") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("compactdefaultargs") MsgRegistrator;
		%feature("autodoc", "	* Returns message registrator

	:rtype: Handle_ShapeExtend_BasicMsgRegistrator
") MsgRegistrator;
		Handle_ShapeExtend_BasicMsgRegistrator MsgRegistrator ();
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	* Sets basic precision value

	:param preci:
	:type preci: float
	:rtype: void
") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);
		%feature("compactdefaultargs") Precision;
		%feature("autodoc", "	* Returns basic precision value

	:rtype: float
") Precision;
		Standard_Real Precision ();
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "	* Sets minimal allowed tolerance

	:param mintol:
	:type mintol: float
	:rtype: void
") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);
		%feature("compactdefaultargs") MinTolerance;
		%feature("autodoc", "	* Returns minimal allowed tolerance

	:rtype: float
") MinTolerance;
		Standard_Real MinTolerance ();
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "	* Sets maximal allowed tolerance

	:param maxtol:
	:type maxtol: float
	:rtype: void
") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);
		%feature("compactdefaultargs") MaxTolerance;
		%feature("autodoc", "	* Returns maximal allowed tolerance

	:rtype: float
") MaxTolerance;
		Standard_Real MaxTolerance ();
		%feature("compactdefaultargs") LimitTolerance;
		%feature("autodoc", "	* Returns tolerance limited by [myMinTol,myMaxTol]

	:param toler:
	:type toler: float
	:rtype: float
") LimitTolerance;
		Standard_Real LimitTolerance (const Standard_Real toler);
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "	* Sends a message to be attached to the shape. Calls corresponding message of message registrator.

	:param shape:
	:type shape: TopoDS_Shape &
	:param message:
	:type message: Message_Msg &
	:param gravity: default value is Message_Info
	:type gravity: Message_Gravity
	:rtype: None
") SendMsg;
		void SendMsg (const TopoDS_Shape & shape,const Message_Msg & message,const Message_Gravity gravity = Message_Info);
		%feature("compactdefaultargs") SendMsg;
		%feature("autodoc", "	* Sends a message to be attached to myShape. Calls previous method.

	:param message:
	:type message: Message_Msg &
	:param gravity: default value is Message_Info
	:type gravity: Message_Gravity
	:rtype: None
") SendMsg;
		void SendMsg (const Message_Msg & message,const Message_Gravity gravity = Message_Info);
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "	* Sends a warning to be attached to the shape. Calls SendMsg with gravity set to Message_Warning.

	:param shape:
	:type shape: TopoDS_Shape &
	:param message:
	:type message: Message_Msg &
	:rtype: None
") SendWarning;
		void SendWarning (const TopoDS_Shape & shape,const Message_Msg & message);
		%feature("compactdefaultargs") SendWarning;
		%feature("autodoc", "	* Calls previous method for myShape.

	:param message:
	:type message: Message_Msg &
	:rtype: None
") SendWarning;
		void SendWarning (const Message_Msg & message);
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "	* Sends a fail to be attached to the shape. Calls SendMsg with gravity set to Message_Fail.

	:param shape:
	:type shape: TopoDS_Shape &
	:param message:
	:type message: Message_Msg &
	:rtype: None
") SendFail;
		void SendFail (const TopoDS_Shape & shape,const Message_Msg & message);
		%feature("compactdefaultargs") SendFail;
		%feature("autodoc", "	* Calls previous method for myShape.

	:param message:
	:type message: Message_Msg &
	:rtype: None
") SendFail;
		void SendFail (const Message_Msg & message);
};


%extend ShapeFix_Root {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_Root(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_Root::Handle_ShapeFix_Root %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_Root;
class Handle_ShapeFix_Root : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_ShapeFix_Root();
        Handle_ShapeFix_Root(const Handle_ShapeFix_Root &aHandle);
        Handle_ShapeFix_Root(const ShapeFix_Root *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Root DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Root {
    ShapeFix_Root* _get_reference() {
    return (ShapeFix_Root*)$self->Access();
    }
};

%extend Handle_ShapeFix_Root {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_Root {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_SequenceNodeOfSequenceOfWireSegment;
class ShapeFix_SequenceNodeOfSequenceOfWireSegment : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") ShapeFix_SequenceNodeOfSequenceOfWireSegment;
		%feature("autodoc", "	:param I:
	:type I: ShapeFix_WireSegment &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") ShapeFix_SequenceNodeOfSequenceOfWireSegment;
		 ShapeFix_SequenceNodeOfSequenceOfWireSegment (const ShapeFix_WireSegment & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: ShapeFix_WireSegment
") Value;
		ShapeFix_WireSegment & Value ();
};


%extend ShapeFix_SequenceNodeOfSequenceOfWireSegment {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment::Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment;
class Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment();
        Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment(const Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment &aHandle);
        Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment(const ShapeFix_SequenceNodeOfSequenceOfWireSegment *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment {
    ShapeFix_SequenceNodeOfSequenceOfWireSegment* _get_reference() {
    return (ShapeFix_SequenceNodeOfSequenceOfWireSegment*)$self->Access();
    }
};

%extend Handle_ShapeFix_SequenceNodeOfSequenceOfWireSegment {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_SequenceNodeOfSequenceOfWireSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_SequenceOfWireSegment;
class ShapeFix_SequenceOfWireSegment : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") ShapeFix_SequenceOfWireSegment;
		%feature("autodoc", "	:rtype: None
") ShapeFix_SequenceOfWireSegment;
		 ShapeFix_SequenceOfWireSegment ();
		%feature("compactdefaultargs") ShapeFix_SequenceOfWireSegment;
		%feature("autodoc", "	:param Other:
	:type Other: ShapeFix_SequenceOfWireSegment &
	:rtype: None
") ShapeFix_SequenceOfWireSegment;
		 ShapeFix_SequenceOfWireSegment (const ShapeFix_SequenceOfWireSegment & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: ShapeFix_SequenceOfWireSegment &
	:rtype: ShapeFix_SequenceOfWireSegment
") Assign;
		const ShapeFix_SequenceOfWireSegment & Assign (const ShapeFix_SequenceOfWireSegment & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: ShapeFix_SequenceOfWireSegment &
	:rtype: ShapeFix_SequenceOfWireSegment
") operator =;
		const ShapeFix_SequenceOfWireSegment & operator = (const ShapeFix_SequenceOfWireSegment & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: ShapeFix_WireSegment &
	:rtype: None
") Append;
		void Append (const ShapeFix_WireSegment & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: ShapeFix_SequenceOfWireSegment &
	:rtype: None
") Append;
		void Append (ShapeFix_SequenceOfWireSegment & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: ShapeFix_WireSegment &
	:rtype: None
") Prepend;
		void Prepend (const ShapeFix_WireSegment & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: ShapeFix_SequenceOfWireSegment &
	:rtype: None
") Prepend;
		void Prepend (ShapeFix_SequenceOfWireSegment & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: ShapeFix_WireSegment &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const ShapeFix_WireSegment & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ShapeFix_SequenceOfWireSegment &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,ShapeFix_SequenceOfWireSegment & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: ShapeFix_WireSegment &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const ShapeFix_WireSegment & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: ShapeFix_SequenceOfWireSegment &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,ShapeFix_SequenceOfWireSegment & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: ShapeFix_WireSegment
") First;
		const ShapeFix_WireSegment & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: ShapeFix_WireSegment
") Last;
		const ShapeFix_WireSegment & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: ShapeFix_SequenceOfWireSegment &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,ShapeFix_SequenceOfWireSegment & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: ShapeFix_WireSegment
") Value;
		const ShapeFix_WireSegment & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: ShapeFix_WireSegment &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const ShapeFix_WireSegment & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: ShapeFix_WireSegment
") ChangeValue;
		ShapeFix_WireSegment & ChangeValue (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer Index);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	:param FromIndex:
	:type FromIndex: int
	:param ToIndex:
	:type ToIndex: int
	:rtype: None
") Remove;
		void Remove (const Standard_Integer FromIndex,const Standard_Integer ToIndex);
};


%extend ShapeFix_SequenceOfWireSegment {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_ShapeTolerance;
class ShapeFix_ShapeTolerance {
	public:
		%feature("compactdefaultargs") ShapeFix_ShapeTolerance;
		%feature("autodoc", "	:rtype: None
") ShapeFix_ShapeTolerance;
		 ShapeFix_ShapeTolerance ();
		%feature("compactdefaultargs") LimitTolerance;
		%feature("autodoc", "	* Limits tolerances in a shape as follows : tmin = tmax -> as SetTolerance (forces) tmin = 0 -> maximum tolerance will be <tmax> tmax = 0 or not given (more generally, tmax < tmin) -> <tmax> ignored, minimum will be <tmin> else, maximum will be <max> and minimum will be <min> styp = VERTEX : only vertices are set styp = EDGE : only edges are set styp = FACE : only faces are set styp = WIRE : to have edges and their vertices set styp = other value : all (vertices,edges,faces) are set Returns True if at least one tolerance of the sub-shape has been modified

	:param shape:
	:type shape: TopoDS_Shape &
	:param tmin:
	:type tmin: float
	:param tmax: default value is 0.0
	:type tmax: float
	:param styp: default value is TopAbs_SHAPE
	:type styp: TopAbs_ShapeEnum
	:rtype: bool
") LimitTolerance;
		Standard_Boolean LimitTolerance (const TopoDS_Shape & shape,const Standard_Real tmin,const Standard_Real tmax = 0.0,const TopAbs_ShapeEnum styp = TopAbs_SHAPE);
		%feature("compactdefaultargs") SetTolerance;
		%feature("autodoc", "	* Sets (enforces) tolerances in a shape to the given value styp = VERTEX : only vertices are set styp = EDGE : only edges are set styp = FACE : only faces are set styp = WIRE : to have edges and their vertices set styp = other value : all (vertices,edges,faces) are set

	:param shape:
	:type shape: TopoDS_Shape &
	:param preci:
	:type preci: float
	:param styp: default value is TopAbs_SHAPE
	:type styp: TopAbs_ShapeEnum
	:rtype: None
") SetTolerance;
		void SetTolerance (const TopoDS_Shape & shape,const Standard_Real preci,const TopAbs_ShapeEnum styp = TopAbs_SHAPE);
};


%extend ShapeFix_ShapeTolerance {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_SplitTool;
class ShapeFix_SplitTool {
	public:
		%feature("compactdefaultargs") ShapeFix_SplitTool;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") ShapeFix_SplitTool;
		 ShapeFix_SplitTool ();
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "	* Split edge on two new edges using new vertex 'vert' and 'param' - parameter for splitting The 'face' is necessary for pcurves and using TransferParameterProj

	:param edge:
	:type edge: TopoDS_Edge &
	:param param:
	:type param: float
	:param vert:
	:type vert: TopoDS_Vertex &
	:param face:
	:type face: TopoDS_Face &
	:param newE1:
	:type newE1: TopoDS_Edge &
	:param newE2:
	:type newE2: TopoDS_Edge &
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: bool
") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real param,const TopoDS_Vertex & vert,const TopoDS_Face & face,TopoDS_Edge & newE1,TopoDS_Edge & newE2,const Standard_Real tol3d,const Standard_Real tol2d);
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "	* Split edge on two new edges using new vertex 'vert' and 'param1' and 'param2' - parameter for splitting and cutting The 'face' is necessary for pcurves and using TransferParameterProj

	:param edge:
	:type edge: TopoDS_Edge &
	:param param1:
	:type param1: float
	:param param2:
	:type param2: float
	:param vert:
	:type vert: TopoDS_Vertex &
	:param face:
	:type face: TopoDS_Face &
	:param newE1:
	:type newE1: TopoDS_Edge &
	:param newE2:
	:type newE2: TopoDS_Edge &
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: bool
") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real param1,const Standard_Real param2,const TopoDS_Vertex & vert,const TopoDS_Face & face,TopoDS_Edge & newE1,TopoDS_Edge & newE2,const Standard_Real tol3d,const Standard_Real tol2d);
		%feature("compactdefaultargs") CutEdge;
		%feature("autodoc", "	* Cut edge by parameters pend and cut

	:param edge:
	:type edge: TopoDS_Edge &
	:param pend:
	:type pend: float
	:param cut:
	:type cut: float
	:param face:
	:type face: TopoDS_Face &
	:param iscutline:
	:type iscutline: bool
	:rtype: bool
") CutEdge;
		Standard_Boolean CutEdge (const TopoDS_Edge & edge,const Standard_Real pend,const Standard_Real cut,const TopoDS_Face & face,Standard_Boolean &OutValue);
		%feature("compactdefaultargs") SplitEdge;
		%feature("autodoc", "	* Split edge on two new edges using two new vertex V1 and V2 and two parameters for splitting - fp and lp correspondingly The 'face' is necessary for pcurves and using TransferParameterProj aNum - number of edge in SeqE which corresponding to [fp,lp]

	:param edge:
	:type edge: TopoDS_Edge &
	:param fp:
	:type fp: float
	:param V1:
	:type V1: TopoDS_Vertex &
	:param lp:
	:type lp: float
	:param V2:
	:type V2: TopoDS_Vertex &
	:param face:
	:type face: TopoDS_Face &
	:param SeqE:
	:type SeqE: TopTools_SequenceOfShape &
	:param aNum:
	:type aNum: int &
	:param context:
	:type context: Handle_ShapeBuild_ReShape &
	:param tol3d:
	:type tol3d: float
	:param tol2d:
	:type tol2d: float
	:rtype: bool
") SplitEdge;
		Standard_Boolean SplitEdge (const TopoDS_Edge & edge,const Standard_Real fp,const TopoDS_Vertex & V1,const Standard_Real lp,const TopoDS_Vertex & V2,const TopoDS_Face & face,TopTools_SequenceOfShape & SeqE,Standard_Integer &OutValue,const Handle_ShapeBuild_ReShape & context,const Standard_Real tol3d,const Standard_Real tol2d);
};


%extend ShapeFix_SplitTool {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_WireVertex;
class ShapeFix_WireVertex {
	public:
		%feature("compactdefaultargs") ShapeFix_WireVertex;
		%feature("autodoc", "	:rtype: None
") ShapeFix_WireVertex;
		 ShapeFix_WireVertex ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Loads the wire, ininializes internal analyzer (ShapeAnalysis_WireVertex) with the given precision, and performs analysis

	:param wire:
	:type wire: TopoDS_Wire &
	:param preci:
	:type preci: float
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & wire,const Standard_Real preci);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Loads the wire, ininializes internal analyzer (ShapeAnalysis_WireVertex) with the given precision, and performs analysis

	:param sbwd:
	:type sbwd: Handle_ShapeExtend_WireData &
	:param preci:
	:type preci: float
	:rtype: None
") Init;
		void Init (const Handle_ShapeExtend_WireData & sbwd,const Standard_Real preci);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Loads all the data on wire, already analysed by ShapeAnalysis_WireVertex

	:param sawv:
	:type sawv: ShapeAnalysis_WireVertex &
	:rtype: None
") Init;
		void Init (const ShapeAnalysis_WireVertex & sawv);
		%feature("compactdefaultargs") Analyzer;
		%feature("autodoc", "	* returns internal analyzer

	:rtype: ShapeAnalysis_WireVertex
") Analyzer;
		const ShapeAnalysis_WireVertex & Analyzer ();
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "	* returns data on wire (fixed)

	:rtype: Handle_ShapeExtend_WireData
") WireData;
		Handle_ShapeExtend_WireData WireData ();
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	* returns resulting wire (fixed)

	:rtype: TopoDS_Wire
") Wire;
		TopoDS_Wire Wire ();
		%feature("compactdefaultargs") FixSame;
		%feature("autodoc", "	* Fixes 'Same' or 'Close' status (same vertex may be set, without changing parameters) Returns the count of fixed vertices, 0 if none

	:rtype: int
") FixSame;
		Standard_Integer FixSame ();
		%feature("compactdefaultargs") Fix;
		%feature("autodoc", "	* Fixes all statuses except 'Disjoined', i.e. the cases in which a common value has been set, with or without changing parameters Returns the count of fixed vertices, 0 if none

	:rtype: int
") Fix;
		Standard_Integer Fix ();
};


%extend ShapeFix_WireVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_ComposeShell;
class ShapeFix_ComposeShell : public ShapeFix_Root {
	public:
		%feature("compactdefaultargs") ShapeFix_ComposeShell;
		%feature("autodoc", "	* Creates empty tool.

	:rtype: None
") ShapeFix_ComposeShell;
		 ShapeFix_ComposeShell ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes with composite surface, face and precision. Here face defines both set of wires and way of getting pcurves. Precision is used (together with tolerance of edges) for handling subtle cases, such as tangential intersections.

	:param Grid:
	:type Grid: Handle_ShapeExtend_CompositeSurface &
	:param L:
	:type L: TopLoc_Location &
	:param Face:
	:type Face: TopoDS_Face &
	:param Prec:
	:type Prec: float
	:rtype: None
") Init;
		void Init (const Handle_ShapeExtend_CompositeSurface & Grid,const TopLoc_Location & L,const TopoDS_Face & Face,const Standard_Real Prec);

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetClosedMode() {
                return (Standard_Boolean) $self->ClosedMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetClosedMode(Standard_Boolean value ) {
                $self->ClosedMode()=value;
                }
            };
            		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs the work on already loaded data.

	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform ();
		%feature("compactdefaultargs") SplitEdges;
		%feature("autodoc", "	* Splits edges in the original shape by grid. This is a part of Perform() which does not produce any resulting shape; the only result is filled context where splittings are recorded. //! NOTE: If edge is splitted, it is replaced by wire, and order of edges in the wire corresponds to FORWARD orientation of the edge.

	:rtype: None
") SplitEdges;
		void SplitEdges ();
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Returns resulting shell or face (or Null shape if not done)

	:rtype: TopoDS_Shape
") Result;
		const TopoDS_Shape  Result ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Queries status of last call to Perform() OK : nothing done (some kind of error) DONE1: splitting is done, at least one new face created DONE2: splitting is done, several new faces obtained FAIL1: misoriented wire encountered (handled) FAIL2: recoverable parity error FAIL3: edge with no pcurve on supporting face FAIL4: unrecoverable algorithm error (parity check)

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("compactdefaultargs") DispatchWires;
		%feature("autodoc", "	* Creates new faces from the set of (closed) wires. Each wire is put on corresponding patch in the composite surface, and all pcurves on the initial (pseudo)face are reassigned to that surface. If several wires are one inside another, single face is created.

	:param faces:
	:type faces: TopTools_SequenceOfShape &
	:param wires:
	:type wires: ShapeFix_SequenceOfWireSegment &
	:rtype: None
") DispatchWires;
		void DispatchWires (TopTools_SequenceOfShape & faces,ShapeFix_SequenceOfWireSegment & wires);
		%feature("compactdefaultargs") SetTransferParamTool;
		%feature("autodoc", "	* Sets tool for transfer parameters from 3d to 2d and vice versa.

	:param TransferParam:
	:type TransferParam: Handle_ShapeAnalysis_TransferParameters &
	:rtype: None
") SetTransferParamTool;
		void SetTransferParamTool (const Handle_ShapeAnalysis_TransferParameters & TransferParam);
		%feature("compactdefaultargs") GetTransferParamTool;
		%feature("autodoc", "	* Gets tool for transfer parameters from 3d to 2d and vice versa.

	:rtype: Handle_ShapeAnalysis_TransferParameters
") GetTransferParamTool;
		Handle_ShapeAnalysis_TransferParameters GetTransferParamTool ();
};


%extend ShapeFix_ComposeShell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_ComposeShell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_ComposeShell::Handle_ShapeFix_ComposeShell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_ComposeShell;
class Handle_ShapeFix_ComposeShell : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_ComposeShell();
        Handle_ShapeFix_ComposeShell(const Handle_ShapeFix_ComposeShell &aHandle);
        Handle_ShapeFix_ComposeShell(const ShapeFix_ComposeShell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_ComposeShell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_ComposeShell {
    ShapeFix_ComposeShell* _get_reference() {
    return (ShapeFix_ComposeShell*)$self->Access();
    }
};

%extend Handle_ShapeFix_ComposeShell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_ComposeShell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_Face;
class ShapeFix_Face : public ShapeFix_Root {
	public:
		%feature("compactdefaultargs") ShapeFix_Face;
		%feature("autodoc", "	* Creates an empty tool

	:rtype: None
") ShapeFix_Face;
		 ShapeFix_Face ();
		%feature("compactdefaultargs") ShapeFix_Face;
		%feature("autodoc", "	* Creates a tool and loads a face

	:param face:
	:type face: TopoDS_Face &
	:rtype: None
") ShapeFix_Face;
		 ShapeFix_Face (const TopoDS_Face & face);
		%feature("compactdefaultargs") ClearModes;
		%feature("autodoc", "	* Sets all modes to default

	:rtype: void
") ClearModes;
		virtual void ClearModes ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Loads a whole face already created, with its wires, sense and location

	:param face:
	:type face: TopoDS_Face &
	:rtype: None
") Init;
		void Init (const TopoDS_Face & face);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Starts the creation of the face By default it will be FORWARD, or REVERSED if <fwd> is False

	:param surf:
	:type surf: Handle_Geom_Surface &
	:param preci:
	:type preci: float
	:param fwd: default value is Standard_True
	:type fwd: bool
	:rtype: None
") Init;
		void Init (const Handle_Geom_Surface & surf,const Standard_Real preci,const Standard_Boolean fwd = Standard_True);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Starts the creation of the face By default it will be FORWARD, or REVERSED if <fwd> is False

	:param surf:
	:type surf: Handle_ShapeAnalysis_Surface &
	:param preci:
	:type preci: float
	:param fwd: default value is Standard_True
	:type fwd: bool
	:rtype: None
") Init;
		void Init (const Handle_ShapeAnalysis_Surface & surf,const Standard_Real preci,const Standard_Boolean fwd = Standard_True);
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "	* Sets message registrator

	:param msgreg:
	:type msgreg: Handle_ShapeExtend_BasicMsgRegistrator &
	:rtype: void
") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	* Sets basic precision value (also to FixWireTool)

	:param preci:
	:type preci: float
	:rtype: void
") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "	* Sets minimal allowed tolerance (also to FixWireTool)

	:param mintol:
	:type mintol: float
	:rtype: void
") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "	* Sets maximal allowed tolerance (also to FixWireTool)

	:param maxtol:
	:type maxtol: float
	:rtype: void
") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixWireMode() {
                return (Standard_Integer) $self->FixWireMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixWireMode(Standard_Integer value ) {
                $self->FixWireMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixOrientationMode() {
                return (Standard_Integer) $self->FixOrientationMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixOrientationMode(Standard_Integer value ) {
                $self->FixOrientationMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixAddNaturalBoundMode() {
                return (Standard_Integer) $self->FixAddNaturalBoundMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixAddNaturalBoundMode(Standard_Integer value ) {
                $self->FixAddNaturalBoundMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixMissingSeamMode() {
                return (Standard_Integer) $self->FixMissingSeamMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixMissingSeamMode(Standard_Integer value ) {
                $self->FixMissingSeamMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixSmallAreaWireMode() {
                return (Standard_Integer) $self->FixSmallAreaWireMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixSmallAreaWireMode(Standard_Integer value ) {
                $self->FixSmallAreaWireMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetRemoveSmallAreaFaceMode() {
                return (Standard_Integer) $self->RemoveSmallAreaFaceMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetRemoveSmallAreaFaceMode(Standard_Integer value ) {
                $self->RemoveSmallAreaFaceMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixIntersectingWiresMode() {
                return (Standard_Integer) $self->FixIntersectingWiresMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixIntersectingWiresMode(Standard_Integer value ) {
                $self->FixIntersectingWiresMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixLoopWiresMode() {
                return (Standard_Integer) $self->FixLoopWiresMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixLoopWiresMode(Standard_Integer value ) {
                $self->FixLoopWiresMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixSplitFaceMode() {
                return (Standard_Integer) $self->FixSplitFaceMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixSplitFaceMode(Standard_Integer value ) {
                $self->FixSplitFaceMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetAutoCorrectPrecisionMode() {
                return (Standard_Integer) $self->AutoCorrectPrecisionMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetAutoCorrectPrecisionMode(Standard_Integer value ) {
                $self->AutoCorrectPrecisionMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixPeriodicDegeneratedMode() {
                return (Standard_Integer) $self->FixPeriodicDegeneratedMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixPeriodicDegeneratedMode(Standard_Integer value ) {
                $self->FixPeriodicDegeneratedMode()=value;
                }
            };
            		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* Returns a face which corresponds to the current state Warning: The finally produced face may be another one ... but with the same support

	:rtype: TopoDS_Face
") Face;
		TopoDS_Face Face ();
		%feature("compactdefaultargs") Result;
		%feature("autodoc", "	* Returns resulting shape (Face or Shell if splitted) To be used instead of Face() if FixMissingSeam involved

	:rtype: TopoDS_Shape
") Result;
		TopoDS_Shape Result ();
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Add a wire to current face using BRep_Builder. Wire is added without taking into account orientation of face (as if face were FORWARD).

	:param wire:
	:type wire: TopoDS_Wire &
	:rtype: None
") Add;
		void Add (const TopoDS_Wire & wire);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Performs all the fixes, depending on modes Function Status returns the status of last call to Perform() ShapeExtend_OK : face was OK, nothing done ShapeExtend_DONE1: some wires are fixed ShapeExtend_DONE2: orientation of wires fixed ShapeExtend_DONE3: missing seam added ShapeExtend_DONE4: small area wire removed ShapeExtend_DONE5: natural bounds added ShapeExtend_FAIL1: some fails during fixing wires ShapeExtend_FAIL2: cannot fix orientation of wires ShapeExtend_FAIL3: cannot add missing seam ShapeExtend_FAIL4: cannot remove small area wire

	:rtype: bool
") Perform;
		Standard_Boolean Perform ();
		%feature("compactdefaultargs") FixOrientation;
		%feature("autodoc", "	* Fixes orientation of wires on the face It tries to make all wires lie outside all others (according to orientation) by reversing orientation of some of them. If face lying on sphere or torus has single wire and AddNaturalBoundMode is True, that wire is not reversed in any case (supposing that natural bound will be added). Returns True if wires were reversed

	:rtype: bool
") FixOrientation;
		Standard_Boolean FixOrientation ();
		%feature("compactdefaultargs") FixOrientation;
		%feature("autodoc", "	* Fixes orientation of wires on the face It tries to make all wires lie outside all others (according to orientation) by reversing orientation of some of them. If face lying on sphere or torus has single wire and AddNaturalBoundMode is True, that wire is not reversed in any case (supposing that natural bound will be added). Returns True if wires were reversed OutWires return information about out wires + list of internal wires for each (for performing split face).

	:param MapWires:
	:type MapWires: TopTools_DataMapOfShapeListOfShape &
	:rtype: bool
") FixOrientation;
		Standard_Boolean FixOrientation (TopTools_DataMapOfShapeListOfShape & MapWires);
		%feature("compactdefaultargs") FixAddNaturalBound;
		%feature("autodoc", "	* Adds natural boundary on face if it is missing. Two cases are supported: - face has no wires - face lies on geometrically double-closed surface (sphere or torus) and none of wires is left-oriented Returns True if natural boundary was added

	:rtype: bool
") FixAddNaturalBound;
		Standard_Boolean FixAddNaturalBound ();
		%feature("compactdefaultargs") FixMissingSeam;
		%feature("autodoc", "	* Detects and fixes the special case when face on a closed surface is given by two wires closed in 3d but with gap in 2d. In that case it creates a new wire from the two, and adds a missing seam edge Returns True if missing seam was added

	:rtype: bool
") FixMissingSeam;
		Standard_Boolean FixMissingSeam ();
		%feature("compactdefaultargs") FixSmallAreaWire;
		%feature("autodoc", "	* Detects wires with small area (that is less than 100*Precision::PConfusion(). Removes these wires if they are internal. Returns : True if at least one small wire removed, False if does nothing.

	:param theIsRemoveSmallFace:
	:type theIsRemoveSmallFace: bool
	:rtype: bool
") FixSmallAreaWire;
		Standard_Boolean FixSmallAreaWire (const Standard_Boolean theIsRemoveSmallFace);
		%feature("compactdefaultargs") FixLoopWire;
		%feature("autodoc", "	* Detects if wire has a loop and fixes this situation by splitting on the few parts. if wire has a loops and it was splitted Status was set to value ShapeExtend_DONE6.

	:param aResWires:
	:type aResWires: TopTools_SequenceOfShape &
	:rtype: bool
") FixLoopWire;
		Standard_Boolean FixLoopWire (TopTools_SequenceOfShape & aResWires);
		%feature("compactdefaultargs") FixIntersectingWires;
		%feature("autodoc", "	* Detects and fixes the special case when face has more than one wire and this wires have intersection point

	:rtype: bool
") FixIntersectingWires;
		Standard_Boolean FixIntersectingWires ();
		%feature("compactdefaultargs") FixWiresTwoCoincEdges;
		%feature("autodoc", "	* If wire contains two coincidence edges it must be removed Queries on status after Perform()

	:rtype: bool
") FixWiresTwoCoincEdges;
		Standard_Boolean FixWiresTwoCoincEdges ();
		%feature("compactdefaultargs") FixSplitFace;
		%feature("autodoc", "	* Split face if there are more than one out wire using inrormation after FixOrientation()

	:param MapWires:
	:type MapWires: TopTools_DataMapOfShapeListOfShape &
	:rtype: bool
") FixSplitFace;
		Standard_Boolean FixSplitFace (const TopTools_DataMapOfShapeListOfShape & MapWires);
		%feature("compactdefaultargs") FixPeriodicDegenerated;
		%feature("autodoc", "	* Fixes topology for a specific case when face is composed by a single wire belting a periodic surface. In that case a degenerated edge is reconstructed in the degenerated pole of the surface. Initial wire gets consistent orientation. Must be used in couple and before FixMissingSeam routine

	:rtype: bool
") FixPeriodicDegenerated;
		Standard_Boolean FixPeriodicDegenerated ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status of last call to Perform() ShapeExtend_OK : face was OK, nothing done ShapeExtend_DONE1: some wires are fixed ShapeExtend_DONE2: orientation of wires fixed ShapeExtend_DONE3: missing seam added ShapeExtend_DONE4: small area wire removed ShapeExtend_DONE5: natural bounds added ShapeExtend_DONE8: face may be splited ShapeExtend_FAIL1: some fails during fixing wires ShapeExtend_FAIL2: cannot fix orientation of wires ShapeExtend_FAIL3: cannot add missing seam ShapeExtend_FAIL4: cannot remove small area wire

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("compactdefaultargs") FixWireTool;
		%feature("autodoc", "	* Returns tool for fixing wires.

	:rtype: Handle_ShapeFix_Wire
") FixWireTool;
		Handle_ShapeFix_Wire FixWireTool ();
};


%extend ShapeFix_Face {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_Face(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_Face::Handle_ShapeFix_Face %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_Face;
class Handle_ShapeFix_Face : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Face();
        Handle_ShapeFix_Face(const Handle_ShapeFix_Face &aHandle);
        Handle_ShapeFix_Face(const ShapeFix_Face *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Face DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Face {
    ShapeFix_Face* _get_reference() {
    return (ShapeFix_Face*)$self->Access();
    }
};

%extend Handle_ShapeFix_Face {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_Face {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_FixSmallFace;
class ShapeFix_FixSmallFace : public ShapeFix_Root {
	public:
		%feature("compactdefaultargs") ShapeFix_FixSmallFace;
		%feature("autodoc", "	:rtype: None
") ShapeFix_FixSmallFace;
		 ShapeFix_FixSmallFace ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Fixing case of spot face

	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") FixSpotFace;
		%feature("autodoc", "	* Fixing case of spot face, if tol = -1 used local tolerance.

	:rtype: TopoDS_Shape
") FixSpotFace;
		TopoDS_Shape FixSpotFace ();
		%feature("compactdefaultargs") ReplaceVerticesInCaseOfSpot;
		%feature("autodoc", "	* Compute average vertex and replacing vertices by new one.

	:param F:
	:type F: TopoDS_Face &
	:param tol:
	:type tol: float
	:rtype: bool
") ReplaceVerticesInCaseOfSpot;
		Standard_Boolean ReplaceVerticesInCaseOfSpot (TopoDS_Face & F,const Standard_Real tol);
		%feature("compactdefaultargs") RemoveFacesInCaseOfSpot;
		%feature("autodoc", "	* Remove spot face from compound

	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") RemoveFacesInCaseOfSpot;
		Standard_Boolean RemoveFacesInCaseOfSpot (const TopoDS_Face & F);
		%feature("compactdefaultargs") FixStripFace;
		%feature("autodoc", "	* Fixing case of strip face, if tol = -1 used local tolerance

	:param wasdone: default value is Standard_False
	:type wasdone: bool
	:rtype: TopoDS_Shape
") FixStripFace;
		TopoDS_Shape FixStripFace (const Standard_Boolean wasdone = Standard_False);
		%feature("compactdefaultargs") ReplaceInCaseOfStrip;
		%feature("autodoc", "	* Replace veretces and edges.

	:param F:
	:type F: TopoDS_Face &
	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param tol:
	:type tol: float
	:rtype: bool
") ReplaceInCaseOfStrip;
		Standard_Boolean ReplaceInCaseOfStrip (TopoDS_Face & F,TopoDS_Edge & E1,TopoDS_Edge & E2,const Standard_Real tol);
		%feature("compactdefaultargs") RemoveFacesInCaseOfStrip;
		%feature("autodoc", "	* Remove strip face from compound.

	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") RemoveFacesInCaseOfStrip;
		Standard_Boolean RemoveFacesInCaseOfStrip (const TopoDS_Face & F);
		%feature("compactdefaultargs") ComputeSharedEdgeForStripFace;
		%feature("autodoc", "	* Compute average edge for strip face

	:param F:
	:type F: TopoDS_Face &
	:param E1:
	:type E1: TopoDS_Edge &
	:param E2:
	:type E2: TopoDS_Edge &
	:param F1:
	:type F1: TopoDS_Face &
	:param tol:
	:type tol: float
	:rtype: TopoDS_Edge
") ComputeSharedEdgeForStripFace;
		TopoDS_Edge ComputeSharedEdgeForStripFace (const TopoDS_Face & F,const TopoDS_Edge & E1,const TopoDS_Edge & E2,const TopoDS_Face & F1,const Standard_Real tol);
		%feature("compactdefaultargs") FixSplitFace;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: TopoDS_Shape
") FixSplitFace;
		TopoDS_Shape FixSplitFace (const TopoDS_Shape & S);
		%feature("compactdefaultargs") SplitOneFace;
		%feature("autodoc", "	* Compute data for face splitting.

	:param F:
	:type F: TopoDS_Face &
	:param theSplittedFaces:
	:type theSplittedFaces: TopoDS_Compound &
	:rtype: bool
") SplitOneFace;
		Standard_Boolean SplitOneFace (TopoDS_Face & F,TopoDS_Compound & theSplittedFaces);
		%feature("compactdefaultargs") FixFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: TopoDS_Face
") FixFace;
		TopoDS_Face FixFace (const TopoDS_Face & F);
		%feature("compactdefaultargs") FixShape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") FixShape;
		TopoDS_Shape FixShape ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
		%feature("compactdefaultargs") FixPinFace;
		%feature("autodoc", "	:param F:
	:type F: TopoDS_Face &
	:rtype: bool
") FixPinFace;
		Standard_Boolean FixPinFace (TopoDS_Face & F);
};


%extend ShapeFix_FixSmallFace {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_FixSmallFace(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_FixSmallFace::Handle_ShapeFix_FixSmallFace %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_FixSmallFace;
class Handle_ShapeFix_FixSmallFace : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_FixSmallFace();
        Handle_ShapeFix_FixSmallFace(const Handle_ShapeFix_FixSmallFace &aHandle);
        Handle_ShapeFix_FixSmallFace(const ShapeFix_FixSmallFace *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_FixSmallFace DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_FixSmallFace {
    ShapeFix_FixSmallFace* _get_reference() {
    return (ShapeFix_FixSmallFace*)$self->Access();
    }
};

%extend Handle_ShapeFix_FixSmallFace {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_FixSmallFace {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_FixSmallSolid;
class ShapeFix_FixSmallSolid : public ShapeFix_Root {
	public:
		%feature("compactdefaultargs") ShapeFix_FixSmallSolid;
		%feature("autodoc", "	* Construct

	:rtype: None
") ShapeFix_FixSmallSolid;
		 ShapeFix_FixSmallSolid ();
		%feature("compactdefaultargs") SetFixMode;
		%feature("autodoc", "	* Set working mode for operator: - theMode = 0 use both WidthFactorThreshold and VolumeThreshold parameters - theMode = 1 use only WidthFactorThreshold parameter - theMode = 2 use only VolumeThreshold parameter

	:param theMode:
	:type theMode: int
	:rtype: None
") SetFixMode;
		void SetFixMode (const Standard_Integer theMode);
		%feature("compactdefaultargs") SetVolumeThreshold;
		%feature("autodoc", "	* Set or clear volume threshold for small solids

	:param theThreshold: default value is -1.0
	:type theThreshold: float
	:rtype: None
") SetVolumeThreshold;
		void SetVolumeThreshold (const Standard_Real theThreshold = -1.0);
		%feature("compactdefaultargs") SetWidthFactorThreshold;
		%feature("autodoc", "	* Set or clear width factor threshold for small solids

	:param theThreshold: default value is -1.0
	:type theThreshold: float
	:rtype: None
") SetWidthFactorThreshold;
		void SetWidthFactorThreshold (const Standard_Real theThreshold = -1.0);
		%feature("compactdefaultargs") Remove;
		%feature("autodoc", "	* Remove small solids from the given shape

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theContext:
	:type theContext: Handle_ShapeBuild_ReShape &
	:rtype: TopoDS_Shape
") Remove;
		TopoDS_Shape Remove (const TopoDS_Shape & theShape,const Handle_ShapeBuild_ReShape & theContext);
		%feature("compactdefaultargs") Merge;
		%feature("autodoc", "	* Merge small solids in the given shape to adjacent non-small ones

	:param theShape:
	:type theShape: TopoDS_Shape &
	:param theContext:
	:type theContext: Handle_ShapeBuild_ReShape &
	:rtype: TopoDS_Shape
") Merge;
		TopoDS_Shape Merge (const TopoDS_Shape & theShape,const Handle_ShapeBuild_ReShape & theContext);
};


%extend ShapeFix_FixSmallSolid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_FixSmallSolid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_FixSmallSolid::Handle_ShapeFix_FixSmallSolid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_FixSmallSolid;
class Handle_ShapeFix_FixSmallSolid : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_FixSmallSolid();
        Handle_ShapeFix_FixSmallSolid(const Handle_ShapeFix_FixSmallSolid &aHandle);
        Handle_ShapeFix_FixSmallSolid(const ShapeFix_FixSmallSolid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_FixSmallSolid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_FixSmallSolid {
    ShapeFix_FixSmallSolid* _get_reference() {
    return (ShapeFix_FixSmallSolid*)$self->Access();
    }
};

%extend Handle_ShapeFix_FixSmallSolid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_FixSmallSolid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_Shape;
class ShapeFix_Shape : public ShapeFix_Root {
	public:
		%feature("compactdefaultargs") ShapeFix_Shape;
		%feature("autodoc", "	* Empty Constructor

	:rtype: None
") ShapeFix_Shape;
		 ShapeFix_Shape ();
		%feature("compactdefaultargs") ShapeFix_Shape;
		%feature("autodoc", "	* Initislises by shape.

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") ShapeFix_Shape;
		 ShapeFix_Shape (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initislises by shape.

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Iterates on sub- shape and performs fixes

	:param theProgress: default value is 0
	:type theProgress: Handle_Message_ProgressIndicator &
	:rtype: bool
") Perform;
		Standard_Boolean Perform (const Handle_Message_ProgressIndicator & theProgress = 0);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* Returns resulting shape

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
		%feature("compactdefaultargs") FixSolidTool;
		%feature("autodoc", "	* Returns tool for fixing solids.

	:rtype: Handle_ShapeFix_Solid
") FixSolidTool;
		Handle_ShapeFix_Solid FixSolidTool ();
		%feature("compactdefaultargs") FixShellTool;
		%feature("autodoc", "	* Returns tool for fixing shells.

	:rtype: Handle_ShapeFix_Shell
") FixShellTool;
		Handle_ShapeFix_Shell FixShellTool ();
		%feature("compactdefaultargs") FixFaceTool;
		%feature("autodoc", "	* Returns tool for fixing faces.

	:rtype: Handle_ShapeFix_Face
") FixFaceTool;
		Handle_ShapeFix_Face FixFaceTool ();
		%feature("compactdefaultargs") FixWireTool;
		%feature("autodoc", "	* Returns tool for fixing wires.

	:rtype: Handle_ShapeFix_Wire
") FixWireTool;
		Handle_ShapeFix_Wire FixWireTool ();
		%feature("compactdefaultargs") FixEdgeTool;
		%feature("autodoc", "	* Returns tool for fixing edges.

	:rtype: Handle_ShapeFix_Edge
") FixEdgeTool;
		Handle_ShapeFix_Edge FixEdgeTool ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status of the last Fix. This can be a combination of the following flags: ShapeExtend_DONE1: some free edges were fixed ShapeExtend_DONE2: some free wires were fixed ShapeExtend_DONE3: some free faces were fixed ShapeExtend_DONE4: some free shells were fixed ShapeExtend_DONE5: some free solids were fixed ShapeExtend_DONE6: shapes in compound(s) were fixed

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "	* Sets message registrator

	:param msgreg:
	:type msgreg: Handle_ShapeExtend_BasicMsgRegistrator &
	:rtype: void
") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	* Sets basic precision value (also to FixSolidTool)

	:param preci:
	:type preci: float
	:rtype: void
") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "	* Sets minimal allowed tolerance (also to FixSolidTool)

	:param mintol:
	:type mintol: float
	:rtype: void
") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "	* Sets maximal allowed tolerance (also to FixSolidTool)

	:param maxtol:
	:type maxtol: float
	:rtype: void
") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixSolidMode() {
                return (Standard_Integer) $self->FixSolidMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixSolidMode(Standard_Integer value ) {
                $self->FixSolidMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixFreeShellMode() {
                return (Standard_Integer) $self->FixFreeShellMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixFreeShellMode(Standard_Integer value ) {
                $self->FixFreeShellMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixFreeFaceMode() {
                return (Standard_Integer) $self->FixFreeFaceMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixFreeFaceMode(Standard_Integer value ) {
                $self->FixFreeFaceMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixFreeWireMode() {
                return (Standard_Integer) $self->FixFreeWireMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixFreeWireMode(Standard_Integer value ) {
                $self->FixFreeWireMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixSameParameterMode() {
                return (Standard_Integer) $self->FixSameParameterMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixSameParameterMode(Standard_Integer value ) {
                $self->FixSameParameterMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixVertexPositionMode() {
                return (Standard_Integer) $self->FixVertexPositionMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixVertexPositionMode(Standard_Integer value ) {
                $self->FixVertexPositionMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixVertexTolMode() {
                return (Standard_Integer) $self->FixVertexTolMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixVertexTolMode(Standard_Integer value ) {
                $self->FixVertexTolMode()=value;
                }
            };
            };


%extend ShapeFix_Shape {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_Shape(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_Shape::Handle_ShapeFix_Shape %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_Shape;
class Handle_ShapeFix_Shape : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Shape();
        Handle_ShapeFix_Shape(const Handle_ShapeFix_Shape &aHandle);
        Handle_ShapeFix_Shape(const ShapeFix_Shape *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Shape DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Shape {
    ShapeFix_Shape* _get_reference() {
    return (ShapeFix_Shape*)$self->Access();
    }
};

%extend Handle_ShapeFix_Shape {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_Shape {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_Shell;
class ShapeFix_Shell : public ShapeFix_Root {
	public:
		%feature("compactdefaultargs") ShapeFix_Shell;
		%feature("autodoc", "	* Empty constructor

	:rtype: None
") ShapeFix_Shell;
		 ShapeFix_Shell ();
		%feature("compactdefaultargs") ShapeFix_Shell;
		%feature("autodoc", "	* Initializes by shell.

	:param shape:
	:type shape: TopoDS_Shell &
	:rtype: None
") ShapeFix_Shell;
		 ShapeFix_Shell (const TopoDS_Shell & shape);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes by shell.

	:param shell:
	:type shell: TopoDS_Shell &
	:rtype: None
") Init;
		void Init (const TopoDS_Shell & shell);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Iterates on subshapes and performs fixes (for each face calls ShapeFix_Face::Perform and then calls FixFaceOrientation). The passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.

	:param theProgress: default value is 0
	:type theProgress: Handle_Message_ProgressIndicator &
	:rtype: bool
") Perform;
		Standard_Boolean Perform (const Handle_Message_ProgressIndicator & theProgress = 0);
		%feature("compactdefaultargs") FixFaceOrientation;
		%feature("autodoc", "	* Fixes orientation of faces in shell. Changes orientation of face in the shell, if it is oriented opposite to neigbouring faces. If it is not possible to orient all faces in the shell (like in case of mebious band), this method orients only subset of faces. Other faces are stored in Error compound. Modes : isAccountMultiConex - mode for account cases of multiconnexity. If this mode is equal to Standard_True, separate shells will be created in the cases of multiconnexity. If this mode is equal to Standard_False, one shell will be created without account of multiconnexity.By defautt - Standard_True; NonManifold - mode for creation of non-manifold shells. If this mode is equal to Standard_True one non-manifold will be created from shell contains multishared edges. Else if this mode is equal to Standard_False only manifold shells will be created. By default - Standard_False.

	:param shell:
	:type shell: TopoDS_Shell &
	:param isAccountMultiConex: default value is Standard_True
	:type isAccountMultiConex: bool
	:param NonManifold: default value is Standard_False
	:type NonManifold: bool
	:rtype: bool
") FixFaceOrientation;
		Standard_Boolean FixFaceOrientation (const TopoDS_Shell & shell,const Standard_Boolean isAccountMultiConex = Standard_True,const Standard_Boolean NonManifold = Standard_False);
		%feature("compactdefaultargs") Shell;
		%feature("autodoc", "	* Returns fixed shell (or subset of oriented faces).

	:rtype: TopoDS_Shell
") Shell;
		TopoDS_Shell Shell ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* In case of multiconnexity returns compound of fixed shells else returns one shell..

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
		%feature("compactdefaultargs") NbShells;
		%feature("autodoc", "	* Returns Number of obtainrd shells;

	:rtype: int
") NbShells;
		Standard_Integer NbShells ();
		%feature("compactdefaultargs") ErrorFaces;
		%feature("autodoc", "	* Returns not oriented subset of faces.

	:rtype: TopoDS_Compound
") ErrorFaces;
		TopoDS_Compound ErrorFaces ();
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status of the last Fix.

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") Status;
		Standard_Boolean Status (const ShapeExtend_Status status);
		%feature("compactdefaultargs") FixFaceTool;
		%feature("autodoc", "	* Returns tool for fixing faces.

	:rtype: Handle_ShapeFix_Face
") FixFaceTool;
		Handle_ShapeFix_Face FixFaceTool ();
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "	* Sets message registrator

	:param msgreg:
	:type msgreg: Handle_ShapeExtend_BasicMsgRegistrator &
	:rtype: void
") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	* Sets basic precision value (also to FixWireTool)

	:param preci:
	:type preci: float
	:rtype: void
") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "	* Sets minimal allowed tolerance (also to FixWireTool)

	:param mintol:
	:type mintol: float
	:rtype: void
") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "	* Sets maximal allowed tolerance (also to FixWireTool)

	:param maxtol:
	:type maxtol: float
	:rtype: void
") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixFaceMode() {
                return (Standard_Integer) $self->FixFaceMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixFaceMode(Standard_Integer value ) {
                $self->FixFaceMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixOrientationMode() {
                return (Standard_Integer) $self->FixOrientationMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixOrientationMode(Standard_Integer value ) {
                $self->FixOrientationMode()=value;
                }
            };
            };


%extend ShapeFix_Shell {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_Shell(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_Shell::Handle_ShapeFix_Shell %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_Shell;
class Handle_ShapeFix_Shell : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Shell();
        Handle_ShapeFix_Shell(const Handle_ShapeFix_Shell &aHandle);
        Handle_ShapeFix_Shell(const ShapeFix_Shell *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Shell DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Shell {
    ShapeFix_Shell* _get_reference() {
    return (ShapeFix_Shell*)$self->Access();
    }
};

%extend Handle_ShapeFix_Shell {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_Shell {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_Solid;
class ShapeFix_Solid : public ShapeFix_Root {
	public:
		%feature("compactdefaultargs") ShapeFix_Solid;
		%feature("autodoc", "	* Empty constructor;

	:rtype: None
") ShapeFix_Solid;
		 ShapeFix_Solid ();
		%feature("compactdefaultargs") ShapeFix_Solid;
		%feature("autodoc", "	* Initializes by solid.

	:param solid:
	:type solid: TopoDS_Solid &
	:rtype: None
") ShapeFix_Solid;
		 ShapeFix_Solid (const TopoDS_Solid & solid);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Initializes by solid .

	:param solid:
	:type solid: TopoDS_Solid &
	:rtype: void
") Init;
		virtual void Init (const TopoDS_Solid & solid);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* Iterates on shells and performs fixes (calls ShapeFix_Shell for each subshell). The passed progress indicator allows user to consult the current progress stage and abort algorithm if needed.

	:param theProgress: default value is 0
	:type theProgress: Handle_Message_ProgressIndicator &
	:rtype: bool
") Perform;
		virtual Standard_Boolean Perform (const Handle_Message_ProgressIndicator & theProgress = 0);
		%feature("compactdefaultargs") SolidFromShell;
		%feature("autodoc", "	* Calls MakeSolid and orients the solid to be 'not infinite'

	:param shell:
	:type shell: TopoDS_Shell &
	:rtype: TopoDS_Solid
") SolidFromShell;
		TopoDS_Solid SolidFromShell (const TopoDS_Shell & shell);
		%feature("compactdefaultargs") Status;
		%feature("autodoc", "	* Returns the status of the last Fix.

	:param status:
	:type status: ShapeExtend_Status
	:rtype: int
") Status;
		Standard_Integer Status (const ShapeExtend_Status status);
		%feature("compactdefaultargs") Solid;
		%feature("autodoc", "	* Returns resulting solid.

	:rtype: TopoDS_Shape
") Solid;
		TopoDS_Shape Solid ();
		%feature("compactdefaultargs") FixShellTool;
		%feature("autodoc", "	* Returns tool for fixing shells.

	:rtype: Handle_ShapeFix_Shell
") FixShellTool;
		Handle_ShapeFix_Shell FixShellTool ();
		%feature("compactdefaultargs") SetMsgRegistrator;
		%feature("autodoc", "	* Sets message registrator

	:param msgreg:
	:type msgreg: Handle_ShapeExtend_BasicMsgRegistrator &
	:rtype: void
") SetMsgRegistrator;
		virtual void SetMsgRegistrator (const Handle_ShapeExtend_BasicMsgRegistrator & msgreg);
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	* Sets basic precision value (also to FixShellTool)

	:param preci:
	:type preci: float
	:rtype: void
") SetPrecision;
		virtual void SetPrecision (const Standard_Real preci);
		%feature("compactdefaultargs") SetMinTolerance;
		%feature("autodoc", "	* Sets minimal allowed tolerance (also to FixShellTool)

	:param mintol:
	:type mintol: float
	:rtype: void
") SetMinTolerance;
		virtual void SetMinTolerance (const Standard_Real mintol);
		%feature("compactdefaultargs") SetMaxTolerance;
		%feature("autodoc", "	* Sets maximal allowed tolerance (also to FixShellTool)

	:param maxtol:
	:type maxtol: float
	:rtype: void
") SetMaxTolerance;
		virtual void SetMaxTolerance (const Standard_Real maxtol);

            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixShellMode() {
                return (Standard_Integer) $self->FixShellMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixShellMode(Standard_Integer value ) {
                $self->FixShellMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetCreateOpenSolidMode() {
                return (Standard_Boolean) $self->CreateOpenSolidMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetCreateOpenSolidMode(Standard_Boolean value ) {
                $self->CreateOpenSolidMode()=value;
                }
            };
            		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	* In case of multiconnexity returns compound of fixed solids else returns one solid.

	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
};


%extend ShapeFix_Solid {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_Solid(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_Solid::Handle_ShapeFix_Solid %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_Solid;
class Handle_ShapeFix_Solid : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Solid();
        Handle_ShapeFix_Solid(const Handle_ShapeFix_Solid &aHandle);
        Handle_ShapeFix_Solid(const ShapeFix_Solid *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Solid DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Solid {
    ShapeFix_Solid* _get_reference() {
    return (ShapeFix_Solid*)$self->Access();
    }
};

%extend Handle_ShapeFix_Solid {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_Solid {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_SplitCommonVertex;
class ShapeFix_SplitCommonVertex : public ShapeFix_Root {
	public:
		%feature("compactdefaultargs") ShapeFix_SplitCommonVertex;
		%feature("autodoc", "	:rtype: None
") ShapeFix_SplitCommonVertex;
		 ShapeFix_SplitCommonVertex ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	:param S:
	:type S: TopoDS_Shape &
	:rtype: None
") Init;
		void Init (const TopoDS_Shape & S);
		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	:rtype: None
") Perform;
		void Perform ();
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();
};


%extend ShapeFix_SplitCommonVertex {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_SplitCommonVertex(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_SplitCommonVertex::Handle_ShapeFix_SplitCommonVertex %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_SplitCommonVertex;
class Handle_ShapeFix_SplitCommonVertex : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_SplitCommonVertex();
        Handle_ShapeFix_SplitCommonVertex(const Handle_ShapeFix_SplitCommonVertex &aHandle);
        Handle_ShapeFix_SplitCommonVertex(const ShapeFix_SplitCommonVertex *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_SplitCommonVertex DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_SplitCommonVertex {
    ShapeFix_SplitCommonVertex* _get_reference() {
    return (ShapeFix_SplitCommonVertex*)$self->Access();
    }
};

%extend Handle_ShapeFix_SplitCommonVertex {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_SplitCommonVertex {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_Wire;
class ShapeFix_Wire : public ShapeFix_Root {
	public:
		%feature("compactdefaultargs") ShapeFix_Wire;
		%feature("autodoc", "	* Empty Constructor, creates clear object with default flags

	:rtype: None
") ShapeFix_Wire;
		 ShapeFix_Wire ();
		%feature("compactdefaultargs") ShapeFix_Wire;
		%feature("autodoc", "	* Create new object with default flags and prepare it for use (Loads analyzer with all the data for the wire and face)

	:param wire:
	:type wire: TopoDS_Wire &
	:param face:
	:type face: TopoDS_Face &
	:param prec:
	:type prec: float
	:rtype: None
") ShapeFix_Wire;
		 ShapeFix_Wire (const TopoDS_Wire & wire,const TopoDS_Face & face,const Standard_Real prec);
		%feature("compactdefaultargs") ClearModes;
		%feature("autodoc", "	* Sets all modes to default

	:rtype: None
") ClearModes;
		void ClearModes ();
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "	* Clears all statuses

	:rtype: None
") ClearStatuses;
		void ClearStatuses ();
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Load analyzer with all the data for the wire and face and drops all fixing statuses

	:param wire:
	:type wire: TopoDS_Wire &
	:param face:
	:type face: TopoDS_Face &
	:param prec:
	:type prec: float
	:rtype: None
") Init;
		void Init (const TopoDS_Wire & wire,const TopoDS_Face & face,const Standard_Real prec);
		%feature("compactdefaultargs") Init;
		%feature("autodoc", "	* Load analyzer with all the data already prepared and drops all fixing statuses If analyzer contains face, there is no need to set it by SetFace or SetSurface

	:param saw:
	:type saw: Handle_ShapeAnalysis_Wire &
	:rtype: None
") Init;
		void Init (const Handle_ShapeAnalysis_Wire & saw);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Load data for the wire, and drops all fixing statuses

	:param wire:
	:type wire: TopoDS_Wire &
	:rtype: None
") Load;
		void Load (const TopoDS_Wire & wire);
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Load data for the wire, and drops all fixing statuses

	:param sbwd:
	:type sbwd: Handle_ShapeExtend_WireData &
	:rtype: None
") Load;
		void Load (const Handle_ShapeExtend_WireData & sbwd);
		%feature("compactdefaultargs") SetFace;
		%feature("autodoc", "	* Set working face for the wire

	:param face:
	:type face: TopoDS_Face &
	:rtype: None
") SetFace;
		void SetFace (const TopoDS_Face & face);
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "	* Set surface for the wire

	:param surf:
	:type surf: Handle_Geom_Surface &
	:rtype: None
") SetSurface;
		void SetSurface (const Handle_Geom_Surface & surf);
		%feature("compactdefaultargs") SetSurface;
		%feature("autodoc", "	* Set surface for the wire

	:param surf:
	:type surf: Handle_Geom_Surface &
	:param loc:
	:type loc: TopLoc_Location &
	:rtype: None
") SetSurface;
		void SetSurface (const Handle_Geom_Surface & surf,const TopLoc_Location & loc);
		%feature("compactdefaultargs") SetPrecision;
		%feature("autodoc", "	* Set working precision (to root and to analyzer)

	:param prec:
	:type prec: float
	:rtype: void
") SetPrecision;
		virtual void SetPrecision (const Standard_Real prec);
		%feature("compactdefaultargs") SetMaxTailAngle;
		%feature("autodoc", "	* Sets the maximal allowed angle of the tails in radians.

	:param theMaxTailAngle:
	:type theMaxTailAngle: float
	:rtype: None
") SetMaxTailAngle;
		void SetMaxTailAngle (const Standard_Real theMaxTailAngle);
		%feature("compactdefaultargs") SetMaxTailWidth;
		%feature("autodoc", "	* Sets the maximal allowed width of the tails.

	:param theMaxTailWidth:
	:type theMaxTailWidth: float
	:rtype: None
") SetMaxTailWidth;
		void SetMaxTailWidth (const Standard_Real theMaxTailWidth);
		%feature("compactdefaultargs") IsLoaded;
		%feature("autodoc", "	* Tells if the wire is loaded

	:rtype: bool
") IsLoaded;
		Standard_Boolean IsLoaded ();
		%feature("compactdefaultargs") IsReady;
		%feature("autodoc", "	* Tells if the wire and face are loaded

	:rtype: bool
") IsReady;
		Standard_Boolean IsReady ();
		%feature("compactdefaultargs") NbEdges;
		%feature("autodoc", "	* returns number of edges in the working wire

	:rtype: int
") NbEdges;
		Standard_Integer NbEdges ();
		%feature("compactdefaultargs") Wire;
		%feature("autodoc", "	* Makes the resulting Wire (by basic Brep_Builder)

	:rtype: TopoDS_Wire
") Wire;
		TopoDS_Wire Wire ();
		%feature("compactdefaultargs") WireAPIMake;
		%feature("autodoc", "	* Makes the resulting Wire (by BRepAPI_MakeWire)

	:rtype: TopoDS_Wire
") WireAPIMake;
		TopoDS_Wire WireAPIMake ();
		%feature("compactdefaultargs") Analyzer;
		%feature("autodoc", "	* returns field Analyzer (working tool)

	:rtype: Handle_ShapeAnalysis_Wire
") Analyzer;
		Handle_ShapeAnalysis_Wire Analyzer ();
		%feature("compactdefaultargs") WireData;
		%feature("autodoc", "	* returns working wire

	:rtype: Handle_ShapeExtend_WireData
") WireData;
		Handle_ShapeExtend_WireData WireData ();
		%feature("compactdefaultargs") Face;
		%feature("autodoc", "	* returns working face (Analyzer.Face())

	:rtype: TopoDS_Face
") Face;
		const TopoDS_Face  Face ();

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetModifyTopologyMode() {
                return (Standard_Boolean) $self->ModifyTopologyMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetModifyTopologyMode(Standard_Boolean value ) {
                $self->ModifyTopologyMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetModifyGeometryMode() {
                return (Standard_Boolean) $self->ModifyGeometryMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetModifyGeometryMode(Standard_Boolean value ) {
                $self->ModifyGeometryMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetModifyRemoveLoopMode() {
                return (Standard_Integer) $self->ModifyRemoveLoopMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetModifyRemoveLoopMode(Standard_Integer value ) {
                $self->ModifyRemoveLoopMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetClosedWireMode() {
                return (Standard_Boolean) $self->ClosedWireMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetClosedWireMode(Standard_Boolean value ) {
                $self->ClosedWireMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetPreferencePCurveMode() {
                return (Standard_Boolean) $self->PreferencePCurveMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetPreferencePCurveMode(Standard_Boolean value ) {
                $self->PreferencePCurveMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetFixGapsByRangesMode() {
                return (Standard_Boolean) $self->FixGapsByRangesMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixGapsByRangesMode(Standard_Boolean value ) {
                $self->FixGapsByRangesMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixReorderMode() {
                return (Standard_Integer) $self->FixReorderMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixReorderMode(Standard_Integer value ) {
                $self->FixReorderMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixSmallMode() {
                return (Standard_Integer) $self->FixSmallMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixSmallMode(Standard_Integer value ) {
                $self->FixSmallMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixConnectedMode() {
                return (Standard_Integer) $self->FixConnectedMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixConnectedMode(Standard_Integer value ) {
                $self->FixConnectedMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixEdgeCurvesMode() {
                return (Standard_Integer) $self->FixEdgeCurvesMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixEdgeCurvesMode(Standard_Integer value ) {
                $self->FixEdgeCurvesMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixDegeneratedMode() {
                return (Standard_Integer) $self->FixDegeneratedMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixDegeneratedMode(Standard_Integer value ) {
                $self->FixDegeneratedMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixSelfIntersectionMode() {
                return (Standard_Integer) $self->FixSelfIntersectionMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixSelfIntersectionMode(Standard_Integer value ) {
                $self->FixSelfIntersectionMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixLackingMode() {
                return (Standard_Integer) $self->FixLackingMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixLackingMode(Standard_Integer value ) {
                $self->FixLackingMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixGaps3dMode() {
                return (Standard_Integer) $self->FixGaps3dMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixGaps3dMode(Standard_Integer value ) {
                $self->FixGaps3dMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixGaps2dMode() {
                return (Standard_Integer) $self->FixGaps2dMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixGaps2dMode(Standard_Integer value ) {
                $self->FixGaps2dMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixReversed2dMode() {
                return (Standard_Integer) $self->FixReversed2dMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixReversed2dMode(Standard_Integer value ) {
                $self->FixReversed2dMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixRemovePCurveMode() {
                return (Standard_Integer) $self->FixRemovePCurveMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixRemovePCurveMode(Standard_Integer value ) {
                $self->FixRemovePCurveMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixAddPCurveMode() {
                return (Standard_Integer) $self->FixAddPCurveMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixAddPCurveMode(Standard_Integer value ) {
                $self->FixAddPCurveMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixRemoveCurve3dMode() {
                return (Standard_Integer) $self->FixRemoveCurve3dMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixRemoveCurve3dMode(Standard_Integer value ) {
                $self->FixRemoveCurve3dMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixAddCurve3dMode() {
                return (Standard_Integer) $self->FixAddCurve3dMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixAddCurve3dMode(Standard_Integer value ) {
                $self->FixAddCurve3dMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixSeamMode() {
                return (Standard_Integer) $self->FixSeamMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixSeamMode(Standard_Integer value ) {
                $self->FixSeamMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixShiftedMode() {
                return (Standard_Integer) $self->FixShiftedMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixShiftedMode(Standard_Integer value ) {
                $self->FixShiftedMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixSameParameterMode() {
                return (Standard_Integer) $self->FixSameParameterMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixSameParameterMode(Standard_Integer value ) {
                $self->FixSameParameterMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixVertexToleranceMode() {
                return (Standard_Integer) $self->FixVertexToleranceMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixVertexToleranceMode(Standard_Integer value ) {
                $self->FixVertexToleranceMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixNotchedEdgesMode() {
                return (Standard_Integer) $self->FixNotchedEdgesMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixNotchedEdgesMode(Standard_Integer value ) {
                $self->FixNotchedEdgesMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixSelfIntersectingEdgeMode() {
                return (Standard_Integer) $self->FixSelfIntersectingEdgeMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixSelfIntersectingEdgeMode(Standard_Integer value ) {
                $self->FixSelfIntersectingEdgeMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixIntersectingEdgesMode() {
                return (Standard_Integer) $self->FixIntersectingEdgesMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixIntersectingEdgesMode(Standard_Integer value ) {
                $self->FixIntersectingEdgesMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixNonAdjacentIntersectingEdgesMode() {
                return (Standard_Integer) $self->FixNonAdjacentIntersectingEdgesMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixNonAdjacentIntersectingEdgesMode(Standard_Integer value ) {
                $self->FixNonAdjacentIntersectingEdgesMode()=value;
                }
            };
            
            %feature("autodoc","1");
            %extend {
                Standard_Integer GetFixTailMode() {
                return (Standard_Integer) $self->FixTailMode();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetFixTailMode(Standard_Integer value ) {
                $self->FixTailMode()=value;
                }
            };
            		%feature("compactdefaultargs") Perform;
		%feature("autodoc", "	* This method performs all the available fixes. If some fix is turned on or off explicitly by the Fix..Mode() flag, this fix is either called or not depending on that flag. Else (i.e. if flag is default) fix is called depending on the situation: some fixes are not called or are limited if order of edges in the wire is not OK, or depending on modes //! The order of the fixes and default behaviour of Perform() are: FixReorder FixSmall (with lockvtx true if ! TopoMode or if wire is not ordered) FixConnected (if wire is ordered) FixEdgeCurves (without FixShifted if wire is not ordered) FixDegenerated (if wire is ordered) FixSelfIntersection (if wire is ordered and ClosedMode is True) FixLacking (if wire is ordered)

	:rtype: bool
") Perform;
		Standard_Boolean Perform ();
		%feature("compactdefaultargs") FixReorder;
		%feature("autodoc", "	* Performs an analysis and reorders edges in the wire using class WireOrder

	:rtype: bool
") FixReorder;
		Standard_Boolean FixReorder ();
		%feature("compactdefaultargs") FixSmall;
		%feature("autodoc", "	* Applies FixSmall(num) to all edges in the wire

	:param lockvtx:
	:type lockvtx: bool
	:param precsmall: default value is 0.0
	:type precsmall: float
	:rtype: int
") FixSmall;
		Standard_Integer FixSmall (const Standard_Boolean lockvtx,const Standard_Real precsmall = 0.0);
		%feature("compactdefaultargs") FixConnected;
		%feature("autodoc", "	* Applies FixConnected(num) to all edges in the wire Connection between first and last edges is treated only if flag ClosedMode is True If <prec> is -1 then MaxTolerance() is taken.

	:param prec: default value is -1.0
	:type prec: float
	:rtype: bool
") FixConnected;
		Standard_Boolean FixConnected (const Standard_Real prec = -1.0);
		%feature("compactdefaultargs") FixEdgeCurves;
		%feature("autodoc", "	* Groups the fixes dealing with 3d and pcurves of the edges. The order of the fixes and the default behaviour are: ShapeFix_Edge::FixReversed2d ShapeFix_Edge::FixRemovePCurve (only if forced) ShapeFix_Edge::FixAddPCurve ShapeFix_Edge::FixRemoveCurve3d (only if forced) ShapeFix_Edge::FixAddCurve3d FixSeam, FixShifted, ShapeFix_Edge::FixSameParameter

	:rtype: bool
") FixEdgeCurves;
		Standard_Boolean FixEdgeCurves ();
		%feature("compactdefaultargs") FixDegenerated;
		%feature("autodoc", "	* Applies FixDegenerated(num) to all edges in the wire Connection between first and last edges is treated only if flag ClosedMode is True

	:rtype: bool
") FixDegenerated;
		Standard_Boolean FixDegenerated ();
		%feature("compactdefaultargs") FixSelfIntersection;
		%feature("autodoc", "	* Applies FixSelfIntersectingEdge(num) and FixIntersectingEdges(num) to all edges in the wire and FixIntersectingEdges(num1, num2) for all pairs num1 and num2 such that num2 >= num1 + 2 and removes wrong edges if any

	:rtype: bool
") FixSelfIntersection;
		Standard_Boolean FixSelfIntersection ();
		%feature("compactdefaultargs") FixLacking;
		%feature("autodoc", "	* Applies FixLacking(num) to all edges in the wire Connection between first and last edges is treated only if flag ClosedMode is True If <force> is False (default), test for connectness is done with precision of vertex between edges, else it is done with minimal value of vertex tolerance and Analyzer.Precision(). Hence, <force> will lead to inserting lacking edges in replacement of vertices which have big tolerances.

	:param force: default value is Standard_False
	:type force: bool
	:rtype: bool
") FixLacking;
		Standard_Boolean FixLacking (const Standard_Boolean force = Standard_False);
		%feature("compactdefaultargs") FixClosed;
		%feature("autodoc", "	* Fixes a wire to be well closed It performs FixConnected, FixDegenerated and FixLacking between last and first edges (independingly on flag ClosedMode and modes for these fixings) If <prec> is -1 then MaxTolerance() is taken.

	:param prec: default value is -1.0
	:type prec: float
	:rtype: bool
") FixClosed;
		Standard_Boolean FixClosed (const Standard_Real prec = -1.0);
		%feature("compactdefaultargs") FixGaps3d;
		%feature("autodoc", "	* Fixes gaps between ends of 3d curves on adjacent edges myPrecision is used to detect the gaps.

	:rtype: bool
") FixGaps3d;
		Standard_Boolean FixGaps3d ();
		%feature("compactdefaultargs") FixGaps2d;
		%feature("autodoc", "	* Fixes gaps between ends of pcurves on adjacent edges myPrecision is used to detect the gaps.

	:rtype: bool
") FixGaps2d;
		Standard_Boolean FixGaps2d ();
		%feature("compactdefaultargs") FixReorder;
		%feature("autodoc", "	* Reorder edges in the wire as determined by WireOrder that should be filled and computed before

	:param wi:
	:type wi: ShapeAnalysis_WireOrder &
	:rtype: bool
") FixReorder;
		Standard_Boolean FixReorder (const ShapeAnalysis_WireOrder & wi);
		%feature("compactdefaultargs") FixSmall;
		%feature("autodoc", "	* Fixes Null Length Edge to be removed If an Edge has Null Length (regarding preci, or <precsmall> - what is smaller), it should be removed It can be with no problem if its two vertices are the same Else, if lockvtx is False, it is removed and its end vertex is put on the preceeding edge But if lockvtx is True, this edge must be kept ...

	:param num:
	:type num: int
	:param lockvtx:
	:type lockvtx: bool
	:param precsmall:
	:type precsmall: float
	:rtype: bool
") FixSmall;
		Standard_Boolean FixSmall (const Standard_Integer num,const Standard_Boolean lockvtx,const Standard_Real precsmall);
		%feature("compactdefaultargs") FixConnected;
		%feature("autodoc", "	* Fixes connected edges (preceeding and current) Forces Vertices (end of preceeding-begin of current) to be the same one Tests with starting preci or, if given greater, <prec> If <prec> is -1 then MaxTolerance() is taken.

	:param num:
	:type num: int
	:param prec:
	:type prec: float
	:rtype: bool
") FixConnected;
		Standard_Boolean FixConnected (const Standard_Integer num,const Standard_Real prec);
		%feature("compactdefaultargs") FixSeam;
		%feature("autodoc", "	* Fixes a seam edge A Seam edge has two pcurves, one for forward. one for reversed The forward pcurve must be set as first //! NOTE that correct order of pcurves in the seam edge depends on its orientation (i.e., on orientation of the wire, method of exploration of edges etc.). Since wire represented by the ShapeExtend_WireData is always forward (orientation is accounted by edges), it will work correct if: 1. Wire created from ShapeExtend_WireData with methods ShapeExtend_WireData::Wire..() is added into the FORWARD face (orientation can be applied later) 2. Wire is extracted from the face with orientation not composed with orientation of the face

	:param num:
	:type num: int
	:rtype: bool
") FixSeam;
		Standard_Boolean FixSeam (const Standard_Integer num);
		%feature("compactdefaultargs") FixShifted;
		%feature("autodoc", "	* Fixes edges which have pcurves shifted by whole parameter range on the closed surface (the case may occur if pcurve of edge was computed by projecting 3d curve, which goes along the seam). It compares each two consequent edges and tries to connect them if distance between ends is near to range of the surface. It also can detect and fix the case if all pcurves are connected, but lie out of parametric bounds of the surface. In addition to FixShifted from ShapeFix_Wire, more sophisticated check of degenerate points is performed, and special cases like sphere given by two meridians are treated.

	:rtype: bool
") FixShifted;
		Standard_Boolean FixShifted ();
		%feature("compactdefaultargs") FixDegenerated;
		%feature("autodoc", "	* Fixes Degenerated Edge Checks an <num-th> edge or a point between <num>th-1 and <num>th edges for a singularity on a supporting surface. If singularity is detected, either adds new degenerated edge (before <num>th), or makes <num>th edge to be degenerated.

	:param num:
	:type num: int
	:rtype: bool
") FixDegenerated;
		Standard_Boolean FixDegenerated (const Standard_Integer num);
		%feature("compactdefaultargs") FixLacking;
		%feature("autodoc", "	* Fixes Lacking Edge Test if two adjucent edges are disconnected in 2d (while connected in 3d), and in that case either increase tolerance of the vertex or add a new edge (straight in 2d space), in order to close wire in 2d. Returns True if edge was added or tolerance was increased.

	:param num:
	:type num: int
	:param force: default value is Standard_False
	:type force: bool
	:rtype: bool
") FixLacking;
		Standard_Boolean FixLacking (const Standard_Integer num,const Standard_Boolean force = Standard_False);
		%feature("compactdefaultargs") FixNotchedEdges;
		%feature("autodoc", "	:rtype: bool
") FixNotchedEdges;
		Standard_Boolean FixNotchedEdges ();
		%feature("compactdefaultargs") FixGap3d;
		%feature("autodoc", "	* Fixes gap between ends of 3d curves on num-1 and num-th edges. myPrecision is used to detect the gap. If convert is True, converts curves to bsplines to bend.

	:param num:
	:type num: int
	:param convert: default value is Standard_False
	:type convert: bool
	:rtype: bool
") FixGap3d;
		Standard_Boolean FixGap3d (const Standard_Integer num,const Standard_Boolean convert = Standard_False);
		%feature("compactdefaultargs") FixGap2d;
		%feature("autodoc", "	* Fixes gap between ends of pcurves on num-1 and num-th edges. myPrecision is used to detect the gap. If convert is True, converts pcurves to bsplines to bend.

	:param num:
	:type num: int
	:param convert: default value is Standard_False
	:type convert: bool
	:rtype: bool
") FixGap2d;
		Standard_Boolean FixGap2d (const Standard_Integer num,const Standard_Boolean convert = Standard_False);
		%feature("compactdefaultargs") FixTails;
		%feature("autodoc", "	:rtype: bool
") FixTails;
		Standard_Boolean FixTails ();
		%feature("compactdefaultargs") StatusReorder;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusReorder;
		Standard_Boolean StatusReorder (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusSmall;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusSmall;
		Standard_Boolean StatusSmall (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusConnected;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusConnected;
		Standard_Boolean StatusConnected (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusEdgeCurves;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusEdgeCurves;
		Standard_Boolean StatusEdgeCurves (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusDegenerated;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusDegenerated;
		Standard_Boolean StatusDegenerated (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusSelfIntersection;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusSelfIntersection;
		Standard_Boolean StatusSelfIntersection (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusLacking;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusLacking;
		Standard_Boolean StatusLacking (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusClosed;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusClosed;
		Standard_Boolean StatusClosed (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusGaps3d;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusGaps3d;
		Standard_Boolean StatusGaps3d (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusGaps2d;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusGaps2d;
		Standard_Boolean StatusGaps2d (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusNotches;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusNotches;
		Standard_Boolean StatusNotches (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusRemovedSegment;
		%feature("autodoc", "	* Querying the status of perfomed API fixing procedures Each Status..() methods gives information about the last call to the corresponding Fix..() method of API level: OK : no problems detected; nothing done DONE: some problem(s) was(were) detected and successfully fixed FAIL: some problem(s) cannot be fixed

	:rtype: bool
") StatusRemovedSegment;
		Standard_Boolean StatusRemovedSegment ();
		%feature("compactdefaultargs") StatusFixTails;
		%feature("autodoc", "	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusFixTails;
		Standard_Boolean StatusFixTails (const ShapeExtend_Status status);
		%feature("compactdefaultargs") LastFixStatus;
		%feature("autodoc", "	* Queries the status of last call to methods Fix... of advanced level For details see corresponding methods; universal statuses are: OK : problem not detected; nothing done DONE: problem was detected and successfully fixed FAIL: problem cannot be fixed

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") LastFixStatus;
		Standard_Boolean LastFixStatus (const ShapeExtend_Status status);
		%feature("compactdefaultargs") FixEdgeTool;
		%feature("autodoc", "	* Returns tool for fixing wires.

	:rtype: Handle_ShapeFix_Edge
") FixEdgeTool;
		Handle_ShapeFix_Edge FixEdgeTool ();
};


%extend ShapeFix_Wire {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_Wire(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_Wire::Handle_ShapeFix_Wire %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_Wire;
class Handle_ShapeFix_Wire : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Wire();
        Handle_ShapeFix_Wire(const Handle_ShapeFix_Wire &aHandle);
        Handle_ShapeFix_Wire(const ShapeFix_Wire *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Wire DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Wire {
    ShapeFix_Wire* _get_reference() {
    return (ShapeFix_Wire*)$self->Access();
    }
};

%extend Handle_ShapeFix_Wire {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_Wire {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor ShapeFix_Wireframe;
class ShapeFix_Wireframe : public ShapeFix_Root {
	public:
		%feature("compactdefaultargs") ShapeFix_Wireframe;
		%feature("autodoc", "	:rtype: None
") ShapeFix_Wireframe;
		 ShapeFix_Wireframe ();
		%feature("compactdefaultargs") ShapeFix_Wireframe;
		%feature("autodoc", "	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") ShapeFix_Wireframe;
		 ShapeFix_Wireframe (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") ClearStatuses;
		%feature("autodoc", "	* Clears all statuses

	:rtype: void
") ClearStatuses;
		virtual void ClearStatuses ();
		%feature("compactdefaultargs") Load;
		%feature("autodoc", "	* Loads a shape, resets statuses

	:param shape:
	:type shape: TopoDS_Shape &
	:rtype: None
") Load;
		void Load (const TopoDS_Shape & shape);
		%feature("compactdefaultargs") FixWireGaps;
		%feature("autodoc", "	* Fixes gaps between ends of curves of adjacent edges (both 3d and pcurves) in wires If precision is 0.0, uses Precision::Confusion().

	:rtype: bool
") FixWireGaps;
		Standard_Boolean FixWireGaps ();
		%feature("compactdefaultargs") FixSmallEdges;
		%feature("autodoc", "	* Fixes small edges in shape by merging adjacent edges If precision is 0.0, uses Precision::Confusion().

	:rtype: bool
") FixSmallEdges;
		Standard_Boolean FixSmallEdges ();
		%feature("compactdefaultargs") CheckSmallEdges;
		%feature("autodoc", "	* Auxiliary tool for FixSmallEdges which checks for small edges and fills the maps. Returns True if at least one small edge has been found.

	:param theSmallEdges:
	:type theSmallEdges: TopTools_MapOfShape &
	:param theEdgeToFaces:
	:type theEdgeToFaces: TopTools_DataMapOfShapeListOfShape &
	:param theFaceWithSmall:
	:type theFaceWithSmall: TopTools_DataMapOfShapeListOfShape &
	:param theMultyEdges:
	:type theMultyEdges: TopTools_MapOfShape &
	:rtype: bool
") CheckSmallEdges;
		Standard_Boolean CheckSmallEdges (TopTools_MapOfShape & theSmallEdges,TopTools_DataMapOfShapeListOfShape & theEdgeToFaces,TopTools_DataMapOfShapeListOfShape & theFaceWithSmall,TopTools_MapOfShape & theMultyEdges);
		%feature("compactdefaultargs") MergeSmallEdges;
		%feature("autodoc", "	* Auxiliary tool for FixSmallEdges which merges small edges. If theModeDrop is equal to Standard_True then small edges, which cannot be connected with adjacent edges are dropped. Otherwise they are kept. theLimitAngle specifies maximum allowed tangency discontinuity between adjacent edges. If theLimitAngle is equal to -1, this angle is not taken into account.

	:param theSmallEdges:
	:type theSmallEdges: TopTools_MapOfShape &
	:param theEdgeToFaces:
	:type theEdgeToFaces: TopTools_DataMapOfShapeListOfShape &
	:param theFaceWithSmall:
	:type theFaceWithSmall: TopTools_DataMapOfShapeListOfShape &
	:param theMultyEdges:
	:type theMultyEdges: TopTools_MapOfShape &
	:param theModeDrop: default value is Standard_False
	:type theModeDrop: bool
	:param theLimitAngle: default value is -1
	:type theLimitAngle: float
	:rtype: bool
") MergeSmallEdges;
		Standard_Boolean MergeSmallEdges (TopTools_MapOfShape & theSmallEdges,TopTools_DataMapOfShapeListOfShape & theEdgeToFaces,TopTools_DataMapOfShapeListOfShape & theFaceWithSmall,TopTools_MapOfShape & theMultyEdges,const Standard_Boolean theModeDrop = Standard_False,const Standard_Real theLimitAngle = -1);
		%feature("compactdefaultargs") StatusWireGaps;
		%feature("autodoc", "	* Decodes the status of the last FixWireGaps. OK - No gaps were found DONE1 - Some gaps in 3D were fixed DONE2 - Some gaps in 2D were fixed FAIL1 - Failed to fix some gaps in 3D FAIL2 - Failed to fix some gaps in 2D

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusWireGaps;
		Standard_Boolean StatusWireGaps (const ShapeExtend_Status status);
		%feature("compactdefaultargs") StatusSmallEdges;
		%feature("autodoc", "	* Decodes the status of the last FixSmallEdges. OK - No small edges were found DONE1 - Some small edges were fixed FAIL1 - Failed to fix some small edges

	:param status:
	:type status: ShapeExtend_Status
	:rtype: bool
") StatusSmallEdges;
		Standard_Boolean StatusSmallEdges (const ShapeExtend_Status status);
		%feature("compactdefaultargs") Shape;
		%feature("autodoc", "	:rtype: TopoDS_Shape
") Shape;
		TopoDS_Shape Shape ();

            %feature("autodoc","1");
            %extend {
                Standard_Boolean GetModeDropSmallEdges() {
                return (Standard_Boolean) $self->ModeDropSmallEdges();
                }
            };
            %feature("autodoc","1");
            %extend {
                void SetModeDropSmallEdges(Standard_Boolean value ) {
                $self->ModeDropSmallEdges()=value;
                }
            };
            		%feature("compactdefaultargs") SetLimitAngle;
		%feature("autodoc", "	* Set limit angle for merging edges.

	:param theLimitAngle:
	:type theLimitAngle: float
	:rtype: None
") SetLimitAngle;
		void SetLimitAngle (const Standard_Real theLimitAngle);
		%feature("compactdefaultargs") LimitAngle;
		%feature("autodoc", "	* Get limit angle for merging edges.

	:rtype: float
") LimitAngle;
		Standard_Real LimitAngle ();
};


%extend ShapeFix_Wireframe {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_ShapeFix_Wireframe(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_ShapeFix_Wireframe::Handle_ShapeFix_Wireframe %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_ShapeFix_Wireframe;
class Handle_ShapeFix_Wireframe : public Handle_ShapeFix_Root {

    public:
        // constructors
        Handle_ShapeFix_Wireframe();
        Handle_ShapeFix_Wireframe(const Handle_ShapeFix_Wireframe &aHandle);
        Handle_ShapeFix_Wireframe(const ShapeFix_Wireframe *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_ShapeFix_Wireframe DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_ShapeFix_Wireframe {
    ShapeFix_Wireframe* _get_reference() {
    return (ShapeFix_Wireframe*)$self->Access();
    }
};

%extend Handle_ShapeFix_Wireframe {
    %pythoncode {
        def GetObject(self):
            obj = self._get_reference()
            register_handle(self, obj)
            return obj
    }
};

%extend ShapeFix_Wireframe {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
