import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.GraphTools is deprecated since pythonocc-0.18.2. Use OCC.Core.GraphTools", DeprecationWarning)

from OCC.Core.GraphTools import *
