from enum import IntEnum
import typing
from typing import Any, overload, NewType, Optional, Tuple

from OCC.Core.Standard import *
from OCC.Core.NCollection import *
from OCC.Core.TCollection import *


class Quantity_Array1OfColor:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theLower: int, theUpper: int) -> None: ...
    def __getitem__(self, index: int) -> Quantity_Color: ...
    def __setitem__(self, index: int, value: Quantity_Color) -> None: ...
    def __len__(self) -> int: ...
    def __iter__(self) -> typing.Iterator[Quantity_Color]: ...
    def Init(self, theValue: Quantity_Color) -> None: ...
    def Size(self) -> int: ...
    def Length(self) -> int: ...
    def IsEmpty(self) -> bool: ...
    def Lower(self) -> int: ...
    def Upper(self) -> int: ...
    def IsDetectable(self) -> bool: ...
    def IsAllocated(self) -> bool: ...
    def First(self) -> Quantity_Color: ...
    def Last(self) -> Quantity_Color: ...
    def Value(self, theIndex: int) -> Quantity_Color: ...
    def SetValue(self, theIndex: int, theValue: Quantity_Color) -> None: ...

class Quantity_NameOfColor(IntEnum):
    Quantity_NOC_BLACK = 0
    Quantity_NOC_MATRABLUE = 1
    Quantity_NOC_MATRAGRAY = 2
    Quantity_NOC_ALICEBLUE = 3
    Quantity_NOC_ANTIQUEWHITE = 4
    Quantity_NOC_ANTIQUEWHITE1 = 5
    Quantity_NOC_ANTIQUEWHITE2 = 6
    Quantity_NOC_ANTIQUEWHITE3 = 7
    Quantity_NOC_ANTIQUEWHITE4 = 8
    Quantity_NOC_AQUAMARINE1 = 9
    Quantity_NOC_AQUAMARINE2 = 10
    Quantity_NOC_AQUAMARINE4 = 11
    Quantity_NOC_AZURE = 12
    Quantity_NOC_AZURE2 = 13
    Quantity_NOC_AZURE3 = 14
    Quantity_NOC_AZURE4 = 15
    Quantity_NOC_BEIGE = 16
    Quantity_NOC_BISQUE = 17
    Quantity_NOC_BISQUE2 = 18
    Quantity_NOC_BISQUE3 = 19
    Quantity_NOC_BISQUE4 = 20
    Quantity_NOC_BLANCHEDALMOND = 21
    Quantity_NOC_BLUE = 22
    Quantity_NOC_BLUE1 = ...
    Quantity_NOC_BLUE2 = 23
    Quantity_NOC_BLUE3 = 24
    Quantity_NOC_BLUE4 = 25
    Quantity_NOC_BLUEVIOLET = 26
    Quantity_NOC_BROWN = 27
    Quantity_NOC_BROWN1 = 28
    Quantity_NOC_BROWN2 = 29
    Quantity_NOC_BROWN3 = 30
    Quantity_NOC_BROWN4 = 31
    Quantity_NOC_BURLYWOOD = 32
    Quantity_NOC_BURLYWOOD1 = 33
    Quantity_NOC_BURLYWOOD2 = 34
    Quantity_NOC_BURLYWOOD3 = 35
    Quantity_NOC_BURLYWOOD4 = 36
    Quantity_NOC_CADETBLUE = 37
    Quantity_NOC_CADETBLUE1 = 38
    Quantity_NOC_CADETBLUE2 = 39
    Quantity_NOC_CADETBLUE3 = 40
    Quantity_NOC_CADETBLUE4 = 41
    Quantity_NOC_CHARTREUSE = 42
    Quantity_NOC_CHARTREUSE1 = ...
    Quantity_NOC_CHARTREUSE2 = 43
    Quantity_NOC_CHARTREUSE3 = 44
    Quantity_NOC_CHARTREUSE4 = 45
    Quantity_NOC_CHOCOLATE = 46
    Quantity_NOC_CHOCOLATE1 = 47
    Quantity_NOC_CHOCOLATE2 = 48
    Quantity_NOC_CHOCOLATE3 = 49
    Quantity_NOC_CHOCOLATE4 = 50
    Quantity_NOC_CORAL = 51
    Quantity_NOC_CORAL1 = 52
    Quantity_NOC_CORAL2 = 53
    Quantity_NOC_CORAL3 = 54
    Quantity_NOC_CORAL4 = 55
    Quantity_NOC_CORNFLOWERBLUE = 56
    Quantity_NOC_CORNSILK1 = 57
    Quantity_NOC_CORNSILK2 = 58
    Quantity_NOC_CORNSILK3 = 59
    Quantity_NOC_CORNSILK4 = 60
    Quantity_NOC_CYAN = 61
    Quantity_NOC_CYAN1 = ...
    Quantity_NOC_CYAN2 = 62
    Quantity_NOC_CYAN3 = 63
    Quantity_NOC_CYAN4 = 64
    Quantity_NOC_DARKGOLDENROD = 65
    Quantity_NOC_DARKGOLDENROD1 = 66
    Quantity_NOC_DARKGOLDENROD2 = 67
    Quantity_NOC_DARKGOLDENROD3 = 68
    Quantity_NOC_DARKGOLDENROD4 = 69
    Quantity_NOC_DARKGREEN = 70
    Quantity_NOC_DARKKHAKI = 71
    Quantity_NOC_DARKOLIVEGREEN = 72
    Quantity_NOC_DARKOLIVEGREEN1 = 73
    Quantity_NOC_DARKOLIVEGREEN2 = 74
    Quantity_NOC_DARKOLIVEGREEN3 = 75
    Quantity_NOC_DARKOLIVEGREEN4 = 76
    Quantity_NOC_DARKORANGE = 77
    Quantity_NOC_DARKORANGE1 = 78
    Quantity_NOC_DARKORANGE2 = 79
    Quantity_NOC_DARKORANGE3 = 80
    Quantity_NOC_DARKORANGE4 = 81
    Quantity_NOC_DARKORCHID = 82
    Quantity_NOC_DARKORCHID1 = 83
    Quantity_NOC_DARKORCHID2 = 84
    Quantity_NOC_DARKORCHID3 = 85
    Quantity_NOC_DARKORCHID4 = 86
    Quantity_NOC_DARKSALMON = 87
    Quantity_NOC_DARKSEAGREEN = 88
    Quantity_NOC_DARKSEAGREEN1 = 89
    Quantity_NOC_DARKSEAGREEN2 = 90
    Quantity_NOC_DARKSEAGREEN3 = 91
    Quantity_NOC_DARKSEAGREEN4 = 92
    Quantity_NOC_DARKSLATEBLUE = 93
    Quantity_NOC_DARKSLATEGRAY1 = 94
    Quantity_NOC_DARKSLATEGRAY2 = 95
    Quantity_NOC_DARKSLATEGRAY3 = 96
    Quantity_NOC_DARKSLATEGRAY4 = 97
    Quantity_NOC_DARKSLATEGRAY = 98
    Quantity_NOC_DARKTURQUOISE = 99
    Quantity_NOC_DARKVIOLET = 100
    Quantity_NOC_DEEPPINK = 101
    Quantity_NOC_DEEPPINK2 = 102
    Quantity_NOC_DEEPPINK3 = 103
    Quantity_NOC_DEEPPINK4 = 104
    Quantity_NOC_DEEPSKYBLUE1 = 105
    Quantity_NOC_DEEPSKYBLUE2 = 106
    Quantity_NOC_DEEPSKYBLUE3 = 107
    Quantity_NOC_DEEPSKYBLUE4 = 108
    Quantity_NOC_DODGERBLUE1 = 109
    Quantity_NOC_DODGERBLUE2 = 110
    Quantity_NOC_DODGERBLUE3 = 111
    Quantity_NOC_DODGERBLUE4 = 112
    Quantity_NOC_FIREBRICK = 113
    Quantity_NOC_FIREBRICK1 = 114
    Quantity_NOC_FIREBRICK2 = 115
    Quantity_NOC_FIREBRICK3 = 116
    Quantity_NOC_FIREBRICK4 = 117
    Quantity_NOC_FLORALWHITE = 118
    Quantity_NOC_FORESTGREEN = 119
    Quantity_NOC_GAINSBORO = 120
    Quantity_NOC_GHOSTWHITE = 121
    Quantity_NOC_GOLD = 122
    Quantity_NOC_GOLD1 = ...
    Quantity_NOC_GOLD2 = 123
    Quantity_NOC_GOLD3 = 124
    Quantity_NOC_GOLD4 = 125
    Quantity_NOC_GOLDENROD = 126
    Quantity_NOC_GOLDENROD1 = 127
    Quantity_NOC_GOLDENROD2 = 128
    Quantity_NOC_GOLDENROD3 = 129
    Quantity_NOC_GOLDENROD4 = 130
    Quantity_NOC_GRAY = 131
    Quantity_NOC_GRAY0 = 132
    Quantity_NOC_GRAY1 = 133
    Quantity_NOC_GRAY2 = 134
    Quantity_NOC_GRAY3 = 135
    Quantity_NOC_GRAY4 = 136
    Quantity_NOC_GRAY5 = 137
    Quantity_NOC_GRAY6 = 138
    Quantity_NOC_GRAY7 = 139
    Quantity_NOC_GRAY8 = 140
    Quantity_NOC_GRAY9 = 141
    Quantity_NOC_GRAY10 = 142
    Quantity_NOC_GRAY11 = 143
    Quantity_NOC_GRAY12 = 144
    Quantity_NOC_GRAY13 = 145
    Quantity_NOC_GRAY14 = 146
    Quantity_NOC_GRAY15 = 147
    Quantity_NOC_GRAY16 = 148
    Quantity_NOC_GRAY17 = 149
    Quantity_NOC_GRAY18 = 150
    Quantity_NOC_GRAY19 = 151
    Quantity_NOC_GRAY20 = 152
    Quantity_NOC_GRAY21 = 153
    Quantity_NOC_GRAY22 = 154
    Quantity_NOC_GRAY23 = 155
    Quantity_NOC_GRAY24 = 156
    Quantity_NOC_GRAY25 = 157
    Quantity_NOC_GRAY26 = 158
    Quantity_NOC_GRAY27 = 159
    Quantity_NOC_GRAY28 = 160
    Quantity_NOC_GRAY29 = 161
    Quantity_NOC_GRAY30 = 162
    Quantity_NOC_GRAY31 = 163
    Quantity_NOC_GRAY32 = 164
    Quantity_NOC_GRAY33 = 165
    Quantity_NOC_GRAY34 = 166
    Quantity_NOC_GRAY35 = 167
    Quantity_NOC_GRAY36 = 168
    Quantity_NOC_GRAY37 = 169
    Quantity_NOC_GRAY38 = 170
    Quantity_NOC_GRAY39 = 171
    Quantity_NOC_GRAY40 = 172
    Quantity_NOC_GRAY41 = 173
    Quantity_NOC_GRAY42 = 174
    Quantity_NOC_GRAY43 = 175
    Quantity_NOC_GRAY44 = 176
    Quantity_NOC_GRAY45 = 177
    Quantity_NOC_GRAY46 = 178
    Quantity_NOC_GRAY47 = 179
    Quantity_NOC_GRAY48 = 180
    Quantity_NOC_GRAY49 = 181
    Quantity_NOC_GRAY50 = 182
    Quantity_NOC_GRAY51 = 183
    Quantity_NOC_GRAY52 = 184
    Quantity_NOC_GRAY53 = 185
    Quantity_NOC_GRAY54 = 186
    Quantity_NOC_GRAY55 = 187
    Quantity_NOC_GRAY56 = 188
    Quantity_NOC_GRAY57 = 189
    Quantity_NOC_GRAY58 = 190
    Quantity_NOC_GRAY59 = 191
    Quantity_NOC_GRAY60 = 192
    Quantity_NOC_GRAY61 = 193
    Quantity_NOC_GRAY62 = 194
    Quantity_NOC_GRAY63 = 195
    Quantity_NOC_GRAY64 = 196
    Quantity_NOC_GRAY65 = 197
    Quantity_NOC_GRAY66 = 198
    Quantity_NOC_GRAY67 = 199
    Quantity_NOC_GRAY68 = 200
    Quantity_NOC_GRAY69 = 201
    Quantity_NOC_GRAY70 = 202
    Quantity_NOC_GRAY71 = 203
    Quantity_NOC_GRAY72 = 204
    Quantity_NOC_GRAY73 = 205
    Quantity_NOC_GRAY74 = 206
    Quantity_NOC_GRAY75 = 207
    Quantity_NOC_GRAY76 = 208
    Quantity_NOC_GRAY77 = 209
    Quantity_NOC_GRAY78 = 210
    Quantity_NOC_GRAY79 = 211
    Quantity_NOC_GRAY80 = 212
    Quantity_NOC_GRAY81 = 213
    Quantity_NOC_GRAY82 = 214
    Quantity_NOC_GRAY83 = 215
    Quantity_NOC_GRAY85 = 216
    Quantity_NOC_GRAY86 = 217
    Quantity_NOC_GRAY87 = 218
    Quantity_NOC_GRAY88 = 219
    Quantity_NOC_GRAY89 = 220
    Quantity_NOC_GRAY90 = 221
    Quantity_NOC_GRAY91 = 222
    Quantity_NOC_GRAY92 = 223
    Quantity_NOC_GRAY93 = 224
    Quantity_NOC_GRAY94 = 225
    Quantity_NOC_GRAY95 = 226
    Quantity_NOC_GRAY97 = 227
    Quantity_NOC_GRAY98 = 228
    Quantity_NOC_GRAY99 = 229
    Quantity_NOC_GREEN = 230
    Quantity_NOC_GREEN1 = ...
    Quantity_NOC_GREEN2 = 231
    Quantity_NOC_GREEN3 = 232
    Quantity_NOC_GREEN4 = 233
    Quantity_NOC_GREENYELLOW = 234
    Quantity_NOC_HONEYDEW = 235
    Quantity_NOC_HONEYDEW2 = 236
    Quantity_NOC_HONEYDEW3 = 237
    Quantity_NOC_HONEYDEW4 = 238
    Quantity_NOC_HOTPINK = 239
    Quantity_NOC_HOTPINK1 = 240
    Quantity_NOC_HOTPINK2 = 241
    Quantity_NOC_HOTPINK3 = 242
    Quantity_NOC_HOTPINK4 = 243
    Quantity_NOC_INDIANRED = 244
    Quantity_NOC_INDIANRED1 = 245
    Quantity_NOC_INDIANRED2 = 246
    Quantity_NOC_INDIANRED3 = 247
    Quantity_NOC_INDIANRED4 = 248
    Quantity_NOC_IVORY = 249
    Quantity_NOC_IVORY2 = 250
    Quantity_NOC_IVORY3 = 251
    Quantity_NOC_IVORY4 = 252
    Quantity_NOC_KHAKI = 253
    Quantity_NOC_KHAKI1 = 254
    Quantity_NOC_KHAKI2 = 255
    Quantity_NOC_KHAKI3 = 256
    Quantity_NOC_KHAKI4 = 257
    Quantity_NOC_LAVENDER = 258
    Quantity_NOC_LAVENDERBLUSH1 = 259
    Quantity_NOC_LAVENDERBLUSH2 = 260
    Quantity_NOC_LAVENDERBLUSH3 = 261
    Quantity_NOC_LAVENDERBLUSH4 = 262
    Quantity_NOC_LAWNGREEN = 263
    Quantity_NOC_LEMONCHIFFON1 = 264
    Quantity_NOC_LEMONCHIFFON2 = 265
    Quantity_NOC_LEMONCHIFFON3 = 266
    Quantity_NOC_LEMONCHIFFON4 = 267
    Quantity_NOC_LIGHTBLUE = 268
    Quantity_NOC_LIGHTBLUE1 = 269
    Quantity_NOC_LIGHTBLUE2 = 270
    Quantity_NOC_LIGHTBLUE3 = 271
    Quantity_NOC_LIGHTBLUE4 = 272
    Quantity_NOC_LIGHTCORAL = 273
    Quantity_NOC_LIGHTCYAN = 274
    Quantity_NOC_LIGHTCYAN1 = ...
    Quantity_NOC_LIGHTCYAN2 = 275
    Quantity_NOC_LIGHTCYAN3 = 276
    Quantity_NOC_LIGHTCYAN4 = 277
    Quantity_NOC_LIGHTGOLDENROD = 278
    Quantity_NOC_LIGHTGOLDENROD1 = 279
    Quantity_NOC_LIGHTGOLDENROD2 = 280
    Quantity_NOC_LIGHTGOLDENROD3 = 281
    Quantity_NOC_LIGHTGOLDENROD4 = 282
    Quantity_NOC_LIGHTGOLDENRODYELLOW = 283
    Quantity_NOC_LIGHTGRAY = 284
    Quantity_NOC_LIGHTPINK = 285
    Quantity_NOC_LIGHTPINK1 = 286
    Quantity_NOC_LIGHTPINK2 = 287
    Quantity_NOC_LIGHTPINK3 = 288
    Quantity_NOC_LIGHTPINK4 = 289
    Quantity_NOC_LIGHTSALMON1 = 290
    Quantity_NOC_LIGHTSALMON2 = 291
    Quantity_NOC_LIGHTSALMON3 = 292
    Quantity_NOC_LIGHTSALMON4 = 293
    Quantity_NOC_LIGHTSEAGREEN = 294
    Quantity_NOC_LIGHTSKYBLUE = 295
    Quantity_NOC_LIGHTSKYBLUE1 = 296
    Quantity_NOC_LIGHTSKYBLUE2 = 297
    Quantity_NOC_LIGHTSKYBLUE3 = 298
    Quantity_NOC_LIGHTSKYBLUE4 = 299
    Quantity_NOC_LIGHTSLATEBLUE = 300
    Quantity_NOC_LIGHTSLATEGRAY = 301
    Quantity_NOC_LIGHTSTEELBLUE = 302
    Quantity_NOC_LIGHTSTEELBLUE1 = 303
    Quantity_NOC_LIGHTSTEELBLUE2 = 304
    Quantity_NOC_LIGHTSTEELBLUE3 = 305
    Quantity_NOC_LIGHTSTEELBLUE4 = 306
    Quantity_NOC_LIGHTYELLOW = 307
    Quantity_NOC_LIGHTYELLOW2 = 308
    Quantity_NOC_LIGHTYELLOW3 = 309
    Quantity_NOC_LIGHTYELLOW4 = 310
    Quantity_NOC_LIMEGREEN = 311
    Quantity_NOC_LINEN = 312
    Quantity_NOC_MAGENTA = 313
    Quantity_NOC_MAGENTA1 = ...
    Quantity_NOC_MAGENTA2 = 314
    Quantity_NOC_MAGENTA3 = 315
    Quantity_NOC_MAGENTA4 = 316
    Quantity_NOC_MAROON = 317
    Quantity_NOC_MAROON1 = 318
    Quantity_NOC_MAROON2 = 319
    Quantity_NOC_MAROON3 = 320
    Quantity_NOC_MAROON4 = 321
    Quantity_NOC_MEDIUMAQUAMARINE = 322
    Quantity_NOC_MEDIUMORCHID = 323
    Quantity_NOC_MEDIUMORCHID1 = 324
    Quantity_NOC_MEDIUMORCHID2 = 325
    Quantity_NOC_MEDIUMORCHID3 = 326
    Quantity_NOC_MEDIUMORCHID4 = 327
    Quantity_NOC_MEDIUMPURPLE = 328
    Quantity_NOC_MEDIUMPURPLE1 = 329
    Quantity_NOC_MEDIUMPURPLE2 = 330
    Quantity_NOC_MEDIUMPURPLE3 = 331
    Quantity_NOC_MEDIUMPURPLE4 = 332
    Quantity_NOC_MEDIUMSEAGREEN = 333
    Quantity_NOC_MEDIUMSLATEBLUE = 334
    Quantity_NOC_MEDIUMSPRINGGREEN = 335
    Quantity_NOC_MEDIUMTURQUOISE = 336
    Quantity_NOC_MEDIUMVIOLETRED = 337
    Quantity_NOC_MIDNIGHTBLUE = 338
    Quantity_NOC_MINTCREAM = 339
    Quantity_NOC_MISTYROSE = 340
    Quantity_NOC_MISTYROSE2 = 341
    Quantity_NOC_MISTYROSE3 = 342
    Quantity_NOC_MISTYROSE4 = 343
    Quantity_NOC_MOCCASIN = 344
    Quantity_NOC_NAVAJOWHITE1 = 345
    Quantity_NOC_NAVAJOWHITE2 = 346
    Quantity_NOC_NAVAJOWHITE3 = 347
    Quantity_NOC_NAVAJOWHITE4 = 348
    Quantity_NOC_NAVYBLUE = 349
    Quantity_NOC_OLDLACE = 350
    Quantity_NOC_OLIVEDRAB = 351
    Quantity_NOC_OLIVEDRAB1 = 352
    Quantity_NOC_OLIVEDRAB2 = 353
    Quantity_NOC_OLIVEDRAB3 = 354
    Quantity_NOC_OLIVEDRAB4 = 355
    Quantity_NOC_ORANGE = 356
    Quantity_NOC_ORANGE1 = ...
    Quantity_NOC_ORANGE2 = 357
    Quantity_NOC_ORANGE3 = 358
    Quantity_NOC_ORANGE4 = 359
    Quantity_NOC_ORANGERED = 360
    Quantity_NOC_ORANGERED1 = ...
    Quantity_NOC_ORANGERED2 = 361
    Quantity_NOC_ORANGERED3 = 362
    Quantity_NOC_ORANGERED4 = 363
    Quantity_NOC_ORCHID = 364
    Quantity_NOC_ORCHID1 = 365
    Quantity_NOC_ORCHID2 = 366
    Quantity_NOC_ORCHID3 = 367
    Quantity_NOC_ORCHID4 = 368
    Quantity_NOC_PALEGOLDENROD = 369
    Quantity_NOC_PALEGREEN = 370
    Quantity_NOC_PALEGREEN1 = 371
    Quantity_NOC_PALEGREEN2 = 372
    Quantity_NOC_PALEGREEN3 = 373
    Quantity_NOC_PALEGREEN4 = 374
    Quantity_NOC_PALETURQUOISE = 375
    Quantity_NOC_PALETURQUOISE1 = 376
    Quantity_NOC_PALETURQUOISE2 = 377
    Quantity_NOC_PALETURQUOISE3 = 378
    Quantity_NOC_PALETURQUOISE4 = 379
    Quantity_NOC_PALEVIOLETRED = 380
    Quantity_NOC_PALEVIOLETRED1 = 381
    Quantity_NOC_PALEVIOLETRED2 = 382
    Quantity_NOC_PALEVIOLETRED3 = 383
    Quantity_NOC_PALEVIOLETRED4 = 384
    Quantity_NOC_PAPAYAWHIP = 385
    Quantity_NOC_PEACHPUFF = 386
    Quantity_NOC_PEACHPUFF2 = 387
    Quantity_NOC_PEACHPUFF3 = 388
    Quantity_NOC_PEACHPUFF4 = 389
    Quantity_NOC_PERU = 390
    Quantity_NOC_PINK = 391
    Quantity_NOC_PINK1 = 392
    Quantity_NOC_PINK2 = 393
    Quantity_NOC_PINK3 = 394
    Quantity_NOC_PINK4 = 395
    Quantity_NOC_PLUM = 396
    Quantity_NOC_PLUM1 = 397
    Quantity_NOC_PLUM2 = 398
    Quantity_NOC_PLUM3 = 399
    Quantity_NOC_PLUM4 = 400
    Quantity_NOC_POWDERBLUE = 401
    Quantity_NOC_PURPLE = 402
    Quantity_NOC_PURPLE1 = 403
    Quantity_NOC_PURPLE2 = 404
    Quantity_NOC_PURPLE3 = 405
    Quantity_NOC_PURPLE4 = 406
    Quantity_NOC_RED = 407
    Quantity_NOC_RED1 = ...
    Quantity_NOC_RED2 = 408
    Quantity_NOC_RED3 = 409
    Quantity_NOC_RED4 = 410
    Quantity_NOC_ROSYBROWN = 411
    Quantity_NOC_ROSYBROWN1 = 412
    Quantity_NOC_ROSYBROWN2 = 413
    Quantity_NOC_ROSYBROWN3 = 414
    Quantity_NOC_ROSYBROWN4 = 415
    Quantity_NOC_ROYALBLUE = 416
    Quantity_NOC_ROYALBLUE1 = 417
    Quantity_NOC_ROYALBLUE2 = 418
    Quantity_NOC_ROYALBLUE3 = 419
    Quantity_NOC_ROYALBLUE4 = 420
    Quantity_NOC_SADDLEBROWN = 421
    Quantity_NOC_SALMON = 422
    Quantity_NOC_SALMON1 = 423
    Quantity_NOC_SALMON2 = 424
    Quantity_NOC_SALMON3 = 425
    Quantity_NOC_SALMON4 = 426
    Quantity_NOC_SANDYBROWN = 427
    Quantity_NOC_SEAGREEN = 428
    Quantity_NOC_SEAGREEN1 = 429
    Quantity_NOC_SEAGREEN2 = 430
    Quantity_NOC_SEAGREEN3 = 431
    Quantity_NOC_SEAGREEN4 = 432
    Quantity_NOC_SEASHELL = 433
    Quantity_NOC_SEASHELL2 = 434
    Quantity_NOC_SEASHELL3 = 435
    Quantity_NOC_SEASHELL4 = 436
    Quantity_NOC_BEET = 437
    Quantity_NOC_TEAL = 438
    Quantity_NOC_SIENNA = 439
    Quantity_NOC_SIENNA1 = 440
    Quantity_NOC_SIENNA2 = 441
    Quantity_NOC_SIENNA3 = 442
    Quantity_NOC_SIENNA4 = 443
    Quantity_NOC_SKYBLUE = 444
    Quantity_NOC_SKYBLUE1 = 445
    Quantity_NOC_SKYBLUE2 = 446
    Quantity_NOC_SKYBLUE3 = 447
    Quantity_NOC_SKYBLUE4 = 448
    Quantity_NOC_SLATEBLUE = 449
    Quantity_NOC_SLATEBLUE1 = 450
    Quantity_NOC_SLATEBLUE2 = 451
    Quantity_NOC_SLATEBLUE3 = 452
    Quantity_NOC_SLATEBLUE4 = 453
    Quantity_NOC_SLATEGRAY1 = 454
    Quantity_NOC_SLATEGRAY2 = 455
    Quantity_NOC_SLATEGRAY3 = 456
    Quantity_NOC_SLATEGRAY4 = 457
    Quantity_NOC_SLATEGRAY = 458
    Quantity_NOC_SNOW = 459
    Quantity_NOC_SNOW2 = 460
    Quantity_NOC_SNOW3 = 461
    Quantity_NOC_SNOW4 = 462
    Quantity_NOC_SPRINGGREEN = 463
    Quantity_NOC_SPRINGGREEN2 = 464
    Quantity_NOC_SPRINGGREEN3 = 465
    Quantity_NOC_SPRINGGREEN4 = 466
    Quantity_NOC_STEELBLUE = 467
    Quantity_NOC_STEELBLUE1 = 468
    Quantity_NOC_STEELBLUE2 = 469
    Quantity_NOC_STEELBLUE3 = 470
    Quantity_NOC_STEELBLUE4 = 471
    Quantity_NOC_TAN = 472
    Quantity_NOC_TAN1 = 473
    Quantity_NOC_TAN2 = 474
    Quantity_NOC_TAN3 = 475
    Quantity_NOC_TAN4 = 476
    Quantity_NOC_THISTLE = 477
    Quantity_NOC_THISTLE1 = 478
    Quantity_NOC_THISTLE2 = 479
    Quantity_NOC_THISTLE3 = 480
    Quantity_NOC_THISTLE4 = 481
    Quantity_NOC_TOMATO = 482
    Quantity_NOC_TOMATO1 = ...
    Quantity_NOC_TOMATO2 = 483
    Quantity_NOC_TOMATO3 = 484
    Quantity_NOC_TOMATO4 = 485
    Quantity_NOC_TURQUOISE = 486
    Quantity_NOC_TURQUOISE1 = 487
    Quantity_NOC_TURQUOISE2 = 488
    Quantity_NOC_TURQUOISE3 = 489
    Quantity_NOC_TURQUOISE4 = 490
    Quantity_NOC_VIOLET = 491
    Quantity_NOC_VIOLETRED = 492
    Quantity_NOC_VIOLETRED1 = 493
    Quantity_NOC_VIOLETRED2 = 494
    Quantity_NOC_VIOLETRED3 = 495
    Quantity_NOC_VIOLETRED4 = 496
    Quantity_NOC_WHEAT = 497
    Quantity_NOC_WHEAT1 = 498
    Quantity_NOC_WHEAT2 = 499
    Quantity_NOC_WHEAT3 = 500
    Quantity_NOC_WHEAT4 = 501
    Quantity_NOC_WHITESMOKE = 502
    Quantity_NOC_YELLOW = 503
    Quantity_NOC_YELLOW1 = ...
    Quantity_NOC_YELLOW2 = 504
    Quantity_NOC_YELLOW3 = 505
    Quantity_NOC_YELLOW4 = 506
    Quantity_NOC_YELLOWGREEN = 507
    Quantity_NOC_WHITE = 508

