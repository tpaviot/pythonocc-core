import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TDocStd is deprecated since pythonocc-0.18.2. Use OCC.Core.TDocStd", DeprecationWarning)

from OCC.Core.TDocStd import *
