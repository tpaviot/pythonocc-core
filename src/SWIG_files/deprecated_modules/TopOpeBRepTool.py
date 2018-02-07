import warnings
warnings.simplefilter('once', DeprecationWarning)
warnings.warn("OCC.TopOpeBRepTool is deprecated since pythonocc-0.18.2. Use OCC.Core.TopOpeBRepTool", DeprecationWarning)

from OCC.Core.TopOpeBRepTool import *
