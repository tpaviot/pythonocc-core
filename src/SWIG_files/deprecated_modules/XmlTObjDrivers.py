import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlTObjDrivers is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlTObjDrivers", DeprecationWarning)

from OCC.Core.XmlTObjDrivers import *
