import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IVtkTools is deprecated since pythonocc-0.18.2. Use OCC.Core.IVtkTools", DeprecationWarning)

from OCC.Core.IVtkTools import *
