import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Storage is deprecated since pythonocc-0.18.2. Use OCC.Core.Storage", DeprecationWarning)

from OCC.Core.Storage import *
