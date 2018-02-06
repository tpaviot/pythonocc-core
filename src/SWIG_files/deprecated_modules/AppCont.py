import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.AppCont is deprecated since pythonocc-0.18.2. Use OCC.Core.AppCont", DeprecationWarning)

from OCC.Core.AppCont import *
