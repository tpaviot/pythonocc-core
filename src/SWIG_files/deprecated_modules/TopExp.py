import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopExp is deprecated since pythonocc-0.18.2. Use OCC.Core.TopExp", DeprecationWarning)

from OCC.Core.TopExp import *
