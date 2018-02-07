import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ChFiKPart is deprecated since pythonocc-0.18.2. Use OCC.Core.ChFiKPart", DeprecationWarning)

from OCC.Core.ChFiKPart import *
