import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TPrsStd is deprecated since pythonocc-0.18.2. Use OCC.Core.TPrsStd", DeprecationWarning)

from OCC.Core.TPrsStd import *
