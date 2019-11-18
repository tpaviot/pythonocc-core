/*
Copyright 2008-2019 Thomas Paviot (tpaviot@gmail.com)

This file is part of pythonOCC.
pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.
*/
%define QUANTITYDOCSTRING
"Quantity module, see official documentation at
https://www.opencascade.com/doc/occt-7.4.0/refman/html/package_quantity.html"
%enddef
%module (package="OCC.Core", docstring=QUANTITYDOCSTRING) Quantity


%{
#ifdef WNT
#pragma warning(disable : 4716)
#endif
%}

%include ../common/CommonIncludes.i
%include ../common/ExceptionCatcher.i
%include ../common/FunctionTransformers.i
%include ../common/Operators.i
%include ../common/OccHandle.i


%{
#include<Quantity_module.hxx>

//Dependencies
#include<Standard_module.hxx>
#include<NCollection_module.hxx>
#include<TCollection_module.hxx>
#include<TColgp_module.hxx>
#include<TColStd_module.hxx>
#include<TCollection_module.hxx>
#include<Storage_module.hxx>
%};
%import Standard.i
%import NCollection.i
%import TCollection.i
/* public enums */
enum Quantity_NameOfColor {
	Quantity_NOC_BLACK = 0,
	Quantity_NOC_MATRABLUE = 1,
	Quantity_NOC_MATRAGRAY = 2,
	Quantity_NOC_ALICEBLUE = 3,
	Quantity_NOC_ANTIQUEWHITE = 4,
	Quantity_NOC_ANTIQUEWHITE1 = 5,
	Quantity_NOC_ANTIQUEWHITE2 = 6,
	Quantity_NOC_ANTIQUEWHITE3 = 7,
	Quantity_NOC_ANTIQUEWHITE4 = 8,
	Quantity_NOC_AQUAMARINE1 = 9,
	Quantity_NOC_AQUAMARINE2 = 10,
	Quantity_NOC_AQUAMARINE4 = 11,
	Quantity_NOC_AZURE = 12,
	Quantity_NOC_AZURE2 = 13,
	Quantity_NOC_AZURE3 = 14,
	Quantity_NOC_AZURE4 = 15,
	Quantity_NOC_BEIGE = 16,
	Quantity_NOC_BISQUE = 17,
	Quantity_NOC_BISQUE2 = 18,
	Quantity_NOC_BISQUE3 = 19,
	Quantity_NOC_BISQUE4 = 20,
	Quantity_NOC_BLANCHEDALMOND = 21,
	Quantity_NOC_BLUE1 = 22,
	Quantity_NOC_BLUE2 = 23,
	Quantity_NOC_BLUE3 = 24,
	Quantity_NOC_BLUE4 = 25,
	Quantity_NOC_BLUEVIOLET = 26,
	Quantity_NOC_BROWN = 27,
	Quantity_NOC_BROWN1 = 28,
	Quantity_NOC_BROWN2 = 29,
	Quantity_NOC_BROWN3 = 30,
	Quantity_NOC_BROWN4 = 31,
	Quantity_NOC_BURLYWOOD = 32,
	Quantity_NOC_BURLYWOOD1 = 33,
	Quantity_NOC_BURLYWOOD2 = 34,
	Quantity_NOC_BURLYWOOD3 = 35,
	Quantity_NOC_BURLYWOOD4 = 36,
	Quantity_NOC_CADETBLUE = 37,
	Quantity_NOC_CADETBLUE1 = 38,
	Quantity_NOC_CADETBLUE2 = 39,
	Quantity_NOC_CADETBLUE3 = 40,
	Quantity_NOC_CADETBLUE4 = 41,
	Quantity_NOC_CHARTREUSE = 42,
	Quantity_NOC_CHARTREUSE1 = 43,
	Quantity_NOC_CHARTREUSE2 = 44,
	Quantity_NOC_CHARTREUSE3 = 45,
	Quantity_NOC_CHARTREUSE4 = 46,
	Quantity_NOC_CHOCOLATE = 47,
	Quantity_NOC_CHOCOLATE1 = 48,
	Quantity_NOC_CHOCOLATE2 = 49,
	Quantity_NOC_CHOCOLATE3 = 50,
	Quantity_NOC_CHOCOLATE4 = 51,
	Quantity_NOC_CORAL = 52,
	Quantity_NOC_CORAL1 = 53,
	Quantity_NOC_CORAL2 = 54,
	Quantity_NOC_CORAL3 = 55,
	Quantity_NOC_CORAL4 = 56,
	Quantity_NOC_CORNFLOWERBLUE = 57,
	Quantity_NOC_CORNSILK1 = 58,
	Quantity_NOC_CORNSILK2 = 59,
	Quantity_NOC_CORNSILK3 = 60,
	Quantity_NOC_CORNSILK4 = 61,
	Quantity_NOC_CYAN1 = 62,
	Quantity_NOC_CYAN2 = 63,
	Quantity_NOC_CYAN3 = 64,
	Quantity_NOC_CYAN4 = 65,
	Quantity_NOC_DARKGOLDENROD = 66,
	Quantity_NOC_DARKGOLDENROD1 = 67,
	Quantity_NOC_DARKGOLDENROD2 = 68,
	Quantity_NOC_DARKGOLDENROD3 = 69,
	Quantity_NOC_DARKGOLDENROD4 = 70,
	Quantity_NOC_DARKGREEN = 71,
	Quantity_NOC_DARKKHAKI = 72,
	Quantity_NOC_DARKOLIVEGREEN = 73,
	Quantity_NOC_DARKOLIVEGREEN1 = 74,
	Quantity_NOC_DARKOLIVEGREEN2 = 75,
	Quantity_NOC_DARKOLIVEGREEN3 = 76,
	Quantity_NOC_DARKOLIVEGREEN4 = 77,
	Quantity_NOC_DARKORANGE = 78,
	Quantity_NOC_DARKORANGE1 = 79,
	Quantity_NOC_DARKORANGE2 = 80,
	Quantity_NOC_DARKORANGE3 = 81,
	Quantity_NOC_DARKORANGE4 = 82,
	Quantity_NOC_DARKORCHID = 83,
	Quantity_NOC_DARKORCHID1 = 84,
	Quantity_NOC_DARKORCHID2 = 85,
	Quantity_NOC_DARKORCHID3 = 86,
	Quantity_NOC_DARKORCHID4 = 87,
	Quantity_NOC_DARKSALMON = 88,
	Quantity_NOC_DARKSEAGREEN = 89,
	Quantity_NOC_DARKSEAGREEN1 = 90,
	Quantity_NOC_DARKSEAGREEN2 = 91,
	Quantity_NOC_DARKSEAGREEN3 = 92,
	Quantity_NOC_DARKSEAGREEN4 = 93,
	Quantity_NOC_DARKSLATEBLUE = 94,
	Quantity_NOC_DARKSLATEGRAY1 = 95,
	Quantity_NOC_DARKSLATEGRAY2 = 96,
	Quantity_NOC_DARKSLATEGRAY3 = 97,
	Quantity_NOC_DARKSLATEGRAY4 = 98,
	Quantity_NOC_DARKSLATEGRAY = 99,
	Quantity_NOC_DARKTURQUOISE = 100,
	Quantity_NOC_DARKVIOLET = 101,
	Quantity_NOC_DEEPPINK = 102,
	Quantity_NOC_DEEPPINK2 = 103,
	Quantity_NOC_DEEPPINK3 = 104,
	Quantity_NOC_DEEPPINK4 = 105,
	Quantity_NOC_DEEPSKYBLUE1 = 106,
	Quantity_NOC_DEEPSKYBLUE2 = 107,
	Quantity_NOC_DEEPSKYBLUE3 = 108,
	Quantity_NOC_DEEPSKYBLUE4 = 109,
	Quantity_NOC_DODGERBLUE1 = 110,
	Quantity_NOC_DODGERBLUE2 = 111,
	Quantity_NOC_DODGERBLUE3 = 112,
	Quantity_NOC_DODGERBLUE4 = 113,
	Quantity_NOC_FIREBRICK = 114,
	Quantity_NOC_FIREBRICK1 = 115,
	Quantity_NOC_FIREBRICK2 = 116,
	Quantity_NOC_FIREBRICK3 = 117,
	Quantity_NOC_FIREBRICK4 = 118,
	Quantity_NOC_FLORALWHITE = 119,
	Quantity_NOC_FORESTGREEN = 120,
	Quantity_NOC_GAINSBORO = 121,
	Quantity_NOC_GHOSTWHITE = 122,
	Quantity_NOC_GOLD = 123,
	Quantity_NOC_GOLD1 = 124,
	Quantity_NOC_GOLD2 = 125,
	Quantity_NOC_GOLD3 = 126,
	Quantity_NOC_GOLD4 = 127,
	Quantity_NOC_GOLDENROD = 128,
	Quantity_NOC_GOLDENROD1 = 129,
	Quantity_NOC_GOLDENROD2 = 130,
	Quantity_NOC_GOLDENROD3 = 131,
	Quantity_NOC_GOLDENROD4 = 132,
	Quantity_NOC_GRAY = 133,
	Quantity_NOC_GRAY0 = 134,
	Quantity_NOC_GRAY1 = 135,
	Quantity_NOC_GRAY10 = 136,
	Quantity_NOC_GRAY11 = 137,
	Quantity_NOC_GRAY12 = 138,
	Quantity_NOC_GRAY13 = 139,
	Quantity_NOC_GRAY14 = 140,
	Quantity_NOC_GRAY15 = 141,
	Quantity_NOC_GRAY16 = 142,
	Quantity_NOC_GRAY17 = 143,
	Quantity_NOC_GRAY18 = 144,
	Quantity_NOC_GRAY19 = 145,
	Quantity_NOC_GRAY2 = 146,
	Quantity_NOC_GRAY20 = 147,
	Quantity_NOC_GRAY21 = 148,
	Quantity_NOC_GRAY22 = 149,
	Quantity_NOC_GRAY23 = 150,
	Quantity_NOC_GRAY24 = 151,
	Quantity_NOC_GRAY25 = 152,
	Quantity_NOC_GRAY26 = 153,
	Quantity_NOC_GRAY27 = 154,
	Quantity_NOC_GRAY28 = 155,
	Quantity_NOC_GRAY29 = 156,
	Quantity_NOC_GRAY3 = 157,
	Quantity_NOC_GRAY30 = 158,
	Quantity_NOC_GRAY31 = 159,
	Quantity_NOC_GRAY32 = 160,
	Quantity_NOC_GRAY33 = 161,
	Quantity_NOC_GRAY34 = 162,
	Quantity_NOC_GRAY35 = 163,
	Quantity_NOC_GRAY36 = 164,
	Quantity_NOC_GRAY37 = 165,
	Quantity_NOC_GRAY38 = 166,
	Quantity_NOC_GRAY39 = 167,
	Quantity_NOC_GRAY4 = 168,
	Quantity_NOC_GRAY40 = 169,
	Quantity_NOC_GRAY41 = 170,
	Quantity_NOC_GRAY42 = 171,
	Quantity_NOC_GRAY43 = 172,
	Quantity_NOC_GRAY44 = 173,
	Quantity_NOC_GRAY45 = 174,
	Quantity_NOC_GRAY46 = 175,
	Quantity_NOC_GRAY47 = 176,
	Quantity_NOC_GRAY48 = 177,
	Quantity_NOC_GRAY49 = 178,
	Quantity_NOC_GRAY5 = 179,
	Quantity_NOC_GRAY50 = 180,
	Quantity_NOC_GRAY51 = 181,
	Quantity_NOC_GRAY52 = 182,
	Quantity_NOC_GRAY53 = 183,
	Quantity_NOC_GRAY54 = 184,
	Quantity_NOC_GRAY55 = 185,
	Quantity_NOC_GRAY56 = 186,
	Quantity_NOC_GRAY57 = 187,
	Quantity_NOC_GRAY58 = 188,
	Quantity_NOC_GRAY59 = 189,
	Quantity_NOC_GRAY6 = 190,
	Quantity_NOC_GRAY60 = 191,
	Quantity_NOC_GRAY61 = 192,
	Quantity_NOC_GRAY62 = 193,
	Quantity_NOC_GRAY63 = 194,
	Quantity_NOC_GRAY64 = 195,
	Quantity_NOC_GRAY65 = 196,
	Quantity_NOC_GRAY66 = 197,
	Quantity_NOC_GRAY67 = 198,
	Quantity_NOC_GRAY68 = 199,
	Quantity_NOC_GRAY69 = 200,
	Quantity_NOC_GRAY7 = 201,
	Quantity_NOC_GRAY70 = 202,
	Quantity_NOC_GRAY71 = 203,
	Quantity_NOC_GRAY72 = 204,
	Quantity_NOC_GRAY73 = 205,
	Quantity_NOC_GRAY74 = 206,
	Quantity_NOC_GRAY75 = 207,
	Quantity_NOC_GRAY76 = 208,
	Quantity_NOC_GRAY77 = 209,
	Quantity_NOC_GRAY78 = 210,
	Quantity_NOC_GRAY79 = 211,
	Quantity_NOC_GRAY8 = 212,
	Quantity_NOC_GRAY80 = 213,
	Quantity_NOC_GRAY81 = 214,
	Quantity_NOC_GRAY82 = 215,
	Quantity_NOC_GRAY83 = 216,
	Quantity_NOC_GRAY85 = 217,
	Quantity_NOC_GRAY86 = 218,
	Quantity_NOC_GRAY87 = 219,
	Quantity_NOC_GRAY88 = 220,
	Quantity_NOC_GRAY89 = 221,
	Quantity_NOC_GRAY9 = 222,
	Quantity_NOC_GRAY90 = 223,
	Quantity_NOC_GRAY91 = 224,
	Quantity_NOC_GRAY92 = 225,
	Quantity_NOC_GRAY93 = 226,
	Quantity_NOC_GRAY94 = 227,
	Quantity_NOC_GRAY95 = 228,
	Quantity_NOC_GREEN = 229,
	Quantity_NOC_GREEN1 = 230,
	Quantity_NOC_GREEN2 = 231,
	Quantity_NOC_GREEN3 = 232,
	Quantity_NOC_GREEN4 = 233,
	Quantity_NOC_GREENYELLOW = 234,
	Quantity_NOC_GRAY97 = 235,
	Quantity_NOC_GRAY98 = 236,
	Quantity_NOC_GRAY99 = 237,
	Quantity_NOC_HONEYDEW = 238,
	Quantity_NOC_HONEYDEW2 = 239,
	Quantity_NOC_HONEYDEW3 = 240,
	Quantity_NOC_HONEYDEW4 = 241,
	Quantity_NOC_HOTPINK = 242,
	Quantity_NOC_HOTPINK1 = 243,
	Quantity_NOC_HOTPINK2 = 244,
	Quantity_NOC_HOTPINK3 = 245,
	Quantity_NOC_HOTPINK4 = 246,
	Quantity_NOC_INDIANRED = 247,
	Quantity_NOC_INDIANRED1 = 248,
	Quantity_NOC_INDIANRED2 = 249,
	Quantity_NOC_INDIANRED3 = 250,
	Quantity_NOC_INDIANRED4 = 251,
	Quantity_NOC_IVORY = 252,
	Quantity_NOC_IVORY2 = 253,
	Quantity_NOC_IVORY3 = 254,
	Quantity_NOC_IVORY4 = 255,
	Quantity_NOC_KHAKI = 256,
	Quantity_NOC_KHAKI1 = 257,
	Quantity_NOC_KHAKI2 = 258,
	Quantity_NOC_KHAKI3 = 259,
	Quantity_NOC_KHAKI4 = 260,
	Quantity_NOC_LAVENDER = 261,
	Quantity_NOC_LAVENDERBLUSH1 = 262,
	Quantity_NOC_LAVENDERBLUSH2 = 263,
	Quantity_NOC_LAVENDERBLUSH3 = 264,
	Quantity_NOC_LAVENDERBLUSH4 = 265,
	Quantity_NOC_LAWNGREEN = 266,
	Quantity_NOC_LEMONCHIFFON1 = 267,
	Quantity_NOC_LEMONCHIFFON2 = 268,
	Quantity_NOC_LEMONCHIFFON3 = 269,
	Quantity_NOC_LEMONCHIFFON4 = 270,
	Quantity_NOC_LIGHTBLUE = 271,
	Quantity_NOC_LIGHTBLUE1 = 272,
	Quantity_NOC_LIGHTBLUE2 = 273,
	Quantity_NOC_LIGHTBLUE3 = 274,
	Quantity_NOC_LIGHTBLUE4 = 275,
	Quantity_NOC_LIGHTCORAL = 276,
	Quantity_NOC_LIGHTCYAN1 = 277,
	Quantity_NOC_LIGHTCYAN2 = 278,
	Quantity_NOC_LIGHTCYAN3 = 279,
	Quantity_NOC_LIGHTCYAN4 = 280,
	Quantity_NOC_LIGHTGOLDENROD = 281,
	Quantity_NOC_LIGHTGOLDENROD1 = 282,
	Quantity_NOC_LIGHTGOLDENROD2 = 283,
	Quantity_NOC_LIGHTGOLDENROD3 = 284,
	Quantity_NOC_LIGHTGOLDENROD4 = 285,
	Quantity_NOC_LIGHTGOLDENRODYELLOW = 286,
	Quantity_NOC_LIGHTGRAY = 287,
	Quantity_NOC_LIGHTPINK = 288,
	Quantity_NOC_LIGHTPINK1 = 289,
	Quantity_NOC_LIGHTPINK2 = 290,
	Quantity_NOC_LIGHTPINK3 = 291,
	Quantity_NOC_LIGHTPINK4 = 292,
	Quantity_NOC_LIGHTSALMON1 = 293,
	Quantity_NOC_LIGHTSALMON2 = 294,
	Quantity_NOC_LIGHTSALMON3 = 295,
	Quantity_NOC_LIGHTSALMON4 = 296,
	Quantity_NOC_LIGHTSEAGREEN = 297,
	Quantity_NOC_LIGHTSKYBLUE = 298,
	Quantity_NOC_LIGHTSKYBLUE1 = 299,
	Quantity_NOC_LIGHTSKYBLUE2 = 300,
	Quantity_NOC_LIGHTSKYBLUE3 = 301,
	Quantity_NOC_LIGHTSKYBLUE4 = 302,
	Quantity_NOC_LIGHTSLATEBLUE = 303,
	Quantity_NOC_LIGHTSLATEGRAY = 304,
	Quantity_NOC_LIGHTSTEELBLUE = 305,
	Quantity_NOC_LIGHTSTEELBLUE1 = 306,
	Quantity_NOC_LIGHTSTEELBLUE2 = 307,
	Quantity_NOC_LIGHTSTEELBLUE3 = 308,
	Quantity_NOC_LIGHTSTEELBLUE4 = 309,
	Quantity_NOC_LIGHTYELLOW = 310,
	Quantity_NOC_LIGHTYELLOW2 = 311,
	Quantity_NOC_LIGHTYELLOW3 = 312,
	Quantity_NOC_LIGHTYELLOW4 = 313,
	Quantity_NOC_LIMEGREEN = 314,
	Quantity_NOC_LINEN = 315,
	Quantity_NOC_MAGENTA1 = 316,
	Quantity_NOC_MAGENTA2 = 317,
	Quantity_NOC_MAGENTA3 = 318,
	Quantity_NOC_MAGENTA4 = 319,
	Quantity_NOC_MAROON = 320,
	Quantity_NOC_MAROON1 = 321,
	Quantity_NOC_MAROON2 = 322,
	Quantity_NOC_MAROON3 = 323,
	Quantity_NOC_MAROON4 = 324,
	Quantity_NOC_MEDIUMAQUAMARINE = 325,
	Quantity_NOC_MEDIUMORCHID = 326,
	Quantity_NOC_MEDIUMORCHID1 = 327,
	Quantity_NOC_MEDIUMORCHID2 = 328,
	Quantity_NOC_MEDIUMORCHID3 = 329,
	Quantity_NOC_MEDIUMORCHID4 = 330,
	Quantity_NOC_MEDIUMPURPLE = 331,
	Quantity_NOC_MEDIUMPURPLE1 = 332,
	Quantity_NOC_MEDIUMPURPLE2 = 333,
	Quantity_NOC_MEDIUMPURPLE3 = 334,
	Quantity_NOC_MEDIUMPURPLE4 = 335,
	Quantity_NOC_MEDIUMSEAGREEN = 336,
	Quantity_NOC_MEDIUMSLATEBLUE = 337,
	Quantity_NOC_MEDIUMSPRINGGREEN = 338,
	Quantity_NOC_MEDIUMTURQUOISE = 339,
	Quantity_NOC_MEDIUMVIOLETRED = 340,
	Quantity_NOC_MIDNIGHTBLUE = 341,
	Quantity_NOC_MINTCREAM = 342,
	Quantity_NOC_MISTYROSE = 343,
	Quantity_NOC_MISTYROSE2 = 344,
	Quantity_NOC_MISTYROSE3 = 345,
	Quantity_NOC_MISTYROSE4 = 346,
	Quantity_NOC_MOCCASIN = 347,
	Quantity_NOC_NAVAJOWHITE1 = 348,
	Quantity_NOC_NAVAJOWHITE2 = 349,
	Quantity_NOC_NAVAJOWHITE3 = 350,
	Quantity_NOC_NAVAJOWHITE4 = 351,
	Quantity_NOC_NAVYBLUE = 352,
	Quantity_NOC_OLDLACE = 353,
	Quantity_NOC_OLIVEDRAB = 354,
	Quantity_NOC_OLIVEDRAB1 = 355,
	Quantity_NOC_OLIVEDRAB2 = 356,
	Quantity_NOC_OLIVEDRAB3 = 357,
	Quantity_NOC_OLIVEDRAB4 = 358,
	Quantity_NOC_ORANGE = 359,
	Quantity_NOC_ORANGE1 = 360,
	Quantity_NOC_ORANGE2 = 361,
	Quantity_NOC_ORANGE3 = 362,
	Quantity_NOC_ORANGE4 = 363,
	Quantity_NOC_ORANGERED = 364,
	Quantity_NOC_ORANGERED1 = 365,
	Quantity_NOC_ORANGERED2 = 366,
	Quantity_NOC_ORANGERED3 = 367,
	Quantity_NOC_ORANGERED4 = 368,
	Quantity_NOC_ORCHID = 369,
	Quantity_NOC_ORCHID1 = 370,
	Quantity_NOC_ORCHID2 = 371,
	Quantity_NOC_ORCHID3 = 372,
	Quantity_NOC_ORCHID4 = 373,
	Quantity_NOC_PALEGOLDENROD = 374,
	Quantity_NOC_PALEGREEN = 375,
	Quantity_NOC_PALEGREEN1 = 376,
	Quantity_NOC_PALEGREEN2 = 377,
	Quantity_NOC_PALEGREEN3 = 378,
	Quantity_NOC_PALEGREEN4 = 379,
	Quantity_NOC_PALETURQUOISE = 380,
	Quantity_NOC_PALETURQUOISE1 = 381,
	Quantity_NOC_PALETURQUOISE2 = 382,
	Quantity_NOC_PALETURQUOISE3 = 383,
	Quantity_NOC_PALETURQUOISE4 = 384,
	Quantity_NOC_PALEVIOLETRED = 385,
	Quantity_NOC_PALEVIOLETRED1 = 386,
	Quantity_NOC_PALEVIOLETRED2 = 387,
	Quantity_NOC_PALEVIOLETRED3 = 388,
	Quantity_NOC_PALEVIOLETRED4 = 389,
	Quantity_NOC_PAPAYAWHIP = 390,
	Quantity_NOC_PEACHPUFF = 391,
	Quantity_NOC_PEACHPUFF2 = 392,
	Quantity_NOC_PEACHPUFF3 = 393,
	Quantity_NOC_PEACHPUFF4 = 394,
	Quantity_NOC_PERU = 395,
	Quantity_NOC_PINK = 396,
	Quantity_NOC_PINK1 = 397,
	Quantity_NOC_PINK2 = 398,
	Quantity_NOC_PINK3 = 399,
	Quantity_NOC_PINK4 = 400,
	Quantity_NOC_PLUM = 401,
	Quantity_NOC_PLUM1 = 402,
	Quantity_NOC_PLUM2 = 403,
	Quantity_NOC_PLUM3 = 404,
	Quantity_NOC_PLUM4 = 405,
	Quantity_NOC_POWDERBLUE = 406,
	Quantity_NOC_PURPLE = 407,
	Quantity_NOC_PURPLE1 = 408,
	Quantity_NOC_PURPLE2 = 409,
	Quantity_NOC_PURPLE3 = 410,
	Quantity_NOC_PURPLE4 = 411,
	Quantity_NOC_RED = 412,
	Quantity_NOC_RED1 = 413,
	Quantity_NOC_RED2 = 414,
	Quantity_NOC_RED3 = 415,
	Quantity_NOC_RED4 = 416,
	Quantity_NOC_ROSYBROWN = 417,
	Quantity_NOC_ROSYBROWN1 = 418,
	Quantity_NOC_ROSYBROWN2 = 419,
	Quantity_NOC_ROSYBROWN3 = 420,
	Quantity_NOC_ROSYBROWN4 = 421,
	Quantity_NOC_ROYALBLUE = 422,
	Quantity_NOC_ROYALBLUE1 = 423,
	Quantity_NOC_ROYALBLUE2 = 424,
	Quantity_NOC_ROYALBLUE3 = 425,
	Quantity_NOC_ROYALBLUE4 = 426,
	Quantity_NOC_SADDLEBROWN = 427,
	Quantity_NOC_SALMON = 428,
	Quantity_NOC_SALMON1 = 429,
	Quantity_NOC_SALMON2 = 430,
	Quantity_NOC_SALMON3 = 431,
	Quantity_NOC_SALMON4 = 432,
	Quantity_NOC_SANDYBROWN = 433,
	Quantity_NOC_SEAGREEN = 434,
	Quantity_NOC_SEAGREEN1 = 435,
	Quantity_NOC_SEAGREEN2 = 436,
	Quantity_NOC_SEAGREEN3 = 437,
	Quantity_NOC_SEAGREEN4 = 438,
	Quantity_NOC_SEASHELL = 439,
	Quantity_NOC_SEASHELL2 = 440,
	Quantity_NOC_SEASHELL3 = 441,
	Quantity_NOC_SEASHELL4 = 442,
	Quantity_NOC_BEET = 443,
	Quantity_NOC_TEAL = 444,
	Quantity_NOC_SIENNA = 445,
	Quantity_NOC_SIENNA1 = 446,
	Quantity_NOC_SIENNA2 = 447,
	Quantity_NOC_SIENNA3 = 448,
	Quantity_NOC_SIENNA4 = 449,
	Quantity_NOC_SKYBLUE = 450,
	Quantity_NOC_SKYBLUE1 = 451,
	Quantity_NOC_SKYBLUE2 = 452,
	Quantity_NOC_SKYBLUE3 = 453,
	Quantity_NOC_SKYBLUE4 = 454,
	Quantity_NOC_SLATEBLUE = 455,
	Quantity_NOC_SLATEBLUE1 = 456,
	Quantity_NOC_SLATEBLUE2 = 457,
	Quantity_NOC_SLATEBLUE3 = 458,
	Quantity_NOC_SLATEBLUE4 = 459,
	Quantity_NOC_SLATEGRAY1 = 460,
	Quantity_NOC_SLATEGRAY2 = 461,
	Quantity_NOC_SLATEGRAY3 = 462,
	Quantity_NOC_SLATEGRAY4 = 463,
	Quantity_NOC_SLATEGRAY = 464,
	Quantity_NOC_SNOW = 465,
	Quantity_NOC_SNOW2 = 466,
	Quantity_NOC_SNOW3 = 467,
	Quantity_NOC_SNOW4 = 468,
	Quantity_NOC_SPRINGGREEN = 469,
	Quantity_NOC_SPRINGGREEN2 = 470,
	Quantity_NOC_SPRINGGREEN3 = 471,
	Quantity_NOC_SPRINGGREEN4 = 472,
	Quantity_NOC_STEELBLUE = 473,
	Quantity_NOC_STEELBLUE1 = 474,
	Quantity_NOC_STEELBLUE2 = 475,
	Quantity_NOC_STEELBLUE3 = 476,
	Quantity_NOC_STEELBLUE4 = 477,
	Quantity_NOC_TAN = 478,
	Quantity_NOC_TAN1 = 479,
	Quantity_NOC_TAN2 = 480,
	Quantity_NOC_TAN3 = 481,
	Quantity_NOC_TAN4 = 482,
	Quantity_NOC_THISTLE = 483,
	Quantity_NOC_THISTLE1 = 484,
	Quantity_NOC_THISTLE2 = 485,
	Quantity_NOC_THISTLE3 = 486,
	Quantity_NOC_THISTLE4 = 487,
	Quantity_NOC_TOMATO = 488,
	Quantity_NOC_TOMATO1 = 489,
	Quantity_NOC_TOMATO2 = 490,
	Quantity_NOC_TOMATO3 = 491,
	Quantity_NOC_TOMATO4 = 492,
	Quantity_NOC_TURQUOISE = 493,
	Quantity_NOC_TURQUOISE1 = 494,
	Quantity_NOC_TURQUOISE2 = 495,
	Quantity_NOC_TURQUOISE3 = 496,
	Quantity_NOC_TURQUOISE4 = 497,
	Quantity_NOC_VIOLET = 498,
	Quantity_NOC_VIOLETRED = 499,
	Quantity_NOC_VIOLETRED1 = 500,
	Quantity_NOC_VIOLETRED2 = 501,
	Quantity_NOC_VIOLETRED3 = 502,
	Quantity_NOC_VIOLETRED4 = 503,
	Quantity_NOC_WHEAT = 504,
	Quantity_NOC_WHEAT1 = 505,
	Quantity_NOC_WHEAT2 = 506,
	Quantity_NOC_WHEAT3 = 507,
	Quantity_NOC_WHEAT4 = 508,
	Quantity_NOC_WHITESMOKE = 509,
	Quantity_NOC_YELLOW = 510,
	Quantity_NOC_YELLOW1 = 511,
	Quantity_NOC_YELLOW2 = 512,
	Quantity_NOC_YELLOW3 = 513,
	Quantity_NOC_YELLOW4 = 514,
	Quantity_NOC_YELLOWGREEN = 515,
	Quantity_NOC_WHITE = 516,
};

