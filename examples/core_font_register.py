# -*- coding: utf-8 -*-
##Copyright 2016 Thomas Paviot (tpaviot@gmail.com)
##
##This file is part of pythonOCC.
##
##pythonOCC is free software: you can redistribute it and/or modify
##it under the terms of the GNU Lesser General Public License as published by
##the Free Software Foundation, either version 3 of the License, or
##(at your option) any later version.
##
##pythonOCC is distributed in the hope that it will be useful,
##but WITHOUT ANY WARRANTY; without even the implied warranty of
##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##GNU Lesser General Public License for more details.
##
##You should have received a copy of the GNU Lesser General Public License
##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

import os

from OCC.Display.SimpleGui import init_display
from OCC.Addons import text_to_brep, register_font, Font_FA_Bold, Font_FA_Regular

display, start_display, add_menu, add_function_to_menu = init_display()

# register the Respective font
register_font(os.path.join('.', 'fonts', 'Respective.ttf'))

# text
# Poetry from Paul Verlaine, Chanson d'Automne
text = """Les sanglots longs
Des violons
De l'automne
Blessent mon cœur
D'une langueur monotone

Tout suffocant
Et blême, quand
Sonne l'heure,
Je me souviens
Des jours anciens
Et je pleure

Et je m'en vais
Au vent mauvais
Qui m'emporte
Deçà, delà,
Pareil à la
Feuille morte."""
## create a basic string
arialbold_brep_string = text_to_brep(text, "Respective", Font_FA_Regular, 12., True)

## Then display the string
display.DisplayColoredShape(arialbold_brep_string, color= 'WHITE',update=True)

start_display()
