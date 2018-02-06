import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopTools is deprecated since pythonocc-0.18.2. Use OCC.Core.TopTools", DeprecationWarning)

from OCC.Core.TopTools import *
