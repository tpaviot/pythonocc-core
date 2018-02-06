import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TColQuantity is deprecated since pythonocc-0.18.2. Use OCC.Core.TColQuantity", DeprecationWarning)

from OCC.Core.TColQuantity import *
