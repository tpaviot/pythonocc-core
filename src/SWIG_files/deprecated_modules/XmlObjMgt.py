import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.XmlObjMgt is deprecated since pythonocc-0.18.2. Use OCC.Core.XmlObjMgt", DeprecationWarning)

from OCC.Core.XmlObjMgt import *
