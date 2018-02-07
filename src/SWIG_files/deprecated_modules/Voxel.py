import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.Voxel is deprecated since pythonocc-0.18.2. Use OCC.Core.Voxel", DeprecationWarning)

from OCC.Core.Voxel import *
