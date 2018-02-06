import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.AdvApp2Var is deprecated since pythonocc-0.18.2. Use OCC.Core.AdvApp2Var", DeprecationWarning)

from OCC.Core.AdvApp2Var import *
