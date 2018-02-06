import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ExprIntrp is deprecated since pythonocc-0.18.2. Use OCC.Core.ExprIntrp", DeprecationWarning)

from OCC.Core.ExprIntrp import *
