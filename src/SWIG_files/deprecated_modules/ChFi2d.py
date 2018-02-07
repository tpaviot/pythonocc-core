import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.ChFi2d is deprecated since pythonocc-0.18.2. Use OCC.Core.ChFi2d", DeprecationWarning)

from OCC.Core.ChFi2d import *
