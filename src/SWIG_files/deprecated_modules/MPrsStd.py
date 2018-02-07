import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MPrsStd is deprecated since pythonocc-0.18.2. Use OCC.Core.MPrsStd", DeprecationWarning)

from OCC.Core.MPrsStd import *
