import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.LocOpe is deprecated since pythonocc-0.18.2. Use OCC.Core.LocOpe", DeprecationWarning)

from OCC.Core.LocOpe import *
