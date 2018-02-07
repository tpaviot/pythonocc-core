import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GccEnt is deprecated since pythonocc-0.18.2. Use OCC.Core.GccEnt", DeprecationWarning)

from OCC.Core.GccEnt import *
