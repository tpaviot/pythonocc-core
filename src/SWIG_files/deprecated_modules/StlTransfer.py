import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.StlTransfer is deprecated since pythonocc-0.18.2. Use OCC.Core.StlTransfer", DeprecationWarning)

from OCC.Core.StlTransfer import *
