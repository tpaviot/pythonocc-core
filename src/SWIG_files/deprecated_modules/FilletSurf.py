import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.FilletSurf is deprecated since pythonocc-0.18.2. Use OCC.Core.FilletSurf", DeprecationWarning)

from OCC.Core.FilletSurf import *
