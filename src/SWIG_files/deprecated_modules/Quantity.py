import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Quantity is deprecated since pythonocc-0.18.2. Use OCC.Core.Quantity", DeprecationWarning)

from OCC.Core.Quantity import *