enum Quantity_TypeOfColor {
	Quantity_TOC_RGB = 0,
	Quantity_TOC_HLS = 1,
};

enum Quantity_PhysicalQuantity {
	Quantity_MASS = 0,
	Quantity_PLANEANGLE = 1,
	Quantity_SOLIDANGLE = 2,
	Quantity_LENGTH = 3,
	Quantity_AREA = 4,
	Quantity_VOLUME = 5,
	Quantity_SPEED = 6,
	Quantity_VELOCITY = 7,
	Quantity_ACCELERATION = 8,
	Quantity_ANGULARVELOCITY = 9,
	Quantity_FREQUENCY = 10,
	Quantity_TEMPERATURE = 11,
	Quantity_AMOUNTOFSUBSTANCE = 12,
	Quantity_DENSITY = 13,
	Quantity_MASSFLOW = 14,
	Quantity_VOLUMEFLOW = 15,
	Quantity_CONSUMPTION = 16,
	Quantity_MOMENTUM = 17,
	Quantity_KINETICMOMENT = 18,
	Quantity_MOMENTOFINERTIA = 19,
	Quantity_FORCE = 20,
	Quantity_MOMENTOFAFORCE = 21,
	Quantity_TORQUE = 22,
	Quantity_WEIGHT = 23,
	Quantity_PRESSURE = 24,
	Quantity_VISCOSITY = 25,
	Quantity_KINEMATICVISCOSITY = 26,
	Quantity_ENERGY = 27,
	Quantity_WORK = 28,
	Quantity_POWER = 29,
	Quantity_SURFACETENSION = 30,
	Quantity_COEFFICIENTOFEXPANSION = 31,
	Quantity_THERMALCONDUCTIVITY = 32,
	Quantity_SPECIFICHEATCAPACITY = 33,
	Quantity_ENTROPY = 34,
	Quantity_ENTHALPY = 35,
	Quantity_LUMINOUSINTENSITY = 36,
	Quantity_LUMINOUSFLUX = 37,
	Quantity_LUMINANCE = 38,
	Quantity_ILLUMINANCE = 39,
	Quantity_LUMINOUSEXPOSITION = 40,
	Quantity_LUMINOUSEFFICACITY = 41,
	Quantity_ELECTRICCHARGE = 42,
	Quantity_ELECTRICCURRENT = 43,
	Quantity_ELECTRICFIELDSTRENGTH = 44,
	Quantity_ELECTRICPOTENTIAL = 45,
	Quantity_ELECTRICCAPACITANCE = 46,
	Quantity_MAGNETICFLUX = 47,
	Quantity_MAGNETICFLUXDENSITY = 48,
	Quantity_MAGNETICFIELDSTRENGTH = 49,
	Quantity_RELUCTANCE = 50,
	Quantity_RESISTANCE = 51,
	Quantity_INDUCTANCE = 52,
	Quantity_CAPACITANCE = 53,
	Quantity_IMPEDANCE = 54,
	Quantity_ADMITTANCE = 55,
	Quantity_RESISTIVITY = 56,
	Quantity_CONDUCTIVITY = 57,
	Quantity_MOLARMASS = 58,
	Quantity_MOLARVOLUME = 59,
	Quantity_CONCENTRATION = 60,
	Quantity_MOLARCONCENTRATION = 61,
	Quantity_MOLARITY = 62,
	Quantity_SOUNDINTENSITY = 63,
	Quantity_ACOUSTICINTENSITY = 64,
	Quantity_ACTIVITY = 65,
	Quantity_ABSORBEDDOSE = 66,
	Quantity_DOSEEQUIVALENT = 67,
};

