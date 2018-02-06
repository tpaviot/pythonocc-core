import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.SelectMgr is deprecated since pythonocc-0.18.2. Use OCC.Core.SelectMgr", DeprecationWarning)

from OCC.Core.SelectMgr import *