Quantity_NOC_BLACK = Quantity_NameOfColor.Quantity_NOC_BLACK
Quantity_NOC_MATRABLUE = Quantity_NameOfColor.Quantity_NOC_MATRABLUE
Quantity_NOC_MATRAGRAY = Quantity_NameOfColor.Quantity_NOC_MATRAGRAY
Quantity_NOC_ALICEBLUE = Quantity_NameOfColor.Quantity_NOC_ALICEBLUE
Quantity_NOC_ANTIQUEWHITE = Quantity_NameOfColor.Quantity_NOC_ANTIQUEWHITE
Quantity_NOC_ANTIQUEWHITE1 = Quantity_NameOfColor.Quantity_NOC_ANTIQUEWHITE1
Quantity_NOC_ANTIQUEWHITE2 = Quantity_NameOfColor.Quantity_NOC_ANTIQUEWHITE2
Quantity_NOC_ANTIQUEWHITE3 = Quantity_NameOfColor.Quantity_NOC_ANTIQUEWHITE3
Quantity_NOC_ANTIQUEWHITE4 = Quantity_NameOfColor.Quantity_NOC_ANTIQUEWHITE4
Quantity_NOC_AQUAMARINE1 = Quantity_NameOfColor.Quantity_NOC_AQUAMARINE1
Quantity_NOC_AQUAMARINE2 = Quantity_NameOfColor.Quantity_NOC_AQUAMARINE2
Quantity_NOC_AQUAMARINE4 = Quantity_NameOfColor.Quantity_NOC_AQUAMARINE4
Quantity_NOC_AZURE = Quantity_NameOfColor.Quantity_NOC_AZURE
Quantity_NOC_AZURE2 = Quantity_NameOfColor.Quantity_NOC_AZURE2
Quantity_NOC_AZURE3 = Quantity_NameOfColor.Quantity_NOC_AZURE3
Quantity_NOC_AZURE4 = Quantity_NameOfColor.Quantity_NOC_AZURE4
Quantity_NOC_BEIGE = Quantity_NameOfColor.Quantity_NOC_BEIGE
Quantity_NOC_BISQUE = Quantity_NameOfColor.Quantity_NOC_BISQUE
Quantity_NOC_BISQUE2 = Quantity_NameOfColor.Quantity_NOC_BISQUE2
Quantity_NOC_BISQUE3 = Quantity_NameOfColor.Quantity_NOC_BISQUE3
Quantity_NOC_BISQUE4 = Quantity_NameOfColor.Quantity_NOC_BISQUE4
Quantity_NOC_BLANCHEDALMOND = Quantity_NameOfColor.Quantity_NOC_BLANCHEDALMOND
Quantity_NOC_BLUE = Quantity_NameOfColor.Quantity_NOC_BLUE
Quantity_NOC_BLUE1 = Quantity_NameOfColor.Quantity_NOC_BLUE1
Quantity_NOC_BLUE2 = Quantity_NameOfColor.Quantity_NOC_BLUE2
Quantity_NOC_BLUE3 = Quantity_NameOfColor.Quantity_NOC_BLUE3
Quantity_NOC_BLUE4 = Quantity_NameOfColor.Quantity_NOC_BLUE4
Quantity_NOC_BLUEVIOLET = Quantity_NameOfColor.Quantity_NOC_BLUEVIOLET
Quantity_NOC_BROWN = Quantity_NameOfColor.Quantity_NOC_BROWN
Quantity_NOC_BROWN1 = Quantity_NameOfColor.Quantity_NOC_BROWN1
Quantity_NOC_BROWN2 = Quantity_NameOfColor.Quantity_NOC_BROWN2
Quantity_NOC_BROWN3 = Quantity_NameOfColor.Quantity_NOC_BROWN3
Quantity_NOC_BROWN4 = Quantity_NameOfColor.Quantity_NOC_BROWN4
Quantity_NOC_BURLYWOOD = Quantity_NameOfColor.Quantity_NOC_BURLYWOOD
Quantity_NOC_BURLYWOOD1 = Quantity_NameOfColor.Quantity_NOC_BURLYWOOD1
Quantity_NOC_BURLYWOOD2 = Quantity_NameOfColor.Quantity_NOC_BURLYWOOD2
Quantity_NOC_BURLYWOOD3 = Quantity_NameOfColor.Quantity_NOC_BURLYWOOD3
Quantity_NOC_BURLYWOOD4 = Quantity_NameOfColor.Quantity_NOC_BURLYWOOD4
Quantity_NOC_CADETBLUE = Quantity_NameOfColor.Quantity_NOC_CADETBLUE
Quantity_NOC_CADETBLUE1 = Quantity_NameOfColor.Quantity_NOC_CADETBLUE1
Quantity_NOC_CADETBLUE2 = Quantity_NameOfColor.Quantity_NOC_CADETBLUE2
Quantity_NOC_CADETBLUE3 = Quantity_NameOfColor.Quantity_NOC_CADETBLUE3
Quantity_NOC_CADETBLUE4 = Quantity_NameOfColor.Quantity_NOC_CADETBLUE4
Quantity_NOC_CHARTREUSE = Quantity_NameOfColor.Quantity_NOC_CHARTREUSE
Quantity_NOC_CHARTREUSE1 = Quantity_NameOfColor.Quantity_NOC_CHARTREUSE1
Quantity_NOC_CHARTREUSE2 = Quantity_NameOfColor.Quantity_NOC_CHARTREUSE2
Quantity_NOC_CHARTREUSE3 = Quantity_NameOfColor.Quantity_NOC_CHARTREUSE3
Quantity_NOC_CHARTREUSE4 = Quantity_NameOfColor.Quantity_NOC_CHARTREUSE4
Quantity_NOC_CHOCOLATE = Quantity_NameOfColor.Quantity_NOC_CHOCOLATE
Quantity_NOC_CHOCOLATE1 = Quantity_NameOfColor.Quantity_NOC_CHOCOLATE1
Quantity_NOC_CHOCOLATE2 = Quantity_NameOfColor.Quantity_NOC_CHOCOLATE2
Quantity_NOC_CHOCOLATE3 = Quantity_NameOfColor.Quantity_NOC_CHOCOLATE3
Quantity_NOC_CHOCOLATE4 = Quantity_NameOfColor.Quantity_NOC_CHOCOLATE4
Quantity_NOC_CORAL = Quantity_NameOfColor.Quantity_NOC_CORAL
Quantity_NOC_CORAL1 = Quantity_NameOfColor.Quantity_NOC_CORAL1
Quantity_NOC_CORAL2 = Quantity_NameOfColor.Quantity_NOC_CORAL2
Quantity_NOC_CORAL3 = Quantity_NameOfColor.Quantity_NOC_CORAL3
Quantity_NOC_CORAL4 = Quantity_NameOfColor.Quantity_NOC_CORAL4
Quantity_NOC_CORNFLOWERBLUE = Quantity_NameOfColor.Quantity_NOC_CORNFLOWERBLUE
Quantity_NOC_CORNSILK1 = Quantity_NameOfColor.Quantity_NOC_CORNSILK1
Quantity_NOC_CORNSILK2 = Quantity_NameOfColor.Quantity_NOC_CORNSILK2
Quantity_NOC_CORNSILK3 = Quantity_NameOfColor.Quantity_NOC_CORNSILK3
Quantity_NOC_CORNSILK4 = Quantity_NameOfColor.Quantity_NOC_CORNSILK4
Quantity_NOC_CYAN = Quantity_NameOfColor.Quantity_NOC_CYAN
Quantity_NOC_CYAN1 = Quantity_NameOfColor.Quantity_NOC_CYAN1
Quantity_NOC_CYAN2 = Quantity_NameOfColor.Quantity_NOC_CYAN2
Quantity_NOC_CYAN3 = Quantity_NameOfColor.Quantity_NOC_CYAN3
Quantity_NOC_CYAN4 = Quantity_NameOfColor.Quantity_NOC_CYAN4
Quantity_NOC_DARKGOLDENROD = Quantity_NameOfColor.Quantity_NOC_DARKGOLDENROD
Quantity_NOC_DARKGOLDENROD1 = Quantity_NameOfColor.Quantity_NOC_DARKGOLDENROD1
Quantity_NOC_DARKGOLDENROD2 = Quantity_NameOfColor.Quantity_NOC_DARKGOLDENROD2
Quantity_NOC_DARKGOLDENROD3 = Quantity_NameOfColor.Quantity_NOC_DARKGOLDENROD3
Quantity_NOC_DARKGOLDENROD4 = Quantity_NameOfColor.Quantity_NOC_DARKGOLDENROD4
Quantity_NOC_DARKGREEN = Quantity_NameOfColor.Quantity_NOC_DARKGREEN
Quantity_NOC_DARKKHAKI = Quantity_NameOfColor.Quantity_NOC_DARKKHAKI
Quantity_NOC_DARKOLIVEGREEN = Quantity_NameOfColor.Quantity_NOC_DARKOLIVEGREEN
Quantity_NOC_DARKOLIVEGREEN1 = Quantity_NameOfColor.Quantity_NOC_DARKOLIVEGREEN1
Quantity_NOC_DARKOLIVEGREEN2 = Quantity_NameOfColor.Quantity_NOC_DARKOLIVEGREEN2
Quantity_NOC_DARKOLIVEGREEN3 = Quantity_NameOfColor.Quantity_NOC_DARKOLIVEGREEN3
Quantity_NOC_DARKOLIVEGREEN4 = Quantity_NameOfColor.Quantity_NOC_DARKOLIVEGREEN4
Quantity_NOC_DARKORANGE = Quantity_NameOfColor.Quantity_NOC_DARKORANGE
Quantity_NOC_DARKORANGE1 = Quantity_NameOfColor.Quantity_NOC_DARKORANGE1
Quantity_NOC_DARKORANGE2 = Quantity_NameOfColor.Quantity_NOC_DARKORANGE2
Quantity_NOC_DARKORANGE3 = Quantity_NameOfColor.Quantity_NOC_DARKORANGE3
Quantity_NOC_DARKORANGE4 = Quantity_NameOfColor.Quantity_NOC_DARKORANGE4
Quantity_NOC_DARKORCHID = Quantity_NameOfColor.Quantity_NOC_DARKORCHID
Quantity_NOC_DARKORCHID1 = Quantity_NameOfColor.Quantity_NOC_DARKORCHID1
Quantity_NOC_DARKORCHID2 = Quantity_NameOfColor.Quantity_NOC_DARKORCHID2
Quantity_NOC_DARKORCHID3 = Quantity_NameOfColor.Quantity_NOC_DARKORCHID3
Quantity_NOC_DARKORCHID4 = Quantity_NameOfColor.Quantity_NOC_DARKORCHID4
Quantity_NOC_DARKSALMON = Quantity_NameOfColor.Quantity_NOC_DARKSALMON
Quantity_NOC_DARKSEAGREEN = Quantity_NameOfColor.Quantity_NOC_DARKSEAGREEN
Quantity_NOC_DARKSEAGREEN1 = Quantity_NameOfColor.Quantity_NOC_DARKSEAGREEN1
Quantity_NOC_DARKSEAGREEN2 = Quantity_NameOfColor.Quantity_NOC_DARKSEAGREEN2
Quantity_NOC_DARKSEAGREEN3 = Quantity_NameOfColor.Quantity_NOC_DARKSEAGREEN3
Quantity_NOC_DARKSEAGREEN4 = Quantity_NameOfColor.Quantity_NOC_DARKSEAGREEN4
Quantity_NOC_DARKSLATEBLUE = Quantity_NameOfColor.Quantity_NOC_DARKSLATEBLUE
Quantity_NOC_DARKSLATEGRAY1 = Quantity_NameOfColor.Quantity_NOC_DARKSLATEGRAY1
Quantity_NOC_DARKSLATEGRAY2 = Quantity_NameOfColor.Quantity_NOC_DARKSLATEGRAY2
Quantity_NOC_DARKSLATEGRAY3 = Quantity_NameOfColor.Quantity_NOC_DARKSLATEGRAY3
Quantity_NOC_DARKSLATEGRAY4 = Quantity_NameOfColor.Quantity_NOC_DARKSLATEGRAY4
Quantity_NOC_DARKSLATEGRAY = Quantity_NameOfColor.Quantity_NOC_DARKSLATEGRAY
Quantity_NOC_DARKTURQUOISE = Quantity_NameOfColor.Quantity_NOC_DARKTURQUOISE
Quantity_NOC_DARKVIOLET = Quantity_NameOfColor.Quantity_NOC_DARKVIOLET
Quantity_NOC_DEEPPINK = Quantity_NameOfColor.Quantity_NOC_DEEPPINK
Quantity_NOC_DEEPPINK2 = Quantity_NameOfColor.Quantity_NOC_DEEPPINK2
Quantity_NOC_DEEPPINK3 = Quantity_NameOfColor.Quantity_NOC_DEEPPINK3
Quantity_NOC_DEEPPINK4 = Quantity_NameOfColor.Quantity_NOC_DEEPPINK4
Quantity_NOC_DEEPSKYBLUE1 = Quantity_NameOfColor.Quantity_NOC_DEEPSKYBLUE1
Quantity_NOC_DEEPSKYBLUE2 = Quantity_NameOfColor.Quantity_NOC_DEEPSKYBLUE2
Quantity_NOC_DEEPSKYBLUE3 = Quantity_NameOfColor.Quantity_NOC_DEEPSKYBLUE3
Quantity_NOC_DEEPSKYBLUE4 = Quantity_NameOfColor.Quantity_NOC_DEEPSKYBLUE4
Quantity_NOC_DODGERBLUE1 = Quantity_NameOfColor.Quantity_NOC_DODGERBLUE1
Quantity_NOC_DODGERBLUE2 = Quantity_NameOfColor.Quantity_NOC_DODGERBLUE2
Quantity_NOC_DODGERBLUE3 = Quantity_NameOfColor.Quantity_NOC_DODGERBLUE3
Quantity_NOC_DODGERBLUE4 = Quantity_NameOfColor.Quantity_NOC_DODGERBLUE4
Quantity_NOC_FIREBRICK = Quantity_NameOfColor.Quantity_NOC_FIREBRICK
Quantity_NOC_FIREBRICK1 = Quantity_NameOfColor.Quantity_NOC_FIREBRICK1
Quantity_NOC_FIREBRICK2 = Quantity_NameOfColor.Quantity_NOC_FIREBRICK2
Quantity_NOC_FIREBRICK3 = Quantity_NameOfColor.Quantity_NOC_FIREBRICK3
Quantity_NOC_FIREBRICK4 = Quantity_NameOfColor.Quantity_NOC_FIREBRICK4
Quantity_NOC_FLORALWHITE = Quantity_NameOfColor.Quantity_NOC_FLORALWHITE
Quantity_NOC_FORESTGREEN = Quantity_NameOfColor.Quantity_NOC_FORESTGREEN
Quantity_NOC_GAINSBORO = Quantity_NameOfColor.Quantity_NOC_GAINSBORO
Quantity_NOC_GHOSTWHITE = Quantity_NameOfColor.Quantity_NOC_GHOSTWHITE
Quantity_NOC_GOLD = Quantity_NameOfColor.Quantity_NOC_GOLD
Quantity_NOC_GOLD1 = Quantity_NameOfColor.Quantity_NOC_GOLD1
Quantity_NOC_GOLD2 = Quantity_NameOfColor.Quantity_NOC_GOLD2
Quantity_NOC_GOLD3 = Quantity_NameOfColor.Quantity_NOC_GOLD3
Quantity_NOC_GOLD4 = Quantity_NameOfColor.Quantity_NOC_GOLD4
Quantity_NOC_GOLDENROD = Quantity_NameOfColor.Quantity_NOC_GOLDENROD
Quantity_NOC_GOLDENROD1 = Quantity_NameOfColor.Quantity_NOC_GOLDENROD1
Quantity_NOC_GOLDENROD2 = Quantity_NameOfColor.Quantity_NOC_GOLDENROD2
Quantity_NOC_GOLDENROD3 = Quantity_NameOfColor.Quantity_NOC_GOLDENROD3
Quantity_NOC_GOLDENROD4 = Quantity_NameOfColor.Quantity_NOC_GOLDENROD4
Quantity_NOC_GRAY = Quantity_NameOfColor.Quantity_NOC_GRAY
Quantity_NOC_GRAY0 = Quantity_NameOfColor.Quantity_NOC_GRAY0
Quantity_NOC_GRAY1 = Quantity_NameOfColor.Quantity_NOC_GRAY1
Quantity_NOC_GRAY2 = Quantity_NameOfColor.Quantity_NOC_GRAY2
Quantity_NOC_GRAY3 = Quantity_NameOfColor.Quantity_NOC_GRAY3
Quantity_NOC_GRAY4 = Quantity_NameOfColor.Quantity_NOC_GRAY4
Quantity_NOC_GRAY5 = Quantity_NameOfColor.Quantity_NOC_GRAY5
Quantity_NOC_GRAY6 = Quantity_NameOfColor.Quantity_NOC_GRAY6
Quantity_NOC_GRAY7 = Quantity_NameOfColor.Quantity_NOC_GRAY7
Quantity_NOC_GRAY8 = Quantity_NameOfColor.Quantity_NOC_GRAY8
Quantity_NOC_GRAY9 = Quantity_NameOfColor.Quantity_NOC_GRAY9
Quantity_NOC_GRAY10 = Quantity_NameOfColor.Quantity_NOC_GRAY10
Quantity_NOC_GRAY11 = Quantity_NameOfColor.Quantity_NOC_GRAY11
Quantity_NOC_GRAY12 = Quantity_NameOfColor.Quantity_NOC_GRAY12
Quantity_NOC_GRAY13 = Quantity_NameOfColor.Quantity_NOC_GRAY13
Quantity_NOC_GRAY14 = Quantity_NameOfColor.Quantity_NOC_GRAY14
Quantity_NOC_GRAY15 = Quantity_NameOfColor.Quantity_NOC_GRAY15
Quantity_NOC_GRAY16 = Quantity_NameOfColor.Quantity_NOC_GRAY16
Quantity_NOC_GRAY17 = Quantity_NameOfColor.Quantity_NOC_GRAY17
Quantity_NOC_GRAY18 = Quantity_NameOfColor.Quantity_NOC_GRAY18
Quantity_NOC_GRAY19 = Quantity_NameOfColor.Quantity_NOC_GRAY19
Quantity_NOC_GRAY20 = Quantity_NameOfColor.Quantity_NOC_GRAY20
Quantity_NOC_GRAY21 = Quantity_NameOfColor.Quantity_NOC_GRAY21
Quantity_NOC_GRAY22 = Quantity_NameOfColor.Quantity_NOC_GRAY22
Quantity_NOC_GRAY23 = Quantity_NameOfColor.Quantity_NOC_GRAY23
Quantity_NOC_GRAY24 = Quantity_NameOfColor.Quantity_NOC_GRAY24
Quantity_NOC_GRAY25 = Quantity_NameOfColor.Quantity_NOC_GRAY25
Quantity_NOC_GRAY26 = Quantity_NameOfColor.Quantity_NOC_GRAY26
Quantity_NOC_GRAY27 = Quantity_NameOfColor.Quantity_NOC_GRAY27
Quantity_NOC_GRAY28 = Quantity_NameOfColor.Quantity_NOC_GRAY28
Quantity_NOC_GRAY29 = Quantity_NameOfColor.Quantity_NOC_GRAY29
Quantity_NOC_GRAY30 = Quantity_NameOfColor.Quantity_NOC_GRAY30
Quantity_NOC_GRAY31 = Quantity_NameOfColor.Quantity_NOC_GRAY31
Quantity_NOC_GRAY32 = Quantity_NameOfColor.Quantity_NOC_GRAY32
Quantity_NOC_GRAY33 = Quantity_NameOfColor.Quantity_NOC_GRAY33
Quantity_NOC_GRAY34 = Quantity_NameOfColor.Quantity_NOC_GRAY34
Quantity_NOC_GRAY35 = Quantity_NameOfColor.Quantity_NOC_GRAY35
Quantity_NOC_GRAY36 = Quantity_NameOfColor.Quantity_NOC_GRAY36
Quantity_NOC_GRAY37 = Quantity_NameOfColor.Quantity_NOC_GRAY37
Quantity_NOC_GRAY38 = Quantity_NameOfColor.Quantity_NOC_GRAY38
Quantity_NOC_GRAY39 = Quantity_NameOfColor.Quantity_NOC_GRAY39
Quantity_NOC_GRAY40 = Quantity_NameOfColor.Quantity_NOC_GRAY40
Quantity_NOC_GRAY41 = Quantity_NameOfColor.Quantity_NOC_GRAY41
Quantity_NOC_GRAY42 = Quantity_NameOfColor.Quantity_NOC_GRAY42
Quantity_NOC_GRAY43 = Quantity_NameOfColor.Quantity_NOC_GRAY43
Quantity_NOC_GRAY44 = Quantity_NameOfColor.Quantity_NOC_GRAY44
Quantity_NOC_GRAY45 = Quantity_NameOfColor.Quantity_NOC_GRAY45
Quantity_NOC_GRAY46 = Quantity_NameOfColor.Quantity_NOC_GRAY46
Quantity_NOC_GRAY47 = Quantity_NameOfColor.Quantity_NOC_GRAY47
Quantity_NOC_GRAY48 = Quantity_NameOfColor.Quantity_NOC_GRAY48
Quantity_NOC_GRAY49 = Quantity_NameOfColor.Quantity_NOC_GRAY49
Quantity_NOC_GRAY50 = Quantity_NameOfColor.Quantity_NOC_GRAY50
Quantity_NOC_GRAY51 = Quantity_NameOfColor.Quantity_NOC_GRAY51
Quantity_NOC_GRAY52 = Quantity_NameOfColor.Quantity_NOC_GRAY52
Quantity_NOC_GRAY53 = Quantity_NameOfColor.Quantity_NOC_GRAY53
Quantity_NOC_GRAY54 = Quantity_NameOfColor.Quantity_NOC_GRAY54
Quantity_NOC_GRAY55 = Quantity_NameOfColor.Quantity_NOC_GRAY55
Quantity_NOC_GRAY56 = Quantity_NameOfColor.Quantity_NOC_GRAY56
Quantity_NOC_GRAY57 = Quantity_NameOfColor.Quantity_NOC_GRAY57
Quantity_NOC_GRAY58 = Quantity_NameOfColor.Quantity_NOC_GRAY58
Quantity_NOC_GRAY59 = Quantity_NameOfColor.Quantity_NOC_GRAY59
Quantity_NOC_GRAY60 = Quantity_NameOfColor.Quantity_NOC_GRAY60
Quantity_NOC_GRAY61 = Quantity_NameOfColor.Quantity_NOC_GRAY61
Quantity_NOC_GRAY62 = Quantity_NameOfColor.Quantity_NOC_GRAY62
Quantity_NOC_GRAY63 = Quantity_NameOfColor.Quantity_NOC_GRAY63
Quantity_NOC_GRAY64 = Quantity_NameOfColor.Quantity_NOC_GRAY64
Quantity_NOC_GRAY65 = Quantity_NameOfColor.Quantity_NOC_GRAY65
Quantity_NOC_GRAY66 = Quantity_NameOfColor.Quantity_NOC_GRAY66
Quantity_NOC_GRAY67 = Quantity_NameOfColor.Quantity_NOC_GRAY67
Quantity_NOC_GRAY68 = Quantity_NameOfColor.Quantity_NOC_GRAY68
Quantity_NOC_GRAY69 = Quantity_NameOfColor.Quantity_NOC_GRAY69
Quantity_NOC_GRAY70 = Quantity_NameOfColor.Quantity_NOC_GRAY70
Quantity_NOC_GRAY71 = Quantity_NameOfColor.Quantity_NOC_GRAY71
Quantity_NOC_GRAY72 = Quantity_NameOfColor.Quantity_NOC_GRAY72
Quantity_NOC_GRAY73 = Quantity_NameOfColor.Quantity_NOC_GRAY73
Quantity_NOC_GRAY74 = Quantity_NameOfColor.Quantity_NOC_GRAY74
Quantity_NOC_GRAY75 = Quantity_NameOfColor.Quantity_NOC_GRAY75
Quantity_NOC_GRAY76 = Quantity_NameOfColor.Quantity_NOC_GRAY76
Quantity_NOC_GRAY77 = Quantity_NameOfColor.Quantity_NOC_GRAY77
Quantity_NOC_GRAY78 = Quantity_NameOfColor.Quantity_NOC_GRAY78
Quantity_NOC_GRAY79 = Quantity_NameOfColor.Quantity_NOC_GRAY79
Quantity_NOC_GRAY80 = Quantity_NameOfColor.Quantity_NOC_GRAY80
Quantity_NOC_GRAY81 = Quantity_NameOfColor.Quantity_NOC_GRAY81
Quantity_NOC_GRAY82 = Quantity_NameOfColor.Quantity_NOC_GRAY82
Quantity_NOC_GRAY83 = Quantity_NameOfColor.Quantity_NOC_GRAY83
Quantity_NOC_GRAY85 = Quantity_NameOfColor.Quantity_NOC_GRAY85
Quantity_NOC_GRAY86 = Quantity_NameOfColor.Quantity_NOC_GRAY86
Quantity_NOC_GRAY87 = Quantity_NameOfColor.Quantity_NOC_GRAY87
Quantity_NOC_GRAY88 = Quantity_NameOfColor.Quantity_NOC_GRAY88
Quantity_NOC_GRAY89 = Quantity_NameOfColor.Quantity_NOC_GRAY89
Quantity_NOC_GRAY90 = Quantity_NameOfColor.Quantity_NOC_GRAY90
Quantity_NOC_GRAY91 = Quantity_NameOfColor.Quantity_NOC_GRAY91
Quantity_NOC_GRAY92 = Quantity_NameOfColor.Quantity_NOC_GRAY92
Quantity_NOC_GRAY93 = Quantity_NameOfColor.Quantity_NOC_GRAY93
Quantity_NOC_GRAY94 = Quantity_NameOfColor.Quantity_NOC_GRAY94
Quantity_NOC_GRAY95 = Quantity_NameOfColor.Quantity_NOC_GRAY95
Quantity_NOC_GRAY97 = Quantity_NameOfColor.Quantity_NOC_GRAY97
Quantity_NOC_GRAY98 = Quantity_NameOfColor.Quantity_NOC_GRAY98
Quantity_NOC_GRAY99 = Quantity_NameOfColor.Quantity_NOC_GRAY99
Quantity_NOC_GREEN = Quantity_NameOfColor.Quantity_NOC_GREEN
Quantity_NOC_GREEN1 = Quantity_NameOfColor.Quantity_NOC_GREEN1
Quantity_NOC_GREEN2 = Quantity_NameOfColor.Quantity_NOC_GREEN2
Quantity_NOC_GREEN3 = Quantity_NameOfColor.Quantity_NOC_GREEN3
Quantity_NOC_GREEN4 = Quantity_NameOfColor.Quantity_NOC_GREEN4
Quantity_NOC_GREENYELLOW = Quantity_NameOfColor.Quantity_NOC_GREENYELLOW
Quantity_NOC_HONEYDEW = Quantity_NameOfColor.Quantity_NOC_HONEYDEW
Quantity_NOC_HONEYDEW2 = Quantity_NameOfColor.Quantity_NOC_HONEYDEW2
Quantity_NOC_HONEYDEW3 = Quantity_NameOfColor.Quantity_NOC_HONEYDEW3
Quantity_NOC_HONEYDEW4 = Quantity_NameOfColor.Quantity_NOC_HONEYDEW4
Quantity_NOC_HOTPINK = Quantity_NameOfColor.Quantity_NOC_HOTPINK
Quantity_NOC_HOTPINK1 = Quantity_NameOfColor.Quantity_NOC_HOTPINK1
Quantity_NOC_HOTPINK2 = Quantity_NameOfColor.Quantity_NOC_HOTPINK2
Quantity_NOC_HOTPINK3 = Quantity_NameOfColor.Quantity_NOC_HOTPINK3
Quantity_NOC_HOTPINK4 = Quantity_NameOfColor.Quantity_NOC_HOTPINK4
Quantity_NOC_INDIANRED = Quantity_NameOfColor.Quantity_NOC_INDIANRED
Quantity_NOC_INDIANRED1 = Quantity_NameOfColor.Quantity_NOC_INDIANRED1
Quantity_NOC_INDIANRED2 = Quantity_NameOfColor.Quantity_NOC_INDIANRED2
Quantity_NOC_INDIANRED3 = Quantity_NameOfColor.Quantity_NOC_INDIANRED3
Quantity_NOC_INDIANRED4 = Quantity_NameOfColor.Quantity_NOC_INDIANRED4
Quantity_NOC_IVORY = Quantity_NameOfColor.Quantity_NOC_IVORY
Quantity_NOC_IVORY2 = Quantity_NameOfColor.Quantity_NOC_IVORY2
Quantity_NOC_IVORY3 = Quantity_NameOfColor.Quantity_NOC_IVORY3
Quantity_NOC_IVORY4 = Quantity_NameOfColor.Quantity_NOC_IVORY4
Quantity_NOC_KHAKI = Quantity_NameOfColor.Quantity_NOC_KHAKI
Quantity_NOC_KHAKI1 = Quantity_NameOfColor.Quantity_NOC_KHAKI1
Quantity_NOC_KHAKI2 = Quantity_NameOfColor.Quantity_NOC_KHAKI2
Quantity_NOC_KHAKI3 = Quantity_NameOfColor.Quantity_NOC_KHAKI3
Quantity_NOC_KHAKI4 = Quantity_NameOfColor.Quantity_NOC_KHAKI4
Quantity_NOC_LAVENDER = Quantity_NameOfColor.Quantity_NOC_LAVENDER
Quantity_NOC_LAVENDERBLUSH1 = Quantity_NameOfColor.Quantity_NOC_LAVENDERBLUSH1
Quantity_NOC_LAVENDERBLUSH2 = Quantity_NameOfColor.Quantity_NOC_LAVENDERBLUSH2
Quantity_NOC_LAVENDERBLUSH3 = Quantity_NameOfColor.Quantity_NOC_LAVENDERBLUSH3
Quantity_NOC_LAVENDERBLUSH4 = Quantity_NameOfColor.Quantity_NOC_LAVENDERBLUSH4
Quantity_NOC_LAWNGREEN = Quantity_NameOfColor.Quantity_NOC_LAWNGREEN
Quantity_NOC_LEMONCHIFFON1 = Quantity_NameOfColor.Quantity_NOC_LEMONCHIFFON1
Quantity_NOC_LEMONCHIFFON2 = Quantity_NameOfColor.Quantity_NOC_LEMONCHIFFON2
Quantity_NOC_LEMONCHIFFON3 = Quantity_NameOfColor.Quantity_NOC_LEMONCHIFFON3
Quantity_NOC_LEMONCHIFFON4 = Quantity_NameOfColor.Quantity_NOC_LEMONCHIFFON4
Quantity_NOC_LIGHTBLUE = Quantity_NameOfColor.Quantity_NOC_LIGHTBLUE
Quantity_NOC_LIGHTBLUE1 = Quantity_NameOfColor.Quantity_NOC_LIGHTBLUE1
Quantity_NOC_LIGHTBLUE2 = Quantity_NameOfColor.Quantity_NOC_LIGHTBLUE2
Quantity_NOC_LIGHTBLUE3 = Quantity_NameOfColor.Quantity_NOC_LIGHTBLUE3
Quantity_NOC_LIGHTBLUE4 = Quantity_NameOfColor.Quantity_NOC_LIGHTBLUE4
Quantity_NOC_LIGHTCORAL = Quantity_NameOfColor.Quantity_NOC_LIGHTCORAL
Quantity_NOC_LIGHTCYAN = Quantity_NameOfColor.Quantity_NOC_LIGHTCYAN
Quantity_NOC_LIGHTCYAN1 = Quantity_NameOfColor.Quantity_NOC_LIGHTCYAN1
Quantity_NOC_LIGHTCYAN2 = Quantity_NameOfColor.Quantity_NOC_LIGHTCYAN2
Quantity_NOC_LIGHTCYAN3 = Quantity_NameOfColor.Quantity_NOC_LIGHTCYAN3
Quantity_NOC_LIGHTCYAN4 = Quantity_NameOfColor.Quantity_NOC_LIGHTCYAN4
Quantity_NOC_LIGHTGOLDENROD = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENROD
Quantity_NOC_LIGHTGOLDENROD1 = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENROD1
Quantity_NOC_LIGHTGOLDENROD2 = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENROD2
Quantity_NOC_LIGHTGOLDENROD3 = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENROD3
Quantity_NOC_LIGHTGOLDENROD4 = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENROD4
Quantity_NOC_LIGHTGOLDENRODYELLOW = Quantity_NameOfColor.Quantity_NOC_LIGHTGOLDENRODYELLOW
Quantity_NOC_LIGHTGRAY = Quantity_NameOfColor.Quantity_NOC_LIGHTGRAY
Quantity_NOC_LIGHTPINK = Quantity_NameOfColor.Quantity_NOC_LIGHTPINK
Quantity_NOC_LIGHTPINK1 = Quantity_NameOfColor.Quantity_NOC_LIGHTPINK1
Quantity_NOC_LIGHTPINK2 = Quantity_NameOfColor.Quantity_NOC_LIGHTPINK2
Quantity_NOC_LIGHTPINK3 = Quantity_NameOfColor.Quantity_NOC_LIGHTPINK3
Quantity_NOC_LIGHTPINK4 = Quantity_NameOfColor.Quantity_NOC_LIGHTPINK4
Quantity_NOC_LIGHTSALMON1 = Quantity_NameOfColor.Quantity_NOC_LIGHTSALMON1
Quantity_NOC_LIGHTSALMON2 = Quantity_NameOfColor.Quantity_NOC_LIGHTSALMON2
Quantity_NOC_LIGHTSALMON3 = Quantity_NameOfColor.Quantity_NOC_LIGHTSALMON3
Quantity_NOC_LIGHTSALMON4 = Quantity_NameOfColor.Quantity_NOC_LIGHTSALMON4
Quantity_NOC_LIGHTSEAGREEN = Quantity_NameOfColor.Quantity_NOC_LIGHTSEAGREEN
Quantity_NOC_LIGHTSKYBLUE = Quantity_NameOfColor.Quantity_NOC_LIGHTSKYBLUE
Quantity_NOC_LIGHTSKYBLUE1 = Quantity_NameOfColor.Quantity_NOC_LIGHTSKYBLUE1
Quantity_NOC_LIGHTSKYBLUE2 = Quantity_NameOfColor.Quantity_NOC_LIGHTSKYBLUE2
Quantity_NOC_LIGHTSKYBLUE3 = Quantity_NameOfColor.Quantity_NOC_LIGHTSKYBLUE3
Quantity_NOC_LIGHTSKYBLUE4 = Quantity_NameOfColor.Quantity_NOC_LIGHTSKYBLUE4
Quantity_NOC_LIGHTSLATEBLUE = Quantity_NameOfColor.Quantity_NOC_LIGHTSLATEBLUE
Quantity_NOC_LIGHTSLATEGRAY = Quantity_NameOfColor.Quantity_NOC_LIGHTSLATEGRAY
Quantity_NOC_LIGHTSTEELBLUE = Quantity_NameOfColor.Quantity_NOC_LIGHTSTEELBLUE
Quantity_NOC_LIGHTSTEELBLUE1 = Quantity_NameOfColor.Quantity_NOC_LIGHTSTEELBLUE1
Quantity_NOC_LIGHTSTEELBLUE2 = Quantity_NameOfColor.Quantity_NOC_LIGHTSTEELBLUE2
Quantity_NOC_LIGHTSTEELBLUE3 = Quantity_NameOfColor.Quantity_NOC_LIGHTSTEELBLUE3
Quantity_NOC_LIGHTSTEELBLUE4 = Quantity_NameOfColor.Quantity_NOC_LIGHTSTEELBLUE4
Quantity_NOC_LIGHTYELLOW = Quantity_NameOfColor.Quantity_NOC_LIGHTYELLOW
Quantity_NOC_LIGHTYELLOW2 = Quantity_NameOfColor.Quantity_NOC_LIGHTYELLOW2
Quantity_NOC_LIGHTYELLOW3 = Quantity_NameOfColor.Quantity_NOC_LIGHTYELLOW3
Quantity_NOC_LIGHTYELLOW4 = Quantity_NameOfColor.Quantity_NOC_LIGHTYELLOW4
Quantity_NOC_LIMEGREEN = Quantity_NameOfColor.Quantity_NOC_LIMEGREEN
Quantity_NOC_LINEN = Quantity_NameOfColor.Quantity_NOC_LINEN
Quantity_NOC_MAGENTA = Quantity_NameOfColor.Quantity_NOC_MAGENTA
Quantity_NOC_MAGENTA1 = Quantity_NameOfColor.Quantity_NOC_MAGENTA1
Quantity_NOC_MAGENTA2 = Quantity_NameOfColor.Quantity_NOC_MAGENTA2
Quantity_NOC_MAGENTA3 = Quantity_NameOfColor.Quantity_NOC_MAGENTA3
Quantity_NOC_MAGENTA4 = Quantity_NameOfColor.Quantity_NOC_MAGENTA4
Quantity_NOC_MAROON = Quantity_NameOfColor.Quantity_NOC_MAROON
Quantity_NOC_MAROON1 = Quantity_NameOfColor.Quantity_NOC_MAROON1
Quantity_NOC_MAROON2 = Quantity_NameOfColor.Quantity_NOC_MAROON2
Quantity_NOC_MAROON3 = Quantity_NameOfColor.Quantity_NOC_MAROON3
Quantity_NOC_MAROON4 = Quantity_NameOfColor.Quantity_NOC_MAROON4
Quantity_NOC_MEDIUMAQUAMARINE = Quantity_NameOfColor.Quantity_NOC_MEDIUMAQUAMARINE
Quantity_NOC_MEDIUMORCHID = Quantity_NameOfColor.Quantity_NOC_MEDIUMORCHID
Quantity_NOC_MEDIUMORCHID1 = Quantity_NameOfColor.Quantity_NOC_MEDIUMORCHID1
Quantity_NOC_MEDIUMORCHID2 = Quantity_NameOfColor.Quantity_NOC_MEDIUMORCHID2
Quantity_NOC_MEDIUMORCHID3 = Quantity_NameOfColor.Quantity_NOC_MEDIUMORCHID3
Quantity_NOC_MEDIUMORCHID4 = Quantity_NameOfColor.Quantity_NOC_MEDIUMORCHID4
Quantity_NOC_MEDIUMPURPLE = Quantity_NameOfColor.Quantity_NOC_MEDIUMPURPLE
Quantity_NOC_MEDIUMPURPLE1 = Quantity_NameOfColor.Quantity_NOC_MEDIUMPURPLE1
Quantity_NOC_MEDIUMPURPLE2 = Quantity_NameOfColor.Quantity_NOC_MEDIUMPURPLE2
Quantity_NOC_MEDIUMPURPLE3 = Quantity_NameOfColor.Quantity_NOC_MEDIUMPURPLE3
Quantity_NOC_MEDIUMPURPLE4 = Quantity_NameOfColor.Quantity_NOC_MEDIUMPURPLE4
Quantity_NOC_MEDIUMSEAGREEN = Quantity_NameOfColor.Quantity_NOC_MEDIUMSEAGREEN
Quantity_NOC_MEDIUMSLATEBLUE = Quantity_NameOfColor.Quantity_NOC_MEDIUMSLATEBLUE
Quantity_NOC_MEDIUMSPRINGGREEN = Quantity_NameOfColor.Quantity_NOC_MEDIUMSPRINGGREEN
Quantity_NOC_MEDIUMTURQUOISE = Quantity_NameOfColor.Quantity_NOC_MEDIUMTURQUOISE
Quantity_NOC_MEDIUMVIOLETRED = Quantity_NameOfColor.Quantity_NOC_MEDIUMVIOLETRED
Quantity_NOC_MIDNIGHTBLUE = Quantity_NameOfColor.Quantity_NOC_MIDNIGHTBLUE
Quantity_NOC_MINTCREAM = Quantity_NameOfColor.Quantity_NOC_MINTCREAM
Quantity_NOC_MISTYROSE = Quantity_NameOfColor.Quantity_NOC_MISTYROSE
Quantity_NOC_MISTYROSE2 = Quantity_NameOfColor.Quantity_NOC_MISTYROSE2
Quantity_NOC_MISTYROSE3 = Quantity_NameOfColor.Quantity_NOC_MISTYROSE3
Quantity_NOC_MISTYROSE4 = Quantity_NameOfColor.Quantity_NOC_MISTYROSE4
Quantity_NOC_MOCCASIN = Quantity_NameOfColor.Quantity_NOC_MOCCASIN
Quantity_NOC_NAVAJOWHITE1 = Quantity_NameOfColor.Quantity_NOC_NAVAJOWHITE1
Quantity_NOC_NAVAJOWHITE2 = Quantity_NameOfColor.Quantity_NOC_NAVAJOWHITE2
Quantity_NOC_NAVAJOWHITE3 = Quantity_NameOfColor.Quantity_NOC_NAVAJOWHITE3
Quantity_NOC_NAVAJOWHITE4 = Quantity_NameOfColor.Quantity_NOC_NAVAJOWHITE4
Quantity_NOC_NAVYBLUE = Quantity_NameOfColor.Quantity_NOC_NAVYBLUE
Quantity_NOC_OLDLACE = Quantity_NameOfColor.Quantity_NOC_OLDLACE
Quantity_NOC_OLIVEDRAB = Quantity_NameOfColor.Quantity_NOC_OLIVEDRAB
Quantity_NOC_OLIVEDRAB1 = Quantity_NameOfColor.Quantity_NOC_OLIVEDRAB1
Quantity_NOC_OLIVEDRAB2 = Quantity_NameOfColor.Quantity_NOC_OLIVEDRAB2
Quantity_NOC_OLIVEDRAB3 = Quantity_NameOfColor.Quantity_NOC_OLIVEDRAB3
Quantity_NOC_OLIVEDRAB4 = Quantity_NameOfColor.Quantity_NOC_OLIVEDRAB4
Quantity_NOC_ORANGE = Quantity_NameOfColor.Quantity_NOC_ORANGE
Quantity_NOC_ORANGE1 = Quantity_NameOfColor.Quantity_NOC_ORANGE1
Quantity_NOC_ORANGE2 = Quantity_NameOfColor.Quantity_NOC_ORANGE2
Quantity_NOC_ORANGE3 = Quantity_NameOfColor.Quantity_NOC_ORANGE3
Quantity_NOC_ORANGE4 = Quantity_NameOfColor.Quantity_NOC_ORANGE4
Quantity_NOC_ORANGERED = Quantity_NameOfColor.Quantity_NOC_ORANGERED
Quantity_NOC_ORANGERED1 = Quantity_NameOfColor.Quantity_NOC_ORANGERED1
Quantity_NOC_ORANGERED2 = Quantity_NameOfColor.Quantity_NOC_ORANGERED2
Quantity_NOC_ORANGERED3 = Quantity_NameOfColor.Quantity_NOC_ORANGERED3
Quantity_NOC_ORANGERED4 = Quantity_NameOfColor.Quantity_NOC_ORANGERED4
Quantity_NOC_ORCHID = Quantity_NameOfColor.Quantity_NOC_ORCHID
Quantity_NOC_ORCHID1 = Quantity_NameOfColor.Quantity_NOC_ORCHID1
Quantity_NOC_ORCHID2 = Quantity_NameOfColor.Quantity_NOC_ORCHID2
Quantity_NOC_ORCHID3 = Quantity_NameOfColor.Quantity_NOC_ORCHID3
Quantity_NOC_ORCHID4 = Quantity_NameOfColor.Quantity_NOC_ORCHID4
Quantity_NOC_PALEGOLDENROD = Quantity_NameOfColor.Quantity_NOC_PALEGOLDENROD
Quantity_NOC_PALEGREEN = Quantity_NameOfColor.Quantity_NOC_PALEGREEN
Quantity_NOC_PALEGREEN1 = Quantity_NameOfColor.Quantity_NOC_PALEGREEN1
Quantity_NOC_PALEGREEN2 = Quantity_NameOfColor.Quantity_NOC_PALEGREEN2
Quantity_NOC_PALEGREEN3 = Quantity_NameOfColor.Quantity_NOC_PALEGREEN3
Quantity_NOC_PALEGREEN4 = Quantity_NameOfColor.Quantity_NOC_PALEGREEN4
Quantity_NOC_PALETURQUOISE = Quantity_NameOfColor.Quantity_NOC_PALETURQUOISE
Quantity_NOC_PALETURQUOISE1 = Quantity_NameOfColor.Quantity_NOC_PALETURQUOISE1
Quantity_NOC_PALETURQUOISE2 = Quantity_NameOfColor.Quantity_NOC_PALETURQUOISE2
Quantity_NOC_PALETURQUOISE3 = Quantity_NameOfColor.Quantity_NOC_PALETURQUOISE3
Quantity_NOC_PALETURQUOISE4 = Quantity_NameOfColor.Quantity_NOC_PALETURQUOISE4
Quantity_NOC_PALEVIOLETRED = Quantity_NameOfColor.Quantity_NOC_PALEVIOLETRED
Quantity_NOC_PALEVIOLETRED1 = Quantity_NameOfColor.Quantity_NOC_PALEVIOLETRED1
Quantity_NOC_PALEVIOLETRED2 = Quantity_NameOfColor.Quantity_NOC_PALEVIOLETRED2
Quantity_NOC_PALEVIOLETRED3 = Quantity_NameOfColor.Quantity_NOC_PALEVIOLETRED3
Quantity_NOC_PALEVIOLETRED4 = Quantity_NameOfColor.Quantity_NOC_PALEVIOLETRED4
Quantity_NOC_PAPAYAWHIP = Quantity_NameOfColor.Quantity_NOC_PAPAYAWHIP
Quantity_NOC_PEACHPUFF = Quantity_NameOfColor.Quantity_NOC_PEACHPUFF
Quantity_NOC_PEACHPUFF2 = Quantity_NameOfColor.Quantity_NOC_PEACHPUFF2
Quantity_NOC_PEACHPUFF3 = Quantity_NameOfColor.Quantity_NOC_PEACHPUFF3
Quantity_NOC_PEACHPUFF4 = Quantity_NameOfColor.Quantity_NOC_PEACHPUFF4
Quantity_NOC_PERU = Quantity_NameOfColor.Quantity_NOC_PERU
Quantity_NOC_PINK = Quantity_NameOfColor.Quantity_NOC_PINK
Quantity_NOC_PINK1 = Quantity_NameOfColor.Quantity_NOC_PINK1
Quantity_NOC_PINK2 = Quantity_NameOfColor.Quantity_NOC_PINK2
Quantity_NOC_PINK3 = Quantity_NameOfColor.Quantity_NOC_PINK3
Quantity_NOC_PINK4 = Quantity_NameOfColor.Quantity_NOC_PINK4
Quantity_NOC_PLUM = Quantity_NameOfColor.Quantity_NOC_PLUM
Quantity_NOC_PLUM1 = Quantity_NameOfColor.Quantity_NOC_PLUM1
Quantity_NOC_PLUM2 = Quantity_NameOfColor.Quantity_NOC_PLUM2
Quantity_NOC_PLUM3 = Quantity_NameOfColor.Quantity_NOC_PLUM3
Quantity_NOC_PLUM4 = Quantity_NameOfColor.Quantity_NOC_PLUM4
Quantity_NOC_POWDERBLUE = Quantity_NameOfColor.Quantity_NOC_POWDERBLUE
Quantity_NOC_PURPLE = Quantity_NameOfColor.Quantity_NOC_PURPLE
Quantity_NOC_PURPLE1 = Quantity_NameOfColor.Quantity_NOC_PURPLE1
Quantity_NOC_PURPLE2 = Quantity_NameOfColor.Quantity_NOC_PURPLE2
Quantity_NOC_PURPLE3 = Quantity_NameOfColor.Quantity_NOC_PURPLE3
Quantity_NOC_PURPLE4 = Quantity_NameOfColor.Quantity_NOC_PURPLE4
Quantity_NOC_RED = Quantity_NameOfColor.Quantity_NOC_RED
Quantity_NOC_RED1 = Quantity_NameOfColor.Quantity_NOC_RED1
Quantity_NOC_RED2 = Quantity_NameOfColor.Quantity_NOC_RED2
Quantity_NOC_RED3 = Quantity_NameOfColor.Quantity_NOC_RED3
Quantity_NOC_RED4 = Quantity_NameOfColor.Quantity_NOC_RED4
Quantity_NOC_ROSYBROWN = Quantity_NameOfColor.Quantity_NOC_ROSYBROWN
Quantity_NOC_ROSYBROWN1 = Quantity_NameOfColor.Quantity_NOC_ROSYBROWN1
Quantity_NOC_ROSYBROWN2 = Quantity_NameOfColor.Quantity_NOC_ROSYBROWN2
Quantity_NOC_ROSYBROWN3 = Quantity_NameOfColor.Quantity_NOC_ROSYBROWN3
Quantity_NOC_ROSYBROWN4 = Quantity_NameOfColor.Quantity_NOC_ROSYBROWN4
Quantity_NOC_ROYALBLUE = Quantity_NameOfColor.Quantity_NOC_ROYALBLUE
Quantity_NOC_ROYALBLUE1 = Quantity_NameOfColor.Quantity_NOC_ROYALBLUE1
Quantity_NOC_ROYALBLUE2 = Quantity_NameOfColor.Quantity_NOC_ROYALBLUE2
Quantity_NOC_ROYALBLUE3 = Quantity_NameOfColor.Quantity_NOC_ROYALBLUE3
Quantity_NOC_ROYALBLUE4 = Quantity_NameOfColor.Quantity_NOC_ROYALBLUE4
Quantity_NOC_SADDLEBROWN = Quantity_NameOfColor.Quantity_NOC_SADDLEBROWN
Quantity_NOC_SALMON = Quantity_NameOfColor.Quantity_NOC_SALMON
Quantity_NOC_SALMON1 = Quantity_NameOfColor.Quantity_NOC_SALMON1
Quantity_NOC_SALMON2 = Quantity_NameOfColor.Quantity_NOC_SALMON2
Quantity_NOC_SALMON3 = Quantity_NameOfColor.Quantity_NOC_SALMON3
Quantity_NOC_SALMON4 = Quantity_NameOfColor.Quantity_NOC_SALMON4
Quantity_NOC_SANDYBROWN = Quantity_NameOfColor.Quantity_NOC_SANDYBROWN
Quantity_NOC_SEAGREEN = Quantity_NameOfColor.Quantity_NOC_SEAGREEN
Quantity_NOC_SEAGREEN1 = Quantity_NameOfColor.Quantity_NOC_SEAGREEN1
Quantity_NOC_SEAGREEN2 = Quantity_NameOfColor.Quantity_NOC_SEAGREEN2
Quantity_NOC_SEAGREEN3 = Quantity_NameOfColor.Quantity_NOC_SEAGREEN3
Quantity_NOC_SEAGREEN4 = Quantity_NameOfColor.Quantity_NOC_SEAGREEN4
Quantity_NOC_SEASHELL = Quantity_NameOfColor.Quantity_NOC_SEASHELL
Quantity_NOC_SEASHELL2 = Quantity_NameOfColor.Quantity_NOC_SEASHELL2
Quantity_NOC_SEASHELL3 = Quantity_NameOfColor.Quantity_NOC_SEASHELL3
Quantity_NOC_SEASHELL4 = Quantity_NameOfColor.Quantity_NOC_SEASHELL4
Quantity_NOC_BEET = Quantity_NameOfColor.Quantity_NOC_BEET
Quantity_NOC_TEAL = Quantity_NameOfColor.Quantity_NOC_TEAL
Quantity_NOC_SIENNA = Quantity_NameOfColor.Quantity_NOC_SIENNA
Quantity_NOC_SIENNA1 = Quantity_NameOfColor.Quantity_NOC_SIENNA1
Quantity_NOC_SIENNA2 = Quantity_NameOfColor.Quantity_NOC_SIENNA2
Quantity_NOC_SIENNA3 = Quantity_NameOfColor.Quantity_NOC_SIENNA3
Quantity_NOC_SIENNA4 = Quantity_NameOfColor.Quantity_NOC_SIENNA4
Quantity_NOC_SKYBLUE = Quantity_NameOfColor.Quantity_NOC_SKYBLUE
Quantity_NOC_SKYBLUE1 = Quantity_NameOfColor.Quantity_NOC_SKYBLUE1
Quantity_NOC_SKYBLUE2 = Quantity_NameOfColor.Quantity_NOC_SKYBLUE2
Quantity_NOC_SKYBLUE3 = Quantity_NameOfColor.Quantity_NOC_SKYBLUE3
Quantity_NOC_SKYBLUE4 = Quantity_NameOfColor.Quantity_NOC_SKYBLUE4
Quantity_NOC_SLATEBLUE = Quantity_NameOfColor.Quantity_NOC_SLATEBLUE
Quantity_NOC_SLATEBLUE1 = Quantity_NameOfColor.Quantity_NOC_SLATEBLUE1
Quantity_NOC_SLATEBLUE2 = Quantity_NameOfColor.Quantity_NOC_SLATEBLUE2
Quantity_NOC_SLATEBLUE3 = Quantity_NameOfColor.Quantity_NOC_SLATEBLUE3
Quantity_NOC_SLATEBLUE4 = Quantity_NameOfColor.Quantity_NOC_SLATEBLUE4
Quantity_NOC_SLATEGRAY1 = Quantity_NameOfColor.Quantity_NOC_SLATEGRAY1
Quantity_NOC_SLATEGRAY2 = Quantity_NameOfColor.Quantity_NOC_SLATEGRAY2
Quantity_NOC_SLATEGRAY3 = Quantity_NameOfColor.Quantity_NOC_SLATEGRAY3
Quantity_NOC_SLATEGRAY4 = Quantity_NameOfColor.Quantity_NOC_SLATEGRAY4
Quantity_NOC_SLATEGRAY = Quantity_NameOfColor.Quantity_NOC_SLATEGRAY
Quantity_NOC_SNOW = Quantity_NameOfColor.Quantity_NOC_SNOW
Quantity_NOC_SNOW2 = Quantity_NameOfColor.Quantity_NOC_SNOW2
Quantity_NOC_SNOW3 = Quantity_NameOfColor.Quantity_NOC_SNOW3
Quantity_NOC_SNOW4 = Quantity_NameOfColor.Quantity_NOC_SNOW4
Quantity_NOC_SPRINGGREEN = Quantity_NameOfColor.Quantity_NOC_SPRINGGREEN
Quantity_NOC_SPRINGGREEN2 = Quantity_NameOfColor.Quantity_NOC_SPRINGGREEN2
Quantity_NOC_SPRINGGREEN3 = Quantity_NameOfColor.Quantity_NOC_SPRINGGREEN3
Quantity_NOC_SPRINGGREEN4 = Quantity_NameOfColor.Quantity_NOC_SPRINGGREEN4
Quantity_NOC_STEELBLUE = Quantity_NameOfColor.Quantity_NOC_STEELBLUE
Quantity_NOC_STEELBLUE1 = Quantity_NameOfColor.Quantity_NOC_STEELBLUE1
Quantity_NOC_STEELBLUE2 = Quantity_NameOfColor.Quantity_NOC_STEELBLUE2
Quantity_NOC_STEELBLUE3 = Quantity_NameOfColor.Quantity_NOC_STEELBLUE3
Quantity_NOC_STEELBLUE4 = Quantity_NameOfColor.Quantity_NOC_STEELBLUE4
Quantity_NOC_TAN = Quantity_NameOfColor.Quantity_NOC_TAN
Quantity_NOC_TAN1 = Quantity_NameOfColor.Quantity_NOC_TAN1
Quantity_NOC_TAN2 = Quantity_NameOfColor.Quantity_NOC_TAN2
Quantity_NOC_TAN3 = Quantity_NameOfColor.Quantity_NOC_TAN3
Quantity_NOC_TAN4 = Quantity_NameOfColor.Quantity_NOC_TAN4
Quantity_NOC_THISTLE = Quantity_NameOfColor.Quantity_NOC_THISTLE
Quantity_NOC_THISTLE1 = Quantity_NameOfColor.Quantity_NOC_THISTLE1
Quantity_NOC_THISTLE2 = Quantity_NameOfColor.Quantity_NOC_THISTLE2
Quantity_NOC_THISTLE3 = Quantity_NameOfColor.Quantity_NOC_THISTLE3
Quantity_NOC_THISTLE4 = Quantity_NameOfColor.Quantity_NOC_THISTLE4
Quantity_NOC_TOMATO = Quantity_NameOfColor.Quantity_NOC_TOMATO
Quantity_NOC_TOMATO1 = Quantity_NameOfColor.Quantity_NOC_TOMATO1
Quantity_NOC_TOMATO2 = Quantity_NameOfColor.Quantity_NOC_TOMATO2
Quantity_NOC_TOMATO3 = Quantity_NameOfColor.Quantity_NOC_TOMATO3
Quantity_NOC_TOMATO4 = Quantity_NameOfColor.Quantity_NOC_TOMATO4
Quantity_NOC_TURQUOISE = Quantity_NameOfColor.Quantity_NOC_TURQUOISE
Quantity_NOC_TURQUOISE1 = Quantity_NameOfColor.Quantity_NOC_TURQUOISE1
Quantity_NOC_TURQUOISE2 = Quantity_NameOfColor.Quantity_NOC_TURQUOISE2
Quantity_NOC_TURQUOISE3 = Quantity_NameOfColor.Quantity_NOC_TURQUOISE3
Quantity_NOC_TURQUOISE4 = Quantity_NameOfColor.Quantity_NOC_TURQUOISE4
Quantity_NOC_VIOLET = Quantity_NameOfColor.Quantity_NOC_VIOLET
Quantity_NOC_VIOLETRED = Quantity_NameOfColor.Quantity_NOC_VIOLETRED
Quantity_NOC_VIOLETRED1 = Quantity_NameOfColor.Quantity_NOC_VIOLETRED1
Quantity_NOC_VIOLETRED2 = Quantity_NameOfColor.Quantity_NOC_VIOLETRED2
Quantity_NOC_VIOLETRED3 = Quantity_NameOfColor.Quantity_NOC_VIOLETRED3
Quantity_NOC_VIOLETRED4 = Quantity_NameOfColor.Quantity_NOC_VIOLETRED4
Quantity_NOC_WHEAT = Quantity_NameOfColor.Quantity_NOC_WHEAT
Quantity_NOC_WHEAT1 = Quantity_NameOfColor.Quantity_NOC_WHEAT1
Quantity_NOC_WHEAT2 = Quantity_NameOfColor.Quantity_NOC_WHEAT2
Quantity_NOC_WHEAT3 = Quantity_NameOfColor.Quantity_NOC_WHEAT3
Quantity_NOC_WHEAT4 = Quantity_NameOfColor.Quantity_NOC_WHEAT4
Quantity_NOC_WHITESMOKE = Quantity_NameOfColor.Quantity_NOC_WHITESMOKE
Quantity_NOC_YELLOW = Quantity_NameOfColor.Quantity_NOC_YELLOW
Quantity_NOC_YELLOW1 = Quantity_NameOfColor.Quantity_NOC_YELLOW1
Quantity_NOC_YELLOW2 = Quantity_NameOfColor.Quantity_NOC_YELLOW2
Quantity_NOC_YELLOW3 = Quantity_NameOfColor.Quantity_NOC_YELLOW3
Quantity_NOC_YELLOW4 = Quantity_NameOfColor.Quantity_NOC_YELLOW4
Quantity_NOC_YELLOWGREEN = Quantity_NameOfColor.Quantity_NOC_YELLOWGREEN
Quantity_NOC_WHITE = Quantity_NameOfColor.Quantity_NOC_WHITE

