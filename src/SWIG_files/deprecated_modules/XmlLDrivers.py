import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlLDrivers is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlLDrivers", DeprecationWarning)

from OCC.Core.XmlLDrivers import *
