import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.IntImp is deprecated since pythonocc-0.18.2. Use OCC.Core.IntImp", DeprecationWarning)

from OCC.Core.IntImp import *
