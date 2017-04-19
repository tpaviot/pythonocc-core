LIST(APPEND OCE_TOOLKIT_MODEL
# TKERNEL
        FSD
        MMgt
        OSD
        Plugin
        Quantity
        Resource
        SortTools
        Standard
        StdFail
        Storage
        TColStd
        TCollection
        TShort
        Units
        UnitsAPI
        IncludeLibrary
        Dico
        NCollection
        Message
# TKMath
        math
        ElCLib
        ElSLib
        BSplCLib
        BSplSLib
        PLib
        Precision
        GeomAbs
        Poly
        CSLib
        Convert
        Bnd
        gp
        TColgp
        TopLoc
# TKAdvTools
        Dynamic
        Materials
        Expr
        ExprIntrp
        GraphDS
        GraphTools
# TKG2d
        Geom2d
        LProp
        TColGeom2d
        Adaptor2d
        Geom2dLProp
        Geom2dAdaptor
        GProp
# TKG3d
        Geom
        TColGeom
        GeomAdaptor
        AdvApprox
        GeomLProp
        Adaptor3d
        LProp3d
        TopAbs
# TKGeomBase
        ProjLib
        GeomProjLib
        GCPnts
        CPnts
        Approx
        AppParCurves
        FEmTool
        AppCont
        Extrema
        IntAna
        IntAna2d
        GeomConvert
        AdvApp2Var
        GeomLib
        Geom2dConvert
        Hermit
        BndLib
        AppDef
        GeomTools
        GC
        GCE2d
        gce
# TKBRep
        TopoDS
        TopExp
        TopTools
        BRep
        BRepLProp
        BRepAdaptor
        BRepTools
# TKGeomAlgo
        Hatch
        GeomInt
        IntStart
        IntWalk
        IntImp
        IntCurveSurface
        IntSurf
        IntPatch
        Geom2dInt
        IntImpParGen
        IntRes2d
        IntCurve
        TopTrans
        Intf
        ApproxInt
        GccAna
        GccEnt
        GccInt
        GccIter
        GccGeo
        HatchGen
        Geom2dHatch
        Law
        AppBlend
        Plate
        GeomPlate
        LocalAnalysis
        GeomAPI
        GeomFill
        Geom2dAPI
        Geom2dGcc
        FairCurve
        NLPlate
        IntPolyh
        TopClass
# TKTopAlgo
        IntCurvesFace
        MAT
        MAT2d
        Bisector
        BRepMAT2d
        BRepCheck
        BRepBndLib
        BRepExtrema
        BRepClass
        BRepClass3d
        BRepLib
        BRepGProp
        BRepIntCurveSurface
        BRepTopAdaptor
        BRepBuilderAPI
        BRepApprox
# TKPrim
        BRepPrim
        Primitives
        BRepSweep
        Sweep
        BRepPrimAPI
# TKBO
        IntTools
        BRepAlgoAPI
        BOPCol
        BOPInt
        BOPDS
        BOPAlgo
        BOPTools
# TKHLR
        HLRTopoBRep
        HLRBRep
        HLRAlgo
        HLRAppli
        Intrv
        TopBas
        TopCnx
        Contap
# TKMesh
        BRepMesh
        IntPoly
# TKShHealing
        ShapeBuild
        ShapeExtend
        ShapeConstruct
        ShapeCustom
        ShapeAnalysis
        ShapeFix
        ShapeUpgrade
        ShapeAlgo
        ShapeProcess
        ShapeProcessAPI
# TKXMesh
        XBRepMesh
# TKBool
        TopOpeBRep
        TopOpeBRepDS
        TopOpeBRepBuild
        TopOpeBRepTool
        BRepAlgo
        BRepFill
        BRepProj
# TKFillet
        ChFiDS
        ChFi2d
        ChFi3d
        ChFiKPart
        Blend
        BRepBlend
        BlendFunc
        BRepFilletAPI
        FilletSurf
# TKFeat
        LocOpe
        BRepFeat
# TKOffset
        BRepOffsetAPI
        Draft
        BRepOffset
        BiTgte
)

LIST(APPEND OCE_TOOLKIT_VISUALIZATION
# TKVoxel
        Voxel
# TKMeshVS
        MeshVS
# TKService
        Aspect
        SelectBasics
        Image
        InterfaceGraphic
        TColQuantity
# TKNIS
        NIS
# TKV3d
        V3d
        Graphic3d
        Visual3d
        Select3D
        Prs3d
        StdPrs
        SelectMgr
        PrsMgr
        AIS
        DsgPrs
        StdSelect
        )

LIST(APPEND OCE_TOOLKIT_DATAEXCHANGE
# TKIGES
        IGESControl
# TKSTEPAttr
        RWStepDimTol
        RWStepVisual
        StepDimTol
        StepVisual
# TKSTEP
        StepAP214
        RWStepAP214
        StepAP203
        RWStepAP203
        STEPConstruct
        STEPEdit
        GeomToStep
        StepToGeom
        StepToTopoDS
        TopoDSToStep
        STEPControl
        STEPSelections
        StepAP209
# TKSTEP209
        RWStepElement
        RWStepFEA
        StepElement
        StepFEA
# TKSTL
        StlMesh
        StlAPI
        StlTransfer
        RWStl
# TKSTEPBase
        StepBasic
        RWStepBasic
        StepRepr
        RWStepRepr
        StepGeom
        RWStepGeom
        StepShape
        RWStepShape
# TKXSBase
        Interface
        IFSelect
        XSControl
        )

LIST(APPEND OCE_TOOLKIT_OCAF
# TKCAF
        TDataXtd
        TNaming
        TPrsStd
        AppStd
# TKLCAF
        TDF
        TDataStd
        TFunction
        TDocStd
        AppStdL
# TKCDF
        CDF
        CDM
        PCDM
        UTL
# TKXCAF
        XCAFApp
        XCAFDoc
        XCAFPrs
# TKXDESTEP
        STEPCAFControl
# TKXDEIGES
        IGESCAFControl
        )
