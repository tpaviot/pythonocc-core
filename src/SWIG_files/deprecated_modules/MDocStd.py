import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.MDocStd is deprecated since pythonocc-0.18.2. Use OCC.Core.MDocStd", DeprecationWarning)

from OCC.Core.MDocStd import *
