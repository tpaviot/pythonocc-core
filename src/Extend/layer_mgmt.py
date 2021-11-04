##Copyright 2021 Tanneguy de Villemagne (tanneguydv@gmail.com)
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

class Layer():

    def __init__(self):
        self.clear()

    def create(self, shape, color=0):
        self.color = color
        self.to_display = display.DisplayShape(shape, color=self.color)[0]
        self.count += 1
        self.list_to_display.append(self.to_display)
        display.Context.Erase(self.to_display, False)

    def show(self):
        for shape in self.list_to_display:
            display.Context.Display(shape, True)

    def hide(self):
        for shape in self.list_to_display:
            display.Context.Erase(shape, False)

    def add(self, shape):
        self.to_display = {self.count}
        self.to_display = display.DisplayShape(shape, color=self.color)[0]
        self.list_to_display.append(self.to_display)
        display.Context.Erase(self.to_display, False)

    def clear(self):
        self.list_to_display = []
        self.count = 0
        self.to_display = {self.count}