class Quantity_TypeOfColor(IntEnum):
    Quantity_TOC_RGB = 0
    Quantity_TOC_sRGB = 1
    Quantity_TOC_HLS = 2
    Quantity_TOC_CIELab = 3
    Quantity_TOC_CIELch = 4

Quantity_TOC_RGB = Quantity_TypeOfColor.Quantity_TOC_RGB
Quantity_TOC_sRGB = Quantity_TypeOfColor.Quantity_TOC_sRGB
Quantity_TOC_HLS = Quantity_TypeOfColor.Quantity_TOC_HLS
Quantity_TOC_CIELab = Quantity_TypeOfColor.Quantity_TOC_CIELab
Quantity_TOC_CIELch = Quantity_TypeOfColor.Quantity_TOC_CIELch

class Quantity_Color:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theName: Quantity_NameOfColor) -> None: ...
    @overload
    def __init__(self, theC1: float, theC2: float, theC3: float, theType: Quantity_TypeOfColor) -> None: ...
    @overload
    def __init__(self, theRgb: Any) -> None: ...
    @staticmethod
    def Argb2color(theARGB: int, theColor: Quantity_Color) -> None: ...
    def Blue(self) -> float: ...
    def ChangeContrast(self, theDelta: float) -> None: ...
    def ChangeIntensity(self, theDelta: float) -> None: ...
    @staticmethod
    def Color2argb(theColor: Quantity_Color) -> int: ...
    @staticmethod
    def ColorFromHex(theHexColorString: str, theColor: Quantity_Color) -> bool: ...
    @overload
    @staticmethod
    def ColorFromName(theName: str) -> Tuple[bool, Quantity_NameOfColor]: ...
    @overload
    @staticmethod
    def ColorFromName(theColorNameString: str, theColor: Quantity_Color) -> bool: ...
    @staticmethod
    def ColorToHex(theColor: Quantity_Color, theToPrefixHash: Optional[bool] = True) -> str: ...
    @staticmethod
    def Convert_HLS_To_LinearRGB(theHls: Any) -> Any: ...
    @staticmethod
    def Convert_HLS_To_sRGB(theHls: Any) -> Any: ...
    @staticmethod
    def Convert_Lab_To_Lch(theLab: Any) -> Any: ...
    @staticmethod
    def Convert_Lab_To_LinearRGB(theLab: Any) -> Any: ...
    @staticmethod
    def Convert_Lch_To_Lab(theLch: Any) -> Any: ...
    @staticmethod
    def Convert_LinearRGB_To_HLS(theRgb: Any) -> Any: ...
    @staticmethod
    def Convert_LinearRGB_To_Lab(theRgb: Any) -> Any: ...
    @overload
    @staticmethod
    def Convert_LinearRGB_To_sRGB(theLinearValue: float) -> float: ...
    @overload
    @staticmethod
    def Convert_LinearRGB_To_sRGB(theLinearValue: float) -> float: ...
    @overload
    @staticmethod
    def Convert_LinearRGB_To_sRGB_approx22(theLinearValue: float) -> float: ...
    @overload
    @staticmethod
    def Convert_LinearRGB_To_sRGB_approx22(theRGB: Any) -> Any: ...
    @staticmethod
    def Convert_sRGB_To_HLS(theRgb: Any) -> Any: ...
    @overload
    @staticmethod
    def Convert_sRGB_To_LinearRGB(thesRGBValue: float) -> float: ...
    @overload
    @staticmethod
    def Convert_sRGB_To_LinearRGB(thesRGBValue: float) -> float: ...
    @overload
    @staticmethod
    def Convert_sRGB_To_LinearRGB_approx22(thesRGBValue: float) -> float: ...
    @overload
    @staticmethod
    def Convert_sRGB_To_LinearRGB_approx22(theRGB: Any) -> Any: ...
    def Delta(self, theColor: Quantity_Color) -> Tuple[float, float]: ...
    def DeltaE2000(self, theOther: Quantity_Color) -> float: ...
    def Distance(self, theColor: Quantity_Color) -> float: ...
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    @staticmethod
    def Epsilon() -> float: ...
    def Green(self) -> float: ...
    @staticmethod
    def HlsRgb(theH: float, theL: float, theS: float) -> Tuple[float, float, float]: ...
    def Hue(self) -> float: ...
    def InitFromJson(self, json_string: str) -> bool: ...
    def IsDifferent(self, theOther: Quantity_Color) -> bool: ...
    def IsEqual(self, theOther: Quantity_Color) -> bool: ...
    def Light(self) -> float: ...
    @overload
    def Name(self) -> Quantity_NameOfColor: ...
    @overload
    @staticmethod
    def Name(theR: float, theG: float, theB: float) -> Quantity_NameOfColor: ...
    def Red(self) -> float: ...
    def Rgb(self) -> Any: ...
    @staticmethod
    def RgbHls(theR: float, theG: float, theB: float) -> Tuple[float, float, float]: ...
    def Saturation(self) -> float: ...
    @staticmethod
    def SetEpsilon(theEpsilon: float) -> None: ...
    @overload
    def SetValues(self, theName: Quantity_NameOfColor) -> None: ...
    @overload
    def SetValues(self, theC1: float, theC2: float, theC3: float, theType: Quantity_TypeOfColor) -> None: ...
    def SquareDistance(self, theColor: Quantity_Color) -> float: ...
    @staticmethod
    def StringName(theColor: Quantity_NameOfColor) -> str: ...
    def Values(self, theType: Quantity_TypeOfColor) -> Tuple[float, float, float]: ...

