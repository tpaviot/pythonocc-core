import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.AppDef is deprecated since pythonocc-0.18.2. Use OCC.Core.AppDef", DeprecationWarning)

from OCC.Core.AppDef import *