/* end public enums declaration */

/* handles */
%wrap_handle(Quantity_HArray1OfColor)
/* end handles declaration */

/* templates */
%template(Quantity_Array1OfColor) NCollection_Array1 <Quantity_Color>;

%extend NCollection_Array1 <Quantity_Color> {
    %pythoncode {
    def __getitem__(self, index):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            return self.Value(index + self.Lower())

    def __setitem__(self, index, value):
        if index + self.Lower() > self.Upper():
            raise IndexError("index out of range")
        else:
            self.SetValue(index + self.Lower(), value)

    def __len__(self):
        return self.Length()

    def __iter__(self):
        self.low = self.Lower()
        self.up = self.Upper()
        self.current = self.Lower() - 1
        return self

    def next(self):
        if self.current >= self.Upper():
            raise StopIteration
        else:
            self.current += 1
        return self.Value(self.current)

    __next__ = next
    }
};
%template(Quantity_Array2OfColor) NCollection_Array2 <Quantity_Color>;
/* end templates declaration */

/* typedefs */
typedef Standard_Real Quantity_ElectricPotential;
typedef Standard_Real Quantity_Resistivity;
typedef Standard_Real Quantity_AbsorbedDose;
typedef Standard_Real Quantity_ElectricFieldStrength;
typedef Standard_Real Quantity_MolarMass;
typedef Standard_Real Quantity_Velocity;
typedef Standard_Real Quantity_Admittance;
typedef Standard_Real Quantity_MagneticFieldStrength;
typedef Standard_Real Quantity_Momentum;
typedef Standard_Real Quantity_Content;
typedef Standard_Real Quantity_AcousticIntensity;
typedef Standard_Real Quantity_DoseEquivalent;
typedef Standard_Real Quantity_Rate;
typedef Standard_Real Quantity_Activity;
typedef Standard_Real Quantity_Normality;
typedef Standard_Real Quantity_Impedance;
typedef Standard_Real Quantity_Energy;
typedef Standard_Real Quantity_SoundIntensity;
typedef Standard_Real Quantity_Luminance;
typedef Standard_Real Quantity_CoefficientOfExpansion;
typedef Standard_Real Quantity_Illuminance;
typedef Standard_Real Quantity_Capacitance;
typedef Standard_Real Quantity_Weight;
typedef Standard_Real Quantity_Ratio;
typedef Standard_Real Quantity_MolarConcentration;
typedef Standard_Real Quantity_Quotient;
typedef Standard_Real Quantity_Factor;
typedef Standard_Real Quantity_MassFlow;
typedef Standard_Real Quantity_Consumption;
typedef Standard_Real Quantity_Entropy;
typedef NCollection_Array1 <Quantity_Color> Quantity_Array1OfColor;
typedef Standard_Real Quantity_Concentration;
typedef Standard_Real Quantity_Pressure;
typedef Standard_Real Quantity_Resistance;
typedef Standard_Real Quantity_Frequency;
typedef Standard_Real Quantity_ThermalConductivity;
typedef Standard_Real Quantity_Length;
typedef Standard_Real Quantity_Inductance;
typedef Standard_Real Quantity_Torque;
typedef Standard_Real Quantity_Mass;
typedef Standard_Real Quantity_SurfaceTension;
typedef Standard_Real Quantity_KineticMoment;
typedef Standard_Real Quantity_Work;
typedef Standard_Real Quantity_Speed;
typedef Standard_Real Quantity_Index;
typedef Standard_Real Quantity_Power;
typedef NCollection_Array2 <Quantity_Color> Quantity_Array2OfColor;
typedef Standard_Real Quantity_MomentOfInertia;
typedef Standard_Real Quantity_Molarity;
typedef Standard_Real Quantity_ElectricCharge;
typedef Standard_Real Quantity_ElectricCapacitance;
typedef Standard_Real Quantity_Scalaire;
typedef Standard_Real Quantity_Density;
typedef Standard_Real Quantity_MolarVolume;
typedef Standard_Real Quantity_MomentOfAForce;
typedef Standard_Real Quantity_AngularVelocity;
typedef Standard_Real Quantity_LuminousIntensity;
typedef Standard_Real Quantity_Volume;
typedef Standard_Real Quantity_ElectricCurrent;
typedef Standard_Real Quantity_Reluctance;
typedef Standard_Real Quantity_Parameter;
typedef Standard_Real Quantity_Coefficient;
typedef Standard_Real Quantity_Area;
typedef Standard_Real Quantity_SolidAngle;
typedef Standard_Real Quantity_AmountOfSubstance;
typedef Standard_Real Quantity_LuminousEfficacity;
typedef Standard_Real Quantity_LuminousExposition;
typedef Standard_Real Quantity_MagneticFlux;
typedef Standard_Real Quantity_Conductivity;
typedef Standard_Real Quantity_Enthalpy;
typedef Standard_Real Quantity_Force;
typedef Standard_Real Quantity_PlaneAngle;
typedef Standard_Real Quantity_Acceleration;
typedef Standard_Real Quantity_KinematicViscosity;
typedef Standard_Real Quantity_MagneticFluxDensity;
typedef Standard_Real Quantity_Temperature;
typedef Standard_Real Quantity_LuminousFlux;
typedef Standard_Real Quantity_Viscosity;
typedef Standard_Real Quantity_SpecificHeatCapacity;
typedef Standard_Real Quantity_VolumeFlow;
typedef Standard_Real Quantity_Constant;
/* end typedefs declaration */

