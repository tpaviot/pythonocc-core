from typing import overload, NewType, Optional, Tuple

from OCC.Core.Storage import *
from OCC.Core.Standard import *
from OCC.Core.NCollection import *

Storage_Position = NewType('Storage_Position', long)

class Storage_SolveMode:
	Storage_AddSolve: int = ...
	Storage_WriteSolve: int = ...
	Storage_ReadSolve: int = ...

class Storage_Error:
	Storage_VSOk: int = ...
	Storage_VSOpenError: int = ...
	Storage_VSModeError: int = ...
	Storage_VSCloseError: int = ...
	Storage_VSAlreadyOpen: int = ...
	Storage_VSNotOpen: int = ...
	Storage_VSSectionNotFound: int = ...
	Storage_VSWriteError: int = ...
	Storage_VSFormatError: int = ...
	Storage_VSUnknownType: int = ...
	Storage_VSTypeMismatch: int = ...
	Storage_VSInternalError: int = ...
	Storage_VSExtCharParityError: int = ...
	Storage_VSWrongFileDriver: int = ...

class Storage_OpenMode:
	Storage_VSNone: int = ...
	Storage_VSRead: int = ...
	Storage_VSWrite: int = ...
	Storage_VSReadWrite: int = ...