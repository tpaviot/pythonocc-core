import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.BndLib is deprecated since pythonocc-0.18.2. Use OCC.Core.BndLib", DeprecationWarning)

from OCC.Core.BndLib import *
