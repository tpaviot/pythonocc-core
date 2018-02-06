import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TColStd is deprecated since pythonocc-0.18.2. Use OCC.Core.TColStd", DeprecationWarning)

from OCC.Core.TColStd import *
