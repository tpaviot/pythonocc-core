import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.AppStdL is deprecated since pythonocc-0.18.2. Use OCC.Core.AppStdL", DeprecationWarning)

from OCC.Core.AppStdL import *
