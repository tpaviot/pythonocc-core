import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TDataStd is deprecated since pythonocc-0.18.2. Use OCC.Core.TDataStd", DeprecationWarning)

from OCC.Core.TDataStd import *
