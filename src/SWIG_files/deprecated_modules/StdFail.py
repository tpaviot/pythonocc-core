import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StdFail is deprecated since pythonocc-0.18.2. Use OCC.Core.StdFail", DeprecationWarning)

from OCC.Core.StdFail import *
