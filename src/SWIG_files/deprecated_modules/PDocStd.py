import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.PDocStd is deprecated since pythonocc-0.18.2. Use OCC.Core.PDocStd", DeprecationWarning)

from OCC.Core.PDocStd import *
