import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Expr is deprecated since pythonocc-0.18.2. Use OCC.Core.Expr", DeprecationWarning)

from OCC.Core.Expr import *