class Quantity_ColorRGBA:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, theRgb: Quantity_Color) -> None: ...
    @overload
    def __init__(self, theRgb: Quantity_Color, theAlpha: float) -> None: ...
    @overload
    def __init__(self, theRgba: Any) -> None: ...
    @overload
    def __init__(self, theRed: float, theGreen: float, theBlue: float, theAlpha: float) -> None: ...
    def Alpha(self) -> float: ...
    def ChangeRGB(self) -> Quantity_Color: ...
    @staticmethod
    def ColorFromHex(theHexColorString: str, theColor: Quantity_ColorRGBA, theAlphaComponentIsOff: Optional[bool] = False) -> bool: ...
    @staticmethod
    def ColorFromName(theColorNameString: str, theColor: Quantity_ColorRGBA) -> bool: ...
    @staticmethod
    def ColorToHex(theColor: Quantity_ColorRGBA, theToPrefixHash: Optional[bool] = True) -> str: ...
    @staticmethod
    def Convert_LinearRGB_To_sRGB(theRGB: Any) -> Any: ...
    @staticmethod
    def Convert_sRGB_To_LinearRGB(theRGB: Any) -> Any: ...
    def DumpJson(self, depth: Optional[int]=-1) -> str: ...
    def GetRGB(self) -> Quantity_Color: ...
    def InitFromJson(self, json_string: str) -> bool: ...
    def IsDifferent(self, theOther: Quantity_ColorRGBA) -> bool: ...
    def IsEqual(self, theOther: Quantity_ColorRGBA) -> bool: ...
    def SetAlpha(self, theAlpha: float) -> None: ...
    def SetRGB(self, theRgb: Quantity_Color) -> None: ...
    def SetValues(self, theRed: float, theGreen: float, theBlue: float, theAlpha: float) -> None: ...

