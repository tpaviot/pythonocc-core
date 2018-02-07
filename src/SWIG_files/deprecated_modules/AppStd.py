import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.AppStd is deprecated since pythonocc-0.18.2. Use OCC.Core.AppStd", DeprecationWarning)

from OCC.Core.AppStd import *
