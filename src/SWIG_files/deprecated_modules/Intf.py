import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Intf is deprecated since pythonocc-0.18.2. Use OCC.Core.Intf", DeprecationWarning)

from OCC.Core.Intf import *