class Quantity_Date:
    @overload
    def __init__(self) -> None: ...
    @overload
    def __init__(self, mm: int, dd: int, yyyy: int, hh: int, mn: int, ss: int, mis: Optional[int] = 0, mics: Optional[int] = 0) -> None: ...
    def Add(self, aPeriod: Quantity_Period) -> Quantity_Date: ...
    def Day(self) -> int: ...
    def Difference(self, anOther: Quantity_Date) -> Quantity_Period: ...
    def Hour(self) -> int: ...
    def IsEarlier(self, anOther: Quantity_Date) -> bool: ...
    def IsEqual(self, anOther: Quantity_Date) -> bool: ...
    def IsLater(self, anOther: Quantity_Date) -> bool: ...
    @staticmethod
    def IsLeap(yy: int) -> bool: ...
    @staticmethod
    def IsValid(mm: int, dd: int, yy: int, hh: int, mn: int, ss: int, mis: Optional[int] = 0, mics: Optional[int] = 0) -> bool: ...
    def MicroSecond(self) -> int: ...
    def MilliSecond(self) -> int: ...
    def Minute(self) -> int: ...
    def Month(self) -> int: ...
    def Second(self) -> int: ...
    def SetValues(self, mm: int, dd: int, yy: int, hh: int, mn: int, ss: int, mis: Optional[int] = 0, mics: Optional[int] = 0) -> None: ...
    def Subtract(self, aPeriod: Quantity_Period) -> Quantity_Date: ...
    def Values(self) -> Tuple[int, int, int, int, int, int, int, int]: ...
    def Year(self) -> int: ...

