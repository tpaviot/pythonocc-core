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
