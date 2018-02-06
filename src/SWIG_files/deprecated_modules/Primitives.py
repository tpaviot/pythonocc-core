import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Primitives is deprecated since pythonocc-0.18.2. Use OCC.Core.Primitives", DeprecationWarning)

from OCC.Core.Primitives import *
