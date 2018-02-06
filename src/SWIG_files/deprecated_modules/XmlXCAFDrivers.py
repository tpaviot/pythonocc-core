import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlXCAFDrivers is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlXCAFDrivers", DeprecationWarning)

from OCC.Core.XmlXCAFDrivers import *
