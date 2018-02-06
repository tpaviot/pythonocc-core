import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MFunction is deprecated since pythonocc-0.18.2. Use OCC.Core.MFunction", DeprecationWarning)

from OCC.Core.MFunction import *
