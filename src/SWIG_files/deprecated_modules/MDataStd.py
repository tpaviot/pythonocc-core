import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MDataStd is deprecated since pythonocc-0.18.2. Use OCC.Core.MDataStd", DeprecationWarning)

from OCC.Core.MDataStd import *
