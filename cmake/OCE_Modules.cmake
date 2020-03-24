LIST(APPEND OCE_TOOLKIT_MODEL

# TKernel
	FSD
	MMgt
	Message
	NCollection
	OSD
	Plugin
	Quantity
	Resource
	Standard
	StdFail
	Storage
	TColStd
	TCollection
	TShort
	Units
	UnitsAPI
# TKMath
	BSplCLib
	BSplSLib
	BVH
	Bnd
	CSLib
	Convert
	ElCLib
	ElSLib
	Expr
	ExprIntrp
	GeomAbs
	PLib
	Poly
	Precision
	TColgp
	TopLoc
	gp
	math
# TKBRep
	TopoDS
	TopExp
	TopTools
	BRep
	BRepLProp
	BRepAdaptor
	BRepTools
	BinTools
# TKG2d
	Geom2d
	LProp
	TColGeom2d
	Adaptor2d
	Geom2dLProp
	Geom2dAdaptor
	Geom2dEvaluator
# TKG3d
	Geom
	GProp
	TColGeom
	GeomAdaptor
	AdvApprox
	GeomLProp
	Adaptor3d
	LProp3d
	TopAbs
	GeomEvaluator
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
# TKBO
	IntTools
	BRepAlgoAPI
	BOPDS
	BOPAlgo
	BOPTools
# TKBool
	TopOpeBRep
	TopOpeBRepDS
	TopOpeBRepBuild
	TopOpeBRepTool
	BRepAlgo
	BRepFill
	BRepProj
# TKFeat
	LocOpe
	BRepFeat
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
	BRepMeshData
	IMeshTools
	IMeshData
# TKOffset
	BRepOffsetAPI
	Draft
	BRepOffset
	BiTgte
# TKPrim
	BRepPrim
	BRepSweep
	Sweep
	BRepPrimAPI
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
# TKXMesh
	XBRepMesh
)

LIST(APPEND OCE_TOOLKIT_VISUALIZATION

# TKService
	Aspect
	Image
	InterfaceGraphic
	Media
	TColQuantity
# TKV3d
	AIS
	DsgPrs
	Graphic3d
	Prs3d
	PrsMgr
	Select3D
	SelectBasics
	SelectMgr
	StdPrs
	StdSelect
	V3d
# TKMeshVS
	MeshVS
)

LIST(APPEND OCE_TOOLKIT_DATAEXCHANGE

# TKBinXCAF
	BinXCAFDrivers
	BinMXCAFDoc
# TKIGES
	IGESControl
	IGESData
	IGESToBRep
# TKRWMesh
	RWGltf
	RWObj
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
	RWStepAP242
	StepAP242
# TKSTEP209
	RWStepElement
	RWStepFEA
	StepElement
	StepFEA
# TKSTEPAttr
	RWStepDimTol
	RWStepVisual
	StepDimTol
	StepVisual
# TKSTEPBase
	StepBasic
	RWStepBasic
	StepRepr
	RWStepRepr
	StepGeom
	RWStepGeom
	StepShape
	RWStepShape
	StepData
# TKSTL
	StlAPI
	RWStl
# TKVRML
	Vrml
	VrmlAPI
	VrmlConverter
	VrmlData
# TKXCAF
	XCAFApp
	XCAFDimTolObjects
	XCAFDoc
	XCAFPrs
	XCAFView
	XCAFNoteObjects
# TKXDEIGES
	IGESCAFControl
# TKXDESTEP
	STEPCAFControl
# TKXSBase
	Interface
	IFSelect
	XSControl
	Transfer
	TransferBRep
	MoniTool
# TKXmlXCAF
	XmlXCAFDrivers
	XmlMXCAFDoc
)

LIST(APPEND OCE_TOOLKIT_OCAF

# TKBin
	BinDrivers
	BinMDataXtd
	BinMNaming
# TKBinL
	BinLDrivers
	BinMDF
	BinMDataStd
	BinMDocStd
	BinMFunction
	BinObjMgt
# TKBinTObj
	BinTObjDrivers
# TKCAF
	TDataXtd
	TNaming
	AppStd
# TKCDF
	CDF
	CDM
	LDOM
	PCDM
	UTL
# TKLCAF
	TDF
	TDataStd
	TFunction
	TDocStd
	AppStdL
# TKTObj
	TObj
# TKVAF
	TPrsStd
# TKXml
	XmlDrivers
	XmlMDataXtd
	XmlMNaming
# TKXmlL
	XmlLDrivers
	XmlMDF
	XmlMDataStd
	XmlMDocStd
	XmlMFunction
	XmlObjMgt
# TKXmlTObj
	XmlTObjDrivers
)
