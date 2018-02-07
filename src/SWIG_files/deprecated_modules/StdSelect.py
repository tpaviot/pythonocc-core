import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StdSelect is deprecated since pythonocc-0.18.2. Use OCC.Core.StdSelect", DeprecationWarning)

from OCC.Core.StdSelect import *
