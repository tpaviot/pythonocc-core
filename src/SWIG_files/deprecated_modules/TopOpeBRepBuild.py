import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopOpeBRepBuild is deprecated since pythonocc-0.18.2. Use OCC.Core.TopOpeBRepBuild", DeprecationWarning)

from OCC.Core.TopOpeBRepBuild import *
