import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GccAna is deprecated since pythonocc-0.18.2. Use OCC.Core.GccAna", DeprecationWarning)

from OCC.Core.GccAna import *