class Quantity_Period:
    @overload
    def __init__(self, dd: int, hh: int, mn: int, ss: int, mis: Optional[int] = 0, mics: Optional[int] = 0) -> None: ...
    @overload
    def __init__(self, ss: int, mics: Optional[int] = 0) -> None: ...
    def Add(self, anOther: Quantity_Period) -> Quantity_Period: ...
    def IsEqual(self, anOther: Quantity_Period) -> bool: ...
    def IsLonger(self, anOther: Quantity_Period) -> bool: ...
    def IsShorter(self, anOther: Quantity_Period) -> bool: ...
    @overload
    @staticmethod
    def IsValid(dd: int, hh: int, mn: int, ss: int, mis: Optional[int] = 0, mics: Optional[int] = 0) -> bool: ...
    @overload
    @staticmethod
    def IsValid(ss: int, mics: Optional[int] = 0) -> bool: ...
    @overload
    def SetValues(self, dd: int, hh: int, mn: int, ss: int, mis: Optional[int] = 0, mics: Optional[int] = 0) -> None: ...
    @overload
    def SetValues(self, ss: int, mics: Optional[int] = 0) -> None: ...
    def Subtract(self, anOther: Quantity_Period) -> Quantity_Period: ...
    @overload
    def Values(self) -> Tuple[int, int, int, int, int, int]: ...
    @overload
    def Values(self) -> Tuple[int, int]: ...

# harray1 classes

class Quantity_HArray1OfColor(Quantity_Array1OfColor, Standard_Transient):
    def __init__(self, theLower: int, theUpper: int) -> None: ...
    def Array1(self) -> Quantity_Array1OfColor: ...

# harray2 classes
# hsequence classes