%nodefaultctor Quantity_Color;
class Quantity_Color {
	public:
		%feature("compactdefaultargs") Argb2color;
		%feature("autodoc", "	* Convert integer ARGB value to Color. Alpha bits are ignored

	:param theARGB:
	:type theARGB: int
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: void
") Argb2color;
		static void Argb2color (const Standard_Integer theARGB,Quantity_Color & theColor);
		%feature("compactdefaultargs") Blue;
		%feature("autodoc", "	* Returns the Blue component (quantity of blue) of the color within range [0.0; 1.0].

	:rtype: float
") Blue;
		Standard_Real Blue ();
		%feature("compactdefaultargs") ChangeContrast;
		%feature("autodoc", "	* Increases or decreases the contrast by <ADelta>. <ADelta> is a percentage. Any value greater than zero will increase the contrast. The variation is expressed as a percentage of the current value. It is a variation of the saturation.

	:param ADelta:
	:type ADelta: float
	:rtype: None
") ChangeContrast;
		void ChangeContrast (const Standard_Real ADelta);
		%feature("compactdefaultargs") ChangeIntensity;
		%feature("autodoc", "	* Increases or decreases the intensity by <ADelta>. <ADelta> is a percentage. Any value greater than zero will increase the intensity. The variation is expressed as a percentage of the current value. It is a variation of the lightness.

	:param ADelta:
	:type ADelta: float
	:rtype: None
") ChangeIntensity;
		void ChangeIntensity (const Standard_Real ADelta);
		%feature("compactdefaultargs") Color2argb;
		%feature("autodoc", "	* Convert the Color value to ARGB integer value. theARGB has Alpha equal to zero, so the output is formatted as 0x00RRGGBB

	:param theColor:
	:type theColor: Quantity_Color &
	:param theARGB:
	:type theARGB: int &
	:rtype: void
") Color2argb;
		static void Color2argb (const Quantity_Color & theColor,Standard_Integer &OutValue);
		%feature("compactdefaultargs") ColorFromHex;
		%feature("autodoc", "	* Parses the string as a hex color (like '#FF0' for short RGB color, or '#FFFF00' for RGB color) @param theHexColorString the string to be parsed @param theColor a color that is a result of parsing returns true if parsing was successful, or false otherwise

	:param theHexColorString:
	:type theHexColorString: char *
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: bool
") ColorFromHex;
		static bool ColorFromHex (const char * theHexColorString,Quantity_Color & theColor);
		%feature("compactdefaultargs") ColorFromName;
		%feature("autodoc", "	* Finds color from predefined names. For example, the name of the color which corresponds to 'BLACK' is Quantity_NOC_BLACK. Returns false if name is unknown.

	:param theName:
	:type theName: char *
	:param theColor:
	:type theColor: Quantity_NameOfColor &
	:rtype: bool
") ColorFromName;
		static Standard_Boolean ColorFromName (const char * theName,Quantity_NameOfColor & theColor);
		%feature("compactdefaultargs") ColorFromName;
		%feature("autodoc", "	* Finds color from predefined names. For example, the name of the color which corresponds to 'BLACK' is Quantity_NOC_BLACK. Returns false if name is unknown. @param theColorNameString the color name @param theColor a found color returns false if the color name is unknown, or true if the search by color name was successful

	:param theColorNameString:
	:type theColorNameString: char *
	:param theColor:
	:type theColor: Quantity_Color &
	:rtype: bool
") ColorFromName;
		static Standard_Boolean ColorFromName (const char * theColorNameString,Quantity_Color & theColor);
		%feature("compactdefaultargs") ColorToHex;
		%feature("autodoc", "	* Returns hex sRGB string in format '#FFAAFF'.

	:param theColor:
	:type theColor: Quantity_Color &
	:param theToPrefixHash: default value is true
	:type theToPrefixHash: bool
	:rtype: TCollection_AsciiString
") ColorToHex;
		static TCollection_AsciiString ColorToHex (const Quantity_Color & theColor,const bool theToPrefixHash = true);
		%feature("compactdefaultargs") Delta;
		%feature("autodoc", "	* Returns the percentage change of contrast and intensity between <self> and <AColor>. <DC> and <DI> are percentages, either positive or negative. The calculation is with respect to the current value of <self> If <DC> is positive then <self> is more contrasty. If <DI> is positive then <self> is more intense.

	:param AColor:
	:type AColor: Quantity_Color &
	:param DC:
	:type DC: float &
	:param DI:
	:type DI: float &
	:rtype: None
") Delta;
		void Delta (const Quantity_Color & AColor,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Distance;
		%feature("autodoc", "	* Returns the distance between two colours. It's a value between 0 and the square root of 3 (the black/white distance)

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: float
") Distance;
		Standard_Real Distance (const Quantity_Color & AColor);
		%feature("compactdefaultargs") DumpJson;
		%feature("autodoc", "	* Dumps the content of me into the stream

	:param theOStream:
	:type theOStream: Standard_OStream &
	:param theDepth: default value is -1
	:type theDepth: int
	:rtype: None
") DumpJson;
		void DumpJson (Standard_OStream & theOStream,const Standard_Integer theDepth = -1);
		%feature("compactdefaultargs") Epsilon;
		%feature("autodoc", "	* Returns the specified value used to compare <self> and an other color in IsDifferent and in IsEqual methods.

	:rtype: float
") Epsilon;
		static Standard_Real Epsilon ();
		%feature("compactdefaultargs") Green;
		%feature("autodoc", "	* Returns the Green component (quantity of green) of the color within range [0.0; 1.0].

	:rtype: float
") Green;
		Standard_Real Green ();
		%feature("compactdefaultargs") HlsRgb;
		%feature("autodoc", "	* Converts HLS components into RGB ones.

	:param H:
	:type H: float
	:param L:
	:type L: float
	:param S:
	:type S: float
	:param R:
	:type R: float &
	:param G:
	:type G: float &
	:param B:
	:type B: float &
	:rtype: void
") HlsRgb;
		static void HlsRgb (const Standard_Real H,const Standard_Real L,const Standard_Real S,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Hue;
		%feature("autodoc", "	* Returns the Hue component (hue angle) of the color in degrees within range [0.0; 360.0], 0.0 being Red. -1.0 is a special value reserved for grayscale color (S should be 0.0)

	:rtype: float
") Hue;
		Standard_Real Hue ();
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "	* Returns Standard_True if the distance between <self> and <Other> is greater than Epsilon ().

	:param Other:
	:type Other: Quantity_Color &
	:rtype: bool
") IsDifferent;
		Standard_Boolean IsDifferent (const Quantity_Color & Other);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns true if the Other color is - different from, or - equal to this color. Two colors are considered to be equal if their distance is no greater than Epsilon(). These methods are aliases of operator != and operator ==.

	:param Other:
	:type Other: Quantity_Color &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Quantity_Color & Other);
		%feature("compactdefaultargs") Light;
		%feature("autodoc", "	* Returns the Light component (value of the lightness) of the color within range [0.0; 1.0].

	:rtype: float
") Light;
		Standard_Real Light ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of the color defined by its quantities of red R, green G and blue B; more precisely this is the nearest color from the Quantity_NameOfColor enumeration. Exceptions Standard_OutOfRange if R, G or B is less than 0. or greater than 1.

	:rtype: Quantity_NameOfColor
") Name;
		Quantity_NameOfColor Name ();
		%feature("compactdefaultargs") Name;
		%feature("autodoc", "	* Returns the name of the colour for which the RGB components are nearest to <R>, <G> and <B>.

	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:rtype: Quantity_NameOfColor
") Name;
		static Quantity_NameOfColor Name (const Standard_Real R,const Standard_Real G,const Standard_Real B);
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "	* Creates Quantity_NOC_YELLOW color.

	:rtype: None
") Quantity_Color;
		 Quantity_Color ();
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "	* Creates the color from enumeration value.

	:param AName:
	:type AName: Quantity_NameOfColor
	:rtype: None
") Quantity_Color;
		 Quantity_Color (const Quantity_NameOfColor AName);
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "	* Creates a color according to the definition system theType. Quantity_TOC_RGB: - theR1 the value of Red within range [0.0; 1.0] - theR2 the value of Green within range [0.0; 1.0] - theR3 the value of Blue within range [0.0; 1.0] //! Quantity_TOC_HLS: - theR1 is the Hue (H) angle in degrees within range [0.0; 360.0], 0.0 being Red. Value -1.0 is a special value reserved for grayscale color (S should be 0.0). - theR2 is the Lightness (L) within range [0.0; 1.0] - theR3 is the Saturation (S) within range [0.0; 1.0]

	:param theR1:
	:type theR1: float
	:param theR2:
	:type theR2: float
	:param theR3:
	:type theR3: float
	:param theType:
	:type theType: Quantity_TypeOfColor
	:rtype: None
") Quantity_Color;
		 Quantity_Color (const Standard_Real theR1,const Standard_Real theR2,const Standard_Real theR3,const Quantity_TypeOfColor theType);
		%feature("compactdefaultargs") Quantity_Color;
		%feature("autodoc", "	* Define color from RGB values.

	:param theRgb:
	:type theRgb: NCollection_Vec3<float> &
	:rtype: None
") Quantity_Color;
		 Quantity_Color (const NCollection_Vec3<float> & theRgb);
		%feature("compactdefaultargs") Red;
		%feature("autodoc", "	* Returns the Red component (quantity of red) of the color within range [0.0; 1.0].

	:rtype: float
") Red;
		Standard_Real Red ();
		%feature("compactdefaultargs") RgbHls;
		%feature("autodoc", "	* Converts RGB components into HLS ones.

	:param R:
	:type R: float
	:param G:
	:type G: float
	:param B:
	:type B: float
	:param H:
	:type H: float &
	:param L:
	:type L: float &
	:param S:
	:type S: float &
	:rtype: void
") RgbHls;
		static void RgbHls (const Standard_Real R,const Standard_Real G,const Standard_Real B,Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue);
		%feature("compactdefaultargs") Saturation;
		%feature("autodoc", "	* Returns the Saturation component (value of the saturation) of the color within range [0.0; 1.0].

	:rtype: float
") Saturation;
		Standard_Real Saturation ();
		%feature("compactdefaultargs") SetEpsilon;
		%feature("autodoc", "	* Sets the specified value used to compare <self> and an other color in IsDifferent and in IsEqual methods. Warning: The default value is 0.0001

	:param AnEpsilon:
	:type AnEpsilon: float
	:rtype: void
") SetEpsilon;
		static void SetEpsilon (const Standard_Real AnEpsilon);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* Updates the colour <self> from the definition of the colour <AName>.

	:param AName:
	:type AName: Quantity_NameOfColor
	:rtype: None
") SetValues;
		void SetValues (const Quantity_NameOfColor AName);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* Updates a color according to the mode specified by theType. Quantity_TOC_RGB: - theR1 the value of Red within range [0.0; 1.0] - theR2 the value of Green within range [0.0; 1.0] - theR3 the value of Blue within range [0.0; 1.0] //! Quantity_TOC_HLS: - theR1 is the Hue (H) angle in degrees within range [0.0; 360.0], 0.0 being Red. -1.0 is a special value reserved for grayscale color (S should be 0.0). - theR2 is the Lightness (L) within range [0.0; 1.0] - theR3 is the Saturation (S) within range [0.0; 1.0]

	:param theR1:
	:type theR1: float
	:param theR2:
	:type theR2: float
	:param theR3:
	:type theR3: float
	:param theType:
	:type theType: Quantity_TypeOfColor
	:rtype: None
") SetValues;
		void SetValues (const Standard_Real theR1,const Standard_Real theR2,const Standard_Real theR3,const Quantity_TypeOfColor theType);
		%feature("compactdefaultargs") SquareDistance;
		%feature("autodoc", "	* Returns the square of distance between two colours.

	:param AColor:
	:type AColor: Quantity_Color &
	:rtype: float
") SquareDistance;
		Standard_Real SquareDistance (const Quantity_Color & AColor);
		%feature("compactdefaultargs") StringName;
		%feature("autodoc", "	* Returns the name of the color identified by AName in the Quantity_NameOfColor enumeration. For example, the name of the color which corresponds to Quantity_NOC_BLACK is 'BLACK'. Exceptions Standard_OutOfRange if AName in not known in the Quantity_NameOfColor enumeration.

	:param AColor:
	:type AColor: Quantity_NameOfColor
	:rtype: char *
") StringName;
		static const char * StringName (const Quantity_NameOfColor AColor);
		%feature("compactdefaultargs") Test;
		%feature("autodoc", "	* Internal test

	:rtype: void
") Test;
		static void Test ();
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns in theR1, theR2 and theR3 the components of this color according to the color system definition theType. If theType is Quantity_TOC_RGB: - theR1 the value of Red between 0.0 and 1.0 - theR2 the value of Green between 0.0 and 1.0 - theR3 the value of Blue between 0.0 and 1.0 If theType is Quantity_TOC_HLS: - theR1 is the Hue (H) angle in degrees within range [0.0; 360.0], 0.0 being Red. -1.0 is a special value reserved for grayscale color (S should be 0.0). - theR2 is the Lightness (L) within range [0.0; 1.0] - theR3 is the Saturation (S) within range [0.0; 1.0]

	:param theR1:
	:type theR1: float &
	:param theR2:
	:type theR2: float &
	:param theR3:
	:type theR3: float &
	:param theType:
	:type theType: Quantity_TypeOfColor
	:rtype: None
") Values;
		void Values (Standard_Real &OutValue,Standard_Real &OutValue,Standard_Real &OutValue,const Quantity_TypeOfColor theType);

        %extend{
            bool __eq_wrapper__(const Quantity_Color  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Quantity_Color {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Quantity_ColorHasher;
class Quantity_ColorHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns hash code for the given RGB color, in the range [1, theUpperBound] @param theColor the RGB color object which hash code is to be computed @param theUpperBound the upper bound of the range a computing range must be within returns a computed hash code, in the range [1, theUpperBound]

	:param theColor:
	:type theColor: Quantity_Color &
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Quantity_Color & theColor,const Standard_Integer theUpperBound);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns true if two colors are equal.

	:param theColor1:
	:type theColor1: Quantity_Color &
	:param theColor2:
	:type theColor2: Quantity_Color &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Quantity_Color & theColor1,const Quantity_Color & theColor2);
};


%extend Quantity_ColorHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Quantity_ColorRGBA;
class Quantity_ColorRGBA {
	public:
		%feature("compactdefaultargs") Alpha;
		%feature("autodoc", "	* Return alpha value (1.0 means opaque, 0.0 means fully transparent).

	:rtype: Standard_ShortReal
") Alpha;
		Standard_ShortReal Alpha ();
		%feature("compactdefaultargs") ChangeRGB;
		%feature("autodoc", "	* Modify RGB color components without affecting alpha value.

	:rtype: Quantity_Color
") ChangeRGB;
		Quantity_Color & ChangeRGB ();
		%feature("compactdefaultargs") ColorFromHex;
		%feature("autodoc", "	* Parses the string as a hex color (like '#FF0' for short RGB color, '#FF0F' for short RGBA color, '#FFFF00' for RGB color, or '#FFFF00FF' for RGBA color) @param theHexColorString the string to be parsed @param theColor a color that is a result of parsing @param theAlphaComponentIsOff the flag that indicates if a color alpha component is presented in the input string (false) or not (true) returns true if parsing was successful, or false otherwise

	:param theHexColorString:
	:type theHexColorString: char *
	:param theColor:
	:type theColor: Quantity_ColorRGBA &
	:param theAlphaComponentIsOff: default value is false
	:type theAlphaComponentIsOff: bool
	:rtype: bool
") ColorFromHex;
		static bool ColorFromHex (const char * const theHexColorString,Quantity_ColorRGBA & theColor,const bool theAlphaComponentIsOff = false);
		%feature("compactdefaultargs") ColorFromName;
		%feature("autodoc", "	* Finds color from predefined names. For example, the name of the color which corresponds to 'BLACK' is Quantity_NOC_BLACK. Returns false if name is unknown. An alpha component is set to 1.0. @param theColorNameString the color name @param theColor a found color returns false if the color name is unknown, or true if the search by color name was successful

	:param theColorNameString:
	:type theColorNameString: char *
	:param theColor:
	:type theColor: Quantity_ColorRGBA &
	:rtype: bool
") ColorFromName;
		static Standard_Boolean ColorFromName (const char * theColorNameString,Quantity_ColorRGBA & theColor);
		%feature("compactdefaultargs") ColorToHex;
		%feature("autodoc", "	* Returns hex sRGBA string in format '#RRGGBBAA'.

	:param theColor:
	:type theColor: Quantity_ColorRGBA &
	:param theToPrefixHash: default value is true
	:type theToPrefixHash: bool
	:rtype: TCollection_AsciiString
") ColorToHex;
		static TCollection_AsciiString ColorToHex (const Quantity_ColorRGBA & theColor,const bool theToPrefixHash = true);
		%feature("compactdefaultargs") DumpJson;
		%feature("autodoc", "	* Dumps the content of me into the stream

	:param theOStream:
	:type theOStream: Standard_OStream &
	:param theDepth: default value is -1
	:type theDepth: int
	:rtype: None
") DumpJson;
		void DumpJson (Standard_OStream & theOStream,const Standard_Integer theDepth = -1);
		%feature("compactdefaultargs") GetRGB;
		%feature("autodoc", "	* Return RGB color value.

	:rtype: Quantity_Color
") GetRGB;
		const Quantity_Color & GetRGB ();
		%feature("compactdefaultargs") IsDifferent;
		%feature("autodoc", "	* Returns true if the distance between colors is greater than Epsilon().

	:param theOther:
	:type theOther: Quantity_ColorRGBA &
	:rtype: bool
") IsDifferent;
		bool IsDifferent (const Quantity_ColorRGBA & theOther);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Two colors are considered to be equal if their distance is no greater than Epsilon().

	:param theOther:
	:type theOther: Quantity_ColorRGBA &
	:rtype: bool
") IsEqual;
		bool IsEqual (const Quantity_ColorRGBA & theOther);
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "	* Creates a color with the default value.

	:rtype: None
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA ();
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "	* Creates the color with specified RGB value.

	:param theRgb:
	:type theRgb: Quantity_Color &
	:rtype: None
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA (const Quantity_Color & theRgb);
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "	* Creates the color with specified RGBA values.

	:param theRgb:
	:type theRgb: Quantity_Color &
	:param theAlpha:
	:type theAlpha: float
	:rtype: None
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA (const Quantity_Color & theRgb,float theAlpha);
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "	* Creates the color from RGBA vector.

	:param theRgba:
	:type theRgba: NCollection_Vec4<float> &
	:rtype: None
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA (const NCollection_Vec4<float> & theRgba);
		%feature("compactdefaultargs") Quantity_ColorRGBA;
		%feature("autodoc", "	* Creates the color from RGBA values.

	:param theRed:
	:type theRed: float
	:param theGreen:
	:type theGreen: float
	:param theBlue:
	:type theBlue: float
	:param theAlpha:
	:type theAlpha: float
	:rtype: None
") Quantity_ColorRGBA;
		 Quantity_ColorRGBA (float theRed,float theGreen,float theBlue,float theAlpha);
		%feature("compactdefaultargs") SetAlpha;
		%feature("autodoc", "	* Assign the alpha value.

	:param theAlpha:
	:type theAlpha: Standard_ShortReal
	:rtype: None
") SetAlpha;
		void SetAlpha (const Standard_ShortReal theAlpha);
		%feature("compactdefaultargs") SetRGB;
		%feature("autodoc", "	* Assign RGB color components without affecting alpha value.

	:param theRgb:
	:type theRgb: Quantity_Color &
	:rtype: None
") SetRGB;
		void SetRGB (const Quantity_Color & theRgb);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* Assign new values to the color.

	:param theRed:
	:type theRed: float
	:param theGreen:
	:type theGreen: float
	:param theBlue:
	:type theBlue: float
	:param theAlpha:
	:type theAlpha: float
	:rtype: None
") SetValues;
		void SetValues (float theRed,float theGreen,float theBlue,float theAlpha);

        %extend{
            bool __eq_wrapper__(const Quantity_ColorRGBA  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        };


%extend Quantity_ColorRGBA {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Quantity_ColorRGBAHasher;
class Quantity_ColorRGBAHasher {
	public:
		%feature("compactdefaultargs") HashCode;
		%feature("autodoc", "	* Returns hash code for the given RGBA color, in the range [1, theUpperBound] @param theColor the RGBA color object which hash code is to be computed @param theUpperBound the upper bound of the range a computing hash code must be within returns a computed hash code, in the range [1, theUpperBound]

	:param theColor:
	:type theColor: Quantity_ColorRGBA &
	:param theUpperBound:
	:type theUpperBound: int
	:rtype: int
") HashCode;
		static Standard_Integer HashCode (const Quantity_ColorRGBA & theColor,const Standard_Integer theUpperBound);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns true if two colors are equal.

	:param theColor1:
	:type theColor1: Quantity_ColorRGBA &
	:param theColor2:
	:type theColor2: Quantity_ColorRGBA &
	:rtype: bool
") IsEqual;
		static Standard_Boolean IsEqual (const Quantity_ColorRGBA & theColor1,const Quantity_ColorRGBA & theColor2);
};


%extend Quantity_ColorRGBAHasher {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Quantity_Date;
class Quantity_Date {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds a Period to a Date and returns the new Date.

	:param aPeriod:
	:type aPeriod: Quantity_Period &
	:rtype: Quantity_Date
") Add;
		Quantity_Date Add (const Quantity_Period & aPeriod);
		%feature("compactdefaultargs") Day;
		%feature("autodoc", "	* Returns Day of a Date.

	:rtype: int
") Day;
		Standard_Integer Day ();
		%feature("compactdefaultargs") Difference;
		%feature("autodoc", "	* Subtracts one Date from another one to find the period between and returns the value. The result is the absolute value between the difference of two dates.

	:param anOther:
	:type anOther: Quantity_Date &
	:rtype: Quantity_Period
") Difference;
		Quantity_Period Difference (const Quantity_Date & anOther);
		%feature("compactdefaultargs") Hour;
		%feature("autodoc", "	* Returns Hour of a Date.

	:rtype: int
") Hour;
		Standard_Integer Hour ();
		%feature("compactdefaultargs") IsEarlier;
		%feature("autodoc", "	* Returns True if <self> is earlier than <other>.

	:param anOther:
	:type anOther: Quantity_Date &
	:rtype: bool
") IsEarlier;
		Standard_Boolean IsEarlier (const Quantity_Date & anOther);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if both <self> and <other> are equal. This method is an alias of operator ==.

	:param anOther:
	:type anOther: Quantity_Date &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Quantity_Date & anOther);
		%feature("compactdefaultargs") IsLater;
		%feature("autodoc", "	* Returns True if <self> is later then <other>.

	:param anOther:
	:type anOther: Quantity_Date &
	:rtype: bool
") IsLater;
		Standard_Boolean IsLater (const Quantity_Date & anOther);
		%feature("compactdefaultargs") IsLeap;
		%feature("autodoc", "	* Returns true if a year is a leap year. The leap years are divisable by 4 and not by 100 except the years divisable by 400.

	:param yy:
	:type yy: int
	:rtype: bool
") IsLeap;
		static Standard_Boolean IsLeap (const Standard_Integer yy);
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Checks the validity of a date - returns true if a date defined from the year yyyy, the month mm, the day dd, the hour hh, the minute mn, the second ss, the millisecond mis (defaulted to 0) and the microsecond mics (defaulted to 0) is valid. A date must satisfy the conditions above: - yyyy is greater than or equal to 1979, - mm lies within the range [1, 12] (with 1 corresponding to January and 12 to December), - dd lies within a valid range for the month mm (from 1 to 28, 29, 30 or 31 depending on mm and whether yyyy is a leap year or not), - hh lies within the range [0, 23], - mn lies within the range [0, 59], - ss lies within the range [0, 59], - mis lies within the range [0, 999], - mics lies within the range [0, 999].C

	:param mm:
	:type mm: int
	:param dd:
	:type dd: int
	:param yy:
	:type yy: int
	:param hh:
	:type hh: int
	:param mn:
	:type mn: int
	:param ss:
	:type ss: int
	:param mis: default value is 0
	:type mis: int
	:param mics: default value is 0
	:type mics: int
	:rtype: bool
") IsValid;
		static Standard_Boolean IsValid (const Standard_Integer mm,const Standard_Integer dd,const Standard_Integer yy,const Standard_Integer hh,const Standard_Integer mn,const Standard_Integer ss,const Standard_Integer mis = 0,const Standard_Integer mics = 0);
		%feature("compactdefaultargs") MicroSecond;
		%feature("autodoc", "	* Returns microsecond of a Date.

	:rtype: int
") MicroSecond;
		Standard_Integer MicroSecond ();
		%feature("compactdefaultargs") MilliSecond;
		%feature("autodoc", "	* Returns millisecond of a Date.

	:rtype: int
") MilliSecond;
		Standard_Integer MilliSecond ();
		%feature("compactdefaultargs") Minute;
		%feature("autodoc", "	* Returns minute of a Date.

	:rtype: int
") Minute;
		Standard_Integer Minute ();
		%feature("compactdefaultargs") Month;
		%feature("autodoc", "	* Returns month of a Date.

	:rtype: int
") Month;
		Standard_Integer Month ();
		%feature("compactdefaultargs") Quantity_Date;
		%feature("autodoc", "	* Constructs a default date (00:00 GMT, January 1, 1979 (zero hour)); use the function SetValues to define the required date; or

	:rtype: None
") Quantity_Date;
		 Quantity_Date ();
		%feature("compactdefaultargs") Quantity_Date;
		%feature("autodoc", "	* Constructs a date from the year yyyy, the month mm, the day dd, the hour hh, the minute mn, the second ss, the millisecond mis (defaulted to 0) and the microsecond mics (defaulted to 0).. With: 1 <= mm <= 12 1 <= dd <= max number of days of <mm> 1979 <= yyyy 0 <= hh <= 23 0 <= mn <= 59 0 <= ss <= 59 0 <= mis <= 999 0 <= mics <= 999 Exceptions Quantity_DateDefinitionError if mm, dd, hh, mn, ss, mis and mics are not the components of the valid date.

	:param mm:
	:type mm: int
	:param dd:
	:type dd: int
	:param yyyy:
	:type yyyy: int
	:param hh:
	:type hh: int
	:param mn:
	:type mn: int
	:param ss:
	:type ss: int
	:param mis: default value is 0
	:type mis: int
	:param mics: default value is 0
	:type mics: int
	:rtype: None
") Quantity_Date;
		 Quantity_Date (const Standard_Integer mm,const Standard_Integer dd,const Standard_Integer yyyy,const Standard_Integer hh,const Standard_Integer mn,const Standard_Integer ss,const Standard_Integer mis = 0,const Standard_Integer mics = 0);
		%feature("compactdefaultargs") Second;
		%feature("autodoc", "	* Returns seconde of a Date.

	:rtype: int
") Second;
		Standard_Integer Second ();
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* Assigns to this date the year yyyy, the month mm, the day dd, the hour hh, the minute mn, the second ss, the millisecond mis (defaulted to 0) and the microsecond mics (defaulted to 0). Exceptions Quantity_DateDefinitionError if mm, dd, hh, mn, ss, mis and mics are not components of a valid date.

	:param mm:
	:type mm: int
	:param dd:
	:type dd: int
	:param yy:
	:type yy: int
	:param hh:
	:type hh: int
	:param mn:
	:type mn: int
	:param ss:
	:type ss: int
	:param mis: default value is 0
	:type mis: int
	:param mics: default value is 0
	:type mics: int
	:rtype: None
") SetValues;
		void SetValues (const Standard_Integer mm,const Standard_Integer dd,const Standard_Integer yy,const Standard_Integer hh,const Standard_Integer mn,const Standard_Integer ss,const Standard_Integer mis = 0,const Standard_Integer mics = 0);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* Subtracts a period from a Date and returns the new Date. Raises an exception if the result date is anterior to Jan 1, 1979.

	:param aPeriod:
	:type aPeriod: Quantity_Period &
	:rtype: Quantity_Date
") Subtract;
		Quantity_Date Subtract (const Quantity_Period & aPeriod);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Gets a complete Date. - in mm - the month, - in dd - the day, - in yyyy - the year, - in hh - the hour, - in mn - the minute, - in ss - the second, - in mis - the millisecond, and - in mics - the microsecond

	:param mm:
	:type mm: int &
	:param dd:
	:type dd: int &
	:param yy:
	:type yy: int &
	:param hh:
	:type hh: int &
	:param mn:
	:type mn: int &
	:param ss:
	:type ss: int &
	:param mis:
	:type mis: int &
	:param mics:
	:type mics: int &
	:rtype: None
") Values;
		void Values (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Year;
		%feature("autodoc", "	* Returns year of a Date.

	:rtype: int
") Year;
		Standard_Integer Year ();
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param aPeriod:
	:type aPeriod: Quantity_Period &
	:rtype: Quantity_Date
") operator +;
		Quantity_Date operator + (const Quantity_Period & aPeriod);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param aPeriod:
	:type aPeriod: Quantity_Period &
	:rtype: Quantity_Date
") operator -;
		Quantity_Date operator - (const Quantity_Period & aPeriod);

        %extend{
            bool __eq_wrapper__(const Quantity_Date  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("compactdefaultargs") operator >;
		%feature("autodoc", "	:param anOther:
	:type anOther: Quantity_Date &
	:rtype: bool
") operator >;
		Standard_Boolean operator > (const Quantity_Date & anOther);
};


%extend Quantity_Date {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
%nodefaultctor Quantity_Period;
class Quantity_Period {
	public:
		%feature("compactdefaultargs") Add;
		%feature("autodoc", "	* Adds one Period to another one.

	:param anOther:
	:type anOther: Quantity_Period &
	:rtype: Quantity_Period
") Add;
		Quantity_Period Add (const Quantity_Period & anOther);
		%feature("compactdefaultargs") IsEqual;
		%feature("autodoc", "	* Returns True if both <self> and <other> are equal.

	:param anOther:
	:type anOther: Quantity_Period &
	:rtype: bool
") IsEqual;
		Standard_Boolean IsEqual (const Quantity_Period & anOther);
		%feature("compactdefaultargs") IsLonger;
		%feature("autodoc", "	* Returns True if <self> is longer then <other>.

	:param anOther:
	:type anOther: Quantity_Period &
	:rtype: bool
") IsLonger;
		Standard_Boolean IsLonger (const Quantity_Period & anOther);
		%feature("compactdefaultargs") IsShorter;
		%feature("autodoc", "	* Returns True if <self> is shorter than <other>.

	:param anOther:
	:type anOther: Quantity_Period &
	:rtype: bool
") IsShorter;
		Standard_Boolean IsShorter (const Quantity_Period & anOther);
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Checks the validity of a Period in form (dd,hh,mn,ss,mil,mic) With: 0 <= dd 0 <= hh 0 <= mn 0 <= ss 0 <= mis 0 <= mics

	:param dd:
	:type dd: int
	:param hh:
	:type hh: int
	:param mn:
	:type mn: int
	:param ss:
	:type ss: int
	:param mis: default value is 0
	:type mis: int
	:param mics: default value is 0
	:type mics: int
	:rtype: bool
") IsValid;
		static Standard_Boolean IsValid (const Standard_Integer dd,const Standard_Integer hh,const Standard_Integer mn,const Standard_Integer ss,const Standard_Integer mis = 0,const Standard_Integer mics = 0);
		%feature("compactdefaultargs") IsValid;
		%feature("autodoc", "	* Checks the validity of a Period in form (ss,mic) With: 0 <= ss 0 <= mics

	:param ss:
	:type ss: int
	:param mics: default value is 0
	:type mics: int
	:rtype: bool
") IsValid;
		static Standard_Boolean IsValid (const Standard_Integer ss,const Standard_Integer mics = 0);
		%feature("compactdefaultargs") Quantity_Period;
		%feature("autodoc", "	* Creates a Period With: 0 <= dd 0 <= hh 0 <= mn 0 <= ss 0 <= mis 0 <= mics

	:param dd:
	:type dd: int
	:param hh:
	:type hh: int
	:param mn:
	:type mn: int
	:param ss:
	:type ss: int
	:param mis: default value is 0
	:type mis: int
	:param mics: default value is 0
	:type mics: int
	:rtype: None
") Quantity_Period;
		 Quantity_Period (const Standard_Integer dd,const Standard_Integer hh,const Standard_Integer mn,const Standard_Integer ss,const Standard_Integer mis = 0,const Standard_Integer mics = 0);
		%feature("compactdefaultargs") Quantity_Period;
		%feature("autodoc", "	* Creates a Period with a number of seconds and microseconds. Exceptions Quantity_PeriodDefinitionError: - if the number of seconds expressed either by: - dd days, hh hours, mn minutes and ss seconds, or - Ss is less than 0. - if the number of microseconds expressed either by: - mis milliseconds and mics microseconds, or - Mics is less than 0.

	:param ss:
	:type ss: int
	:param mics: default value is 0
	:type mics: int
	:rtype: None
") Quantity_Period;
		 Quantity_Period (const Standard_Integer ss,const Standard_Integer mics = 0);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* Assigns to this period the time interval defined - with dd days, hh hours, mn minutes, ss seconds, mis (defaulted to 0) milliseconds and mics (defaulted to 0) microseconds; or

	:param dd:
	:type dd: int
	:param hh:
	:type hh: int
	:param mn:
	:type mn: int
	:param ss:
	:type ss: int
	:param mis: default value is 0
	:type mis: int
	:param mics: default value is 0
	:type mics: int
	:rtype: None
") SetValues;
		void SetValues (const Standard_Integer dd,const Standard_Integer hh,const Standard_Integer mn,const Standard_Integer ss,const Standard_Integer mis = 0,const Standard_Integer mics = 0);
		%feature("compactdefaultargs") SetValues;
		%feature("autodoc", "	* Assigns to this period the time interval defined - with Ss seconds and Mics (defaulted to 0) microseconds. Exceptions Quantity_PeriodDefinitionError: - if the number of seconds expressed either by: - dd days, hh hours, mn minutes and ss seconds, or - Ss is less than 0. - if the number of microseconds expressed either by: - mis milliseconds and mics microseconds, or - Mics is less than 0.

	:param ss:
	:type ss: int
	:param mics: default value is 0
	:type mics: int
	:rtype: None
") SetValues;
		void SetValues (const Standard_Integer ss,const Standard_Integer mics = 0);
		%feature("compactdefaultargs") Subtract;
		%feature("autodoc", "	* Subtracts one Period from another and returns the difference.

	:param anOther:
	:type anOther: Quantity_Period &
	:rtype: Quantity_Period
") Subtract;
		Quantity_Period Subtract (const Quantity_Period & anOther);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Decomposes this period into a number of days,hours, minutes,seconds,milliseconds and microseconds Example of return values: 2 days, 15 hours, 0 minute , 0 second 0 millisecond and 0 microsecond

	:param dd:
	:type dd: int &
	:param hh:
	:type hh: int &
	:param mn:
	:type mn: int &
	:param ss:
	:type ss: int &
	:param mis:
	:type mis: int &
	:param mics:
	:type mics: int &
	:rtype: None
") Values;
		void Values (Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") Values;
		%feature("autodoc", "	* Returns the number of seconds in Ss and the number of remainding microseconds in Mics of this period. Example of return values: 3600 seconds and 0 microseconds

	:param ss:
	:type ss: int &
	:param mics:
	:type mics: int &
	:rtype: None
") Values;
		void Values (Standard_Integer &OutValue,Standard_Integer &OutValue);
		%feature("compactdefaultargs") operator +;
		%feature("autodoc", "	:param anOther:
	:type anOther: Quantity_Period &
	:rtype: Quantity_Period
") operator +;
		Quantity_Period operator + (const Quantity_Period & anOther);
		%feature("compactdefaultargs") operator -;
		%feature("autodoc", "	:param anOther:
	:type anOther: Quantity_Period &
	:rtype: Quantity_Period
") operator -;
		Quantity_Period operator - (const Quantity_Period & anOther);

        %extend{
            bool __eq_wrapper__(const Quantity_Period  other) {
            if (*self==other) return true;
            else return false;
            }
        }
        %pythoncode {
        def __eq__(self, right):
            try:
                return self.__eq_wrapper__(right)
            except:
                return False
        }
        		%feature("compactdefaultargs") operator >;
		%feature("autodoc", "	:param anOther:
	:type anOther: Quantity_Period &
	:rtype: bool
") operator >;
		Standard_Boolean operator > (const Quantity_Period & anOther);
};


%extend Quantity_Period {
	%pythoncode {
	__repr__ = _dumps_object
	}
};
/* harray1 class */
class Quantity_HArray1OfColor : public  Quantity_Array1OfColor, public Standard_Transient {
  public:
    Quantity_HArray1OfColor(const Standard_Integer theLower, const Standard_Integer theUpper);
    Quantity_HArray1OfColor(const Standard_Integer theLower, const Standard_Integer theUpper, const  Quantity_Array1OfColor::value_type& theValue);
    Quantity_HArray1OfColor(const  Quantity_Array1OfColor& theOther);
    const  Quantity_Array1OfColor& Array1();
     Quantity_Array1OfColor& ChangeArray1();
};
%make_alias(Quantity_HArray1OfColor)


/* harray2 class */
/* harray2 class */
