import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.PCDM is deprecated since pythonocc-0.18.2. Use OCC.Core.PCDM", DeprecationWarning)

from OCC.Core.PCDM import *
