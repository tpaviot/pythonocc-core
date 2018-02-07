import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.PDataStd is deprecated since pythonocc-0.18.2. Use OCC.Core.PDataStd", DeprecationWarning)

from OCC.Core.PDataStd import *
