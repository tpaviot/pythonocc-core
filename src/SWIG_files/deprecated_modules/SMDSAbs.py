import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.SMDSAbs is deprecated since pythonocc-0.18.2. Use OCC.Core.SMDSAbs", DeprecationWarning)

from OCC.Core.SMDSAbs import *
