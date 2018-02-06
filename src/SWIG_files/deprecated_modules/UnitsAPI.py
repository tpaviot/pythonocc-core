import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.UnitsAPI is deprecated since pythonocc-0.18.2. Use OCC.Core.UnitsAPI", DeprecationWarning)

from OCC.Core.UnitsAPI import *
