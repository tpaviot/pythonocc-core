import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TColgp is deprecated since pythonocc-0.18.2. Use OCC.Core.TColgp", DeprecationWarning)

from OCC.Core.TColgp import *
