import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StlAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.StlAPI", DeprecationWarning)

from OCC.Core.StlAPI import *
