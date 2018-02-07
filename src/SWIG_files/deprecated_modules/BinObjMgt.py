import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BinObjMgt is deprecated since pythonocc-0.18.2. Use OCC.Core.BinObjMgt", DeprecationWarning)

from OCC.Core.BinObjMgt import *
