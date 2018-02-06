import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.AdvApprox is deprecated since pythonocc-0.18.2. Use OCC.Core.AdvApprox", DeprecationWarning)

from OCC.Core.AdvApprox import *
