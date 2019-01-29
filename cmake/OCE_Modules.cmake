LIST(APPEND OCE_TOOLKIT_MODEL
# TKernel
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
	BVH
	Expr
	ExprIntrp
# TKG2d
	Geom2d
	LProp
	TColGeom2d
	Adaptor2d
	Geom2dLProp
	Geom2dAdaptor
	GProp
	Geom2dEvaluator
# TKG3d
	Geom
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
# TKBRep
	TopoDS
	TopExp
	TopTools
	BRep
	BRepLProp
	BRepAdaptor
	BRepTools
	BinTools
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
	BRepSweep
	Sweep
	BRepPrimAPI
# TKBO
	IntTools
	BRepAlgoAPI
	BOPCol
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
# TKService
	Aspect
	SelectBasics
	Image
	InterfaceGraphic
	TColQuantity
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
# TKMeshVS
	MeshVS
)

LIST(APPEND OCE_TOOLKIT_DATAEXCHANGE
# TKSTL
	StlAPI
	RWStl
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
# TKIGES
	IGESControl
	IGESData
# TKXSBase
	Interface
	IFSelect
	XSControl
	Transfer
	TransferBRep
# TKVRML
	Vrml
	VrmlAPI
	VrmlConverter
	VrmlData
)

LIST(APPEND OCE_TOOLKIT_OCAF
# TKCAF
	TDataXtd
	TNaming
	TPrsStd
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
# TKBinXCAF
	BinXCAFDrivers
	BinMXCAFDoc
# TKXml
	XmlDrivers
	XmlMDataXtd
	XmlMNaming
	XmlMPrsStd
# TKXmlL
	XmlLDrivers
	XmlMDF
	XmlMDataStd
	XmlMDocStd
	XmlMFunction
	XmlObjMgt
# TKXmlTObj
	XmlTObjDrivers
# TKXmlXCAF
	XmlXCAFDrivers
	XmlMXCAFDoc
# TKPCAF
	MDataXtd
	MNaming
	MPrsStd
	PDataXtd
	PNaming
	PPrsStd
# TKPLCAF
	MDF
	MDataStd
	MDocStd
	MFunction
	PDF
	PDataStd
	PDocStd
	PFunction
# TKTObj
	TObj
# TKXCAF
	XCAFApp
	XCAFDimTolObjects
	XCAFDoc
	XCAFPrs
	XCAFView
# TKXDESTEP
	STEPCAFControl
# TKXDEIGES
	IGESCAFControl
)
