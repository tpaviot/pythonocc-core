/*
Copyright 2008-2015 Thomas Paviot (tpaviot@gmail.com)


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
%module (package="OCC") PrsMgr

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


%include PrsMgr_headers.i


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
typedef Handle_PrsMgr_PresentationManager Handle_PrsMgr_PresentationManager3d;
typedef PrsMgr_PresentableObject * PrsMgr_PresentableObjectPointer;
typedef PrsMgr_Presentation PrsMgr_Presentation3d;
typedef PrsMgr_Presentation * PrsMgr_PresentationPointer;
typedef NCollection_List <Handle_Prs3d_Presentation> PrsMgr_ListOfPresentations;
typedef Handle_PrsMgr_Presentation Handle_PrsMgr_Presentation3d;
typedef PrsMgr_PresentationManager PrsMgr_PresentationManager3d;
/* end typedefs declaration */

/* public enums */
enum PrsMgr_TypeOfPresentation3d {
	PrsMgr_TOP_AllView = 0,
	PrsMgr_TOP_ProjectorDependant = 1,
};

/* end public enums declaration */

%nodefaultctor PrsMgr_ModedPresentation;
class PrsMgr_ModedPresentation {
	public:
		%feature("compactdefaultargs") PrsMgr_ModedPresentation;
		%feature("autodoc", "	:rtype: None
") PrsMgr_ModedPresentation;
		 PrsMgr_ModedPresentation ();
		%feature("compactdefaultargs") PrsMgr_ModedPresentation;
		%feature("autodoc", "	:param thePrs:
	:type thePrs: Handle_PrsMgr_Presentation &
	:param theMode:
	:type theMode: int
	:rtype: None
") PrsMgr_ModedPresentation;
		 PrsMgr_ModedPresentation (const Handle_PrsMgr_Presentation & thePrs,const Standard_Integer theMode);
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	:rtype: Handle_PrsMgr_Presentation
") Presentation;
		Handle_PrsMgr_Presentation Presentation ();
		%feature("compactdefaultargs") Mode;
		%feature("autodoc", "	:rtype: int
") Mode;
		Standard_Integer Mode ();
};


%nodefaultctor PrsMgr_Presentation;
class PrsMgr_Presentation : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") Destroy;
		%feature("autodoc", "	* Destructor

	:rtype: void
") Destroy;
		virtual void Destroy ();
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	:rtype: Handle_Prs3d_Presentation
") Presentation;
		Handle_Prs3d_Presentation Presentation ();
		%feature("compactdefaultargs") PresentationManager;
		%feature("autodoc", "	* returns the PresentationManager in which the presentation has been created.

	:rtype: Handle_PrsMgr_PresentationManager
") PresentationManager;
		Handle_PrsMgr_PresentationManager PresentationManager ();
		%feature("compactdefaultargs") SetUpdateStatus;
		%feature("autodoc", "	:param theStat:
	:type theStat: bool
	:rtype: None
") SetUpdateStatus;
		void SetUpdateStatus (const Standard_Boolean theStat);
		%feature("compactdefaultargs") MustBeUpdated;
		%feature("autodoc", "	:rtype: bool
") MustBeUpdated;
		Standard_Boolean MustBeUpdated ();
};


%extend PrsMgr_Presentation {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_Presentation(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_Presentation::Handle_PrsMgr_Presentation %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PrsMgr_Presentation;
class Handle_PrsMgr_Presentation : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_PrsMgr_Presentation();
        Handle_PrsMgr_Presentation(const Handle_PrsMgr_Presentation &aHandle);
        Handle_PrsMgr_Presentation(const PrsMgr_Presentation *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_Presentation DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_Presentation {
    PrsMgr_Presentation* GetObject() {
    return (PrsMgr_Presentation*)$self->Access();
    }
};

%nodefaultctor PrsMgr_PresentationManager;
class PrsMgr_PresentationManager : public MMgt_TShared {
	public:
		%feature("compactdefaultargs") PrsMgr_PresentationManager;
		%feature("autodoc", "	* Creates a framework to manage displays and graphic entities with the 3D view theStructureManager.

	:param theStructureManager:
	:type theStructureManager: Handle_Graphic3d_StructureManager &
	:rtype: None
") PrsMgr_PresentationManager;
		 PrsMgr_PresentationManager (const Handle_Graphic3d_StructureManager & theStructureManager);
		%feature("compactdefaultargs") Display;
		%feature("autodoc", "	* Displays the presentation of the object in the given Presentation manager with the given mode. The mode should be enumerated by the object which inherits PresentableObject.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Display;
		void Display (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") Erase;
		%feature("autodoc", "	* erases the presentation of the object in the given Presentation manager with the given mode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Erase;
		void Erase (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	* Clears the presentation of the presentable object thePrsObject in this framework with the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: void
") Clear;
		virtual void Clear (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") SetVisibility;
		%feature("autodoc", "	* Sets the visibility of presentable object.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode:
	:type theMode: int
	:param theValue:
	:type theValue: bool
	:rtype: None
") SetVisibility;
		void SetVisibility (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode,const Standard_Boolean theValue);
		%feature("compactdefaultargs") Highlight;
		%feature("autodoc", "	* Highlights the presentation of the presentable object thePrsObject in this framework with the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Highlight;
		void Highlight (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") Unhighlight;
		%feature("autodoc", "	* Removes highlighting from the presentation of the presentable object thePrsObject in this framework with the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Unhighlight;
		void Unhighlight (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") SetDisplayPriority;
		%feature("autodoc", "	* Sets the display priority theNewPrior of the presentable object thePrsObject in this framework with the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode:
	:type theMode: int
	:param theNewPrior:
	:type theNewPrior: int
	:rtype: None
") SetDisplayPriority;
		void SetDisplayPriority (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode,const Standard_Integer theNewPrior);
		%feature("compactdefaultargs") DisplayPriority;
		%feature("autodoc", "	* Returns the display priority of the presentable object thePrsObject in this framework with the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode:
	:type theMode: int
	:rtype: int
") DisplayPriority;
		Standard_Integer DisplayPriority (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode);
		%feature("compactdefaultargs") SetZLayer;
		%feature("autodoc", "	* Set Z layer ID for all presentations of the object.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theLayerId:
	:type theLayerId: int
	:rtype: None
") SetZLayer;
		void SetZLayer (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theLayerId);
		%feature("compactdefaultargs") GetZLayer;
		%feature("autodoc", "	* Get Z layer ID assigned to all presentations of the object. Method returns -1 value if object has no presentations and is impossible to get layer index.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:rtype: int
") GetZLayer;
		Standard_Integer GetZLayer (const Handle_PrsMgr_PresentableObject & thePrsObject);
		%feature("compactdefaultargs") IsDisplayed;
		%feature("autodoc", "	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") IsDisplayed;
		Standard_Boolean IsDisplayed (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") IsHighlighted;
		%feature("autodoc", "	* Returns true if the presentation of the presentable object thePrsObject in this framework with the display mode theMode is highlighted.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") IsHighlighted;
		Standard_Boolean IsHighlighted (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") Update;
		%feature("autodoc", "	* Updates the presentation of the presentable object thePrsObject in this framework with the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Update;
		void Update (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") BeginImmediateDraw;
		%feature("autodoc", "	* Resets the transient list of presentations previously displayed in immediate mode and begins accumulation of new list by following AddToImmediateList()/Color()/Highlight() calls.

	:rtype: None
") BeginImmediateDraw;
		void BeginImmediateDraw ();
		%feature("compactdefaultargs") ClearImmediateDraw;
		%feature("autodoc", "	* Resets the transient list of presentations previously displayed in immediate mode.

	:rtype: None
") ClearImmediateDraw;
		void ClearImmediateDraw ();
		%feature("compactdefaultargs") AddToImmediateList;
		%feature("autodoc", "	* Stores thePrs in the transient list of presentations to be displayed in immediate mode. Will be taken in account in EndImmediateDraw method.

	:param thePrs:
	:type thePrs: Handle_Prs3d_Presentation &
	:rtype: None
") AddToImmediateList;
		void AddToImmediateList (const Handle_Prs3d_Presentation & thePrs);
		%feature("compactdefaultargs") EndImmediateDraw;
		%feature("autodoc", "	* Allows rapid drawing of the view theView by avoiding an update of the whole background.

	:param theView:
	:type theView: Handle_V3d_View &
	:rtype: None
") EndImmediateDraw;
		void EndImmediateDraw (const Handle_V3d_View & theView);
		%feature("compactdefaultargs") IsImmediateModeOn;
		%feature("autodoc", "	* Returns true if Presentation Manager is accumulating transient list of presentations to be displayed in immediate mode.

	:rtype: bool
") IsImmediateModeOn;
		Standard_Boolean IsImmediateModeOn ();
		%feature("compactdefaultargs") Color;
		%feature("autodoc", "	* Highlights the graphic object thePrsObject in the color theColor. thePrsObject has the display mode theMode; this has the default value of 0, that is, the wireframe display mode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theColor: default value is Quantity_NOC_YELLOW
	:type theColor: Quantity_NameOfColor
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Color;
		void Color (const Handle_PrsMgr_PresentableObject & thePrsObject,const Quantity_NameOfColor theColor = Quantity_NOC_YELLOW,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") BoundBox;
		%feature("autodoc", "	* highlights the boundbox of the presentation

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") BoundBox;
		void BoundBox (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") Connect;
		%feature("autodoc", "	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theOtherObject:
	:type theOtherObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:param theOtherMode: default value is 0
	:type theOtherMode: int
	:rtype: None
") Connect;
		void Connect (const Handle_PrsMgr_PresentableObject & thePrsObject,const Handle_PrsMgr_PresentableObject & theOtherObject,const Standard_Integer theMode = 0,const Standard_Integer theOtherMode = 0);
		%feature("compactdefaultargs") Transform;
		%feature("autodoc", "	* Sets the transformation theTransformation for the presentable object thePrsObject. thePrsObject has the display mode theMode; this has the default value of 0, that is, the wireframe display mode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theTransformation:
	:type theTransformation: Handle_Geom_Transformation &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") Transform;
		void Transform (const Handle_PrsMgr_PresentableObject & thePrsObject,const Handle_Geom_Transformation & theTransformation,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") StructureManager;
		%feature("autodoc", "	* Returns the structure manager.

	:rtype: Handle_Graphic3d_StructureManager
") StructureManager;
		Handle_Graphic3d_StructureManager StructureManager ();
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "	* this method will change the color and the aspect of the presentations containing shaded structures.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theColor:
	:type theColor: Quantity_NameOfColor
	:param theMaterial:
	:type theMaterial: Graphic3d_NameOfMaterial
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") SetShadingAspect;
		void SetShadingAspect (const Handle_PrsMgr_PresentableObject & thePrsObject,const Quantity_NameOfColor theColor,const Graphic3d_NameOfMaterial theMaterial,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") SetShadingAspect;
		%feature("autodoc", "	* this method will change the color and the aspect of the presentations containing shaded structures.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theShadingAspect:
	:type theShadingAspect: Handle_Prs3d_ShadingAspect &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: None
") SetShadingAspect;
		void SetShadingAspect (const Handle_PrsMgr_PresentableObject & thePrsObject,const Handle_Prs3d_ShadingAspect & theShadingAspect,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") HasPresentation;
		%feature("autodoc", "	* Returns true if there is a presentation of the presentable object thePrsObject in this framework, thePrsObject having the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: bool
") HasPresentation;
		Standard_Boolean HasPresentation (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
		%feature("compactdefaultargs") Presentation;
		%feature("autodoc", "	* Returns the presentation Presentation of the presentable object thePrsObject in this framework. thePrsObject has the display mode theMode.

	:param thePrsObject:
	:type thePrsObject: Handle_PrsMgr_PresentableObject &
	:param theMode: default value is 0
	:type theMode: int
	:rtype: Handle_PrsMgr_Presentation
") Presentation;
		Handle_PrsMgr_Presentation Presentation (const Handle_PrsMgr_PresentableObject & thePrsObject,const Standard_Integer theMode = 0);
};


%extend PrsMgr_PresentationManager {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_PresentationManager(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_PresentationManager::Handle_PrsMgr_PresentationManager %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PrsMgr_PresentationManager;
class Handle_PrsMgr_PresentationManager : public Handle_MMgt_TShared {

    public:
        // constructors
        Handle_PrsMgr_PresentationManager();
        Handle_PrsMgr_PresentationManager(const Handle_PrsMgr_PresentationManager &aHandle);
        Handle_PrsMgr_PresentationManager(const PrsMgr_PresentationManager *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_PresentationManager DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_PresentationManager {
    PrsMgr_PresentationManager* GetObject() {
    return (PrsMgr_PresentationManager*)$self->Access();
    }
};

%nodefaultctor PrsMgr_Presentations;
class PrsMgr_Presentations : public TCollection_BaseSequence {
	public:
		%feature("compactdefaultargs") PrsMgr_Presentations;
		%feature("autodoc", "	:rtype: None
") PrsMgr_Presentations;
		 PrsMgr_Presentations ();
		%feature("compactdefaultargs") PrsMgr_Presentations;
		%feature("autodoc", "	:param Other:
	:type Other: PrsMgr_Presentations &
	:rtype: None
") PrsMgr_Presentations;
		 PrsMgr_Presentations (const PrsMgr_Presentations & Other);
		%feature("compactdefaultargs") Clear;
		%feature("autodoc", "	:rtype: None
") Clear;
		void Clear ();
		%feature("compactdefaultargs") Assign;
		%feature("autodoc", "	:param Other:
	:type Other: PrsMgr_Presentations &
	:rtype: PrsMgr_Presentations
") Assign;
		const PrsMgr_Presentations & Assign (const PrsMgr_Presentations & Other);
		%feature("compactdefaultargs") operator =;
		%feature("autodoc", "	:param Other:
	:type Other: PrsMgr_Presentations &
	:rtype: PrsMgr_Presentations
") operator=;
		const PrsMgr_Presentations & operator = (const PrsMgr_Presentations & Other);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param T:
	:type T: PrsMgr_ModedPresentation &
	:rtype: None
") Append;
		void Append (const PrsMgr_ModedPresentation & T);
		%feature("compactdefaultargs") Append;
		%feature("autodoc", "	:param S:
	:type S: PrsMgr_Presentations &
	:rtype: None
") Append;
		void Append (PrsMgr_Presentations & S);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param T:
	:type T: PrsMgr_ModedPresentation &
	:rtype: None
") Prepend;
		void Prepend (const PrsMgr_ModedPresentation & T);
		%feature("compactdefaultargs") Prepend;
		%feature("autodoc", "	:param S:
	:type S: PrsMgr_Presentations &
	:rtype: None
") Prepend;
		void Prepend (PrsMgr_Presentations & S);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: PrsMgr_ModedPresentation &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,const PrsMgr_ModedPresentation & T);
		%feature("compactdefaultargs") InsertBefore;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: PrsMgr_Presentations &
	:rtype: None
") InsertBefore;
		void InsertBefore (const Standard_Integer Index,PrsMgr_Presentations & S);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param T:
	:type T: PrsMgr_ModedPresentation &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,const PrsMgr_ModedPresentation & T);
		%feature("compactdefaultargs") InsertAfter;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param S:
	:type S: PrsMgr_Presentations &
	:rtype: None
") InsertAfter;
		void InsertAfter (const Standard_Integer Index,PrsMgr_Presentations & S);
		%feature("compactdefaultargs") First;
		%feature("autodoc", "	:rtype: PrsMgr_ModedPresentation
") First;
		const PrsMgr_ModedPresentation & First ();
		%feature("compactdefaultargs") Last;
		%feature("autodoc", "	:rtype: PrsMgr_ModedPresentation
") Last;
		const PrsMgr_ModedPresentation & Last ();
		%feature("compactdefaultargs") Split;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param Sub:
	:type Sub: PrsMgr_Presentations &
	:rtype: None
") Split;
		void Split (const Standard_Integer Index,PrsMgr_Presentations & Sub);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: PrsMgr_ModedPresentation
") Value;
		const PrsMgr_ModedPresentation & Value (const Standard_Integer Index);
		%feature("compactdefaultargs") SetValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:param I:
	:type I: PrsMgr_ModedPresentation &
	:rtype: None
") SetValue;
		void SetValue (const Standard_Integer Index,const PrsMgr_ModedPresentation & I);
		%feature("compactdefaultargs") ChangeValue;
		%feature("autodoc", "	:param Index:
	:type Index: int
	:rtype: PrsMgr_ModedPresentation
") ChangeValue;
		PrsMgr_ModedPresentation & ChangeValue (const Standard_Integer Index);
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


%nodefaultctor PrsMgr_Prs;
class PrsMgr_Prs : public Prs3d_Presentation {
	public:
		%feature("compactdefaultargs") PrsMgr_Prs;
		%feature("autodoc", "	:param theStructManager:
	:type theStructManager: Handle_Graphic3d_StructureManager &
	:param thePresentation:
	:type thePresentation: PrsMgr_PresentationPointer &
	:param theTypeOfPresentation3d:
	:type theTypeOfPresentation3d: PrsMgr_TypeOfPresentation3d
	:rtype: None
") PrsMgr_Prs;
		 PrsMgr_Prs (const Handle_Graphic3d_StructureManager & theStructManager,const PrsMgr_PresentationPointer & thePresentation,const PrsMgr_TypeOfPresentation3d theTypeOfPresentation3d);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:rtype: None
") Compute;
		void Compute ();
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* the 'degenerated' Structure is displayed with a transformation defined by <AMatrix> which is not a Pure Translation. We have to take in account this Transformation in the computation of hidden line removal... returns a filled Graphic Structure.

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:rtype: Handle_Graphic3d_Structure
") Compute;
		Handle_Graphic3d_Structure Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* No need to return a structure, just to fill <ComputedStruct> ....

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param ComputedStruct:
	:type ComputedStruct: Handle_Graphic3d_Structure &
	:rtype: None
") Compute;
		void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,Handle_Graphic3d_Structure & ComputedStruct);
		%feature("compactdefaultargs") Compute;
		%feature("autodoc", "	* No Need to return a Structure, just to Fill <aStructure>. The Trsf has to be taken in account in the computation (Rotation Part....)

	:param aProjector:
	:type aProjector: Handle_Graphic3d_DataStructureManager &
	:param AMatrix:
	:type AMatrix: TColStd_Array2OfReal &
	:param aStructure:
	:type aStructure: Handle_Graphic3d_Structure &
	:rtype: None
") Compute;
		void Compute (const Handle_Graphic3d_DataStructureManager & aProjector,const TColStd_Array2OfReal & AMatrix,Handle_Graphic3d_Structure & aStructure);
};


%extend PrsMgr_Prs {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_Prs(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_Prs::Handle_PrsMgr_Prs %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PrsMgr_Prs;
class Handle_PrsMgr_Prs : public Handle_Prs3d_Presentation {

    public:
        // constructors
        Handle_PrsMgr_Prs();
        Handle_PrsMgr_Prs(const Handle_PrsMgr_Prs &aHandle);
        Handle_PrsMgr_Prs(const PrsMgr_Prs *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_Prs DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_Prs {
    PrsMgr_Prs* GetObject() {
    return (PrsMgr_Prs*)$self->Access();
    }
};

%nodefaultctor PrsMgr_SequenceNodeOfPresentations;
class PrsMgr_SequenceNodeOfPresentations : public TCollection_SeqNode {
	public:
		%feature("compactdefaultargs") PrsMgr_SequenceNodeOfPresentations;
		%feature("autodoc", "	:param I:
	:type I: PrsMgr_ModedPresentation &
	:param n:
	:type n: TCollection_SeqNodePtr &
	:param p:
	:type p: TCollection_SeqNodePtr &
	:rtype: None
") PrsMgr_SequenceNodeOfPresentations;
		 PrsMgr_SequenceNodeOfPresentations (const PrsMgr_ModedPresentation & I,const TCollection_SeqNodePtr & n,const TCollection_SeqNodePtr & p);
		%feature("compactdefaultargs") Value;
		%feature("autodoc", "	:rtype: PrsMgr_ModedPresentation
") Value;
		PrsMgr_ModedPresentation & Value ();
};


%extend PrsMgr_SequenceNodeOfPresentations {
	%pythoncode {
		def GetHandle(self):
		    try:
		        return self.thisHandle
		    except:
		        self.thisHandle = Handle_PrsMgr_SequenceNodeOfPresentations(self)
		        self.thisown = False
		        return self.thisHandle
	}
};

%pythonappend Handle_PrsMgr_SequenceNodeOfPresentations::Handle_PrsMgr_SequenceNodeOfPresentations %{
    # register the handle in the base object
    if len(args) > 0:
        register_handle(self, args[0])
%}

%nodefaultctor Handle_PrsMgr_SequenceNodeOfPresentations;
class Handle_PrsMgr_SequenceNodeOfPresentations : public Handle_TCollection_SeqNode {

    public:
        // constructors
        Handle_PrsMgr_SequenceNodeOfPresentations();
        Handle_PrsMgr_SequenceNodeOfPresentations(const Handle_PrsMgr_SequenceNodeOfPresentations &aHandle);
        Handle_PrsMgr_SequenceNodeOfPresentations(const PrsMgr_SequenceNodeOfPresentations *anItem);
        void Nullify();
        Standard_Boolean IsNull() const;
        static const Handle_PrsMgr_SequenceNodeOfPresentations DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_PrsMgr_SequenceNodeOfPresentations {
    PrsMgr_SequenceNodeOfPresentations* GetObject() {
    return (PrsMgr_SequenceNodeOfPresentations*)$self->Access();
    }
};

