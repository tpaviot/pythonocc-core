import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Law is deprecated since pythonocc-0.18.2. Use OCC.Core.Law", DeprecationWarning)

from OCC.Core.Law import *
