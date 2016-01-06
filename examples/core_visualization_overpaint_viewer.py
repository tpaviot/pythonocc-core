# This file is part of pythonOCC.
##
# pythonOCC is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
##
# pythonOCC is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
##
# You should have received a copy of the GNU Lesser General Public License
# along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

"""

demonstrates overpainting of the OCC OpenGL viewer to share its OpenGL Context
with Qt

this allows for interesting interfaces, where elements are drawn as an overlay

:ref:`Catia's structure browser` is a well known application of this idea

the example is extends Qt's :ref:`OpenGL overpainting example`

.. Catia's structure browser::
        http://goo.gl/KBh7BL

.. OpenGL overpainting example::
        https://github.com/Werkov/PyQt4/blob/master/examples/opengl/overpainting.py


"""

from __future__ import print_function

import random
import sys

from OCC.Display.backend import get_backend, get_qt_modules

backend = get_backend()
QtCore, QtGui, QtWidgets, QtOpenGL = get_qt_modules()
from OCC.Display.qtDisplay import qtViewer3d

# --------------------------------------------------------------------------
# these are names of actions that invoke the OpenGL viewport to be redrawn
# such actions need to be invoked through the GLWidget.update method, which
# in turn invoked the GLWidget.paintEvent method
# this way, all command that redraw the viewport are invoked synchronously
# --------------------------------------------------------------------------


ON_ZOOM = "on_zoom"
ON_ZOOM_AREA = "on_zoom_area"
ON_ZOOM_FACTOR = "on_zoom_factor"
ON_ZOOM_FITALL = "on_zoom_fitall"
ON_DYN_ZOOM = "on_dyn_zoom"
ON_DYN_ROT = "on_dyn_rot"
ON_DYN_PAN = "on_dyn_pan"
ON_MOVE_TO = "on_move_to"
ON_SHIFT_SELECT = "on_shift_select"
ON_SELECT = "on_select"
ON_SELECT_AREA = "on_select_area"


class Bubble(object):
    def __init__(self, position, radius, velocity):
        self.position = position
        self.vel = velocity
        self.radius = radius

        self.innerColor = self.randomColor()
        self.outerColor = self.randomColor()
        self.updateBrush()

    def updateBrush(self):
        gradient = QtGui.QRadialGradient(
                QtCore.QPointF(self.radius, self.radius),
                self.radius,
                QtCore.QPointF(self.radius * 0.5, self.radius * 0.5))
        gradient.setColorAt(0, QtGui.QColor(255, 255, 255, 0))
        gradient.setColorAt(0.25, self.innerColor)
        gradient.setColorAt(1, self.outerColor)
        self.brush = QtGui.QBrush(gradient)

    def drawBubble(self, painter, mouse_intersects):
        painter.save()
        painter.translate(self.position.x() - self.radius,
                          self.position.y() - self.radius)
        painter.setBrush(self.brush)

        if mouse_intersects:
            font = painter.font()
            font.setPointSize(20)
            painter.setFont(font)
            painter.setPen(QtCore.Qt.red)
            painter.drawText(0, 0, "so hovering over!!!")

        painter.drawEllipse(0, 0, int(2 * self.radius), int(2 * self.radius))
        painter.restore()

    def randomColor(self):
        red = random.randrange(205, 256)
        green = random.randrange(205, 256)
        blue = random.randrange(205, 256)
        alpha = random.randrange(91, 192)
        return QtGui.QColor(red, green, blue, alpha)

    def move(self, bbox):
        self.position += self.vel
        leftOverflow = self.position.x() - self.radius - bbox.left()
        rightOverflow = self.position.x() + self.radius - bbox.right()
        topOverflow = self.position.y() - self.radius - bbox.top()
        bottomOverflow = self.position.y() + self.radius - bbox.bottom()

        if leftOverflow < 0.0:
            self.position.setX(self.position.x() - 2 * leftOverflow)
            self.vel.setX(-self.vel.x())
        elif rightOverflow > 0.0:
            self.position.setX(self.position.x() - 2 * rightOverflow)
            self.vel.setX(-self.vel.x())

        if topOverflow < 0.0:
            self.position.setY(self.position.y() - 2 * topOverflow)
            self.vel.setY(-self.vel.y())
        elif bottomOverflow > 0.0:
            self.position.setY(self.position.y() - 2 * bottomOverflow)
            self.vel.setY(-self.vel.y())

    def rect(self):
        return QtCore.QRectF(self.position.x() - self.radius,
                             self.position.y() - self.radius, 2 * self.radius,
                             2 * self.radius)


class GLWidget(qtViewer3d):
    def __init__(self, parent=None):
        super(GLWidget, self).__init__(parent)

        #: state
        self._initialized = False

        # no effect?
        self.doubleBuffer()

        # ---------------------------------------------------------------------
        # parameters for bubbles
        # ---------------------------------------------------------------------

        midnight = QtCore.QTime(0, 0, 0)
        random.seed(midnight.secsTo(QtCore.QTime.currentTime()))
        self.bubbles = []

        # parameter for overpainted text box

        self.text = """
        Example overpainting the OpenGL viewport, inspired by a similar example from Qt
        """

        # ---------------------------------------------------------------------
        # create properties for the last coordinate, such that the stupid
        # "point" conversion takes place implicitly
        # ---------------------------------------------------------------------

        self.lastPos = QtCore.QPoint()

        # ---------------------------------------------------------------------
        # GUI parameters
        # ---------------------------------------------------------------------

        self.setMinimumSize(200, 200)
        self.setWindowTitle("Overpainting a Scene")

        # parameters for overpainting
        self.setAttribute(QtCore.Qt.WA_NoSystemBackground)
        self.setAutoFillBackground(False)

        # ---------------------------------------------------------------------
        # setup
        # ---------------------------------------------------------------------

        # start the background thread that performs the overpainting of
        # the OpenGL view with bubbles
        self._setupAnimation()

        # ---------------------------------------------------------------------
        # GUI State
        # ---------------------------------------------------------------------

        # QPoint stored on mouse press
        self._point_on_mouse_press = QtCore.QPoint()

        # QPoint stored on mouse move
        self._point_on_mouse_move = QtCore.QPoint()

        # stores the delta between self._point_on_mouse_press and self._point_on_mouse_move
        self._delta_event_pos = None
        self._current_action = self.current_action = None

        # mouse button state
        self._is_right_mouse_button_surpressed = False
        self._is_left_mouse_button_surpressed = False

    @property
    def point_on_mouse_press(self):
        x = self._point_on_mouse_press.x()
        y = self._point_on_mouse_press.y()
        return x, y

    @point_on_mouse_press.setter
    def point_on_mouse_press(self, event):
        if isinstance(event, QtGui.QMouseEvent):
            self._point_on_mouse_press = QtCore.QPoint(event.pos())
        elif isinstance(event, QtCore.QPoint):
            self._point_on_mouse_press = QtCore.QPoint(event)

    @property
    def point_on_mouse_move(self):
        x = self._point_on_mouse_move.x()
        y = self._point_on_mouse_move.y()
        return x, y

    @point_on_mouse_move.setter
    def point_on_mouse_move(self, event):
        if isinstance(event, (QtGui.QMouseEvent, QtGui.QWheelEvent)):
            self._point_on_mouse_move = QtCore.QPoint(event.pos())
        elif isinstance(event, QtCore.QPoint):
            self._point_on_mouse_move = QtCore.QPoint(event)

    @property
    def delta_mouse_event_pos(self):
        """delta between previous_event and next_event"""
        pos_a = self._point_on_mouse_press
        pos_b = self._point_on_mouse_move

        dX = pos_a.x() - pos_b.x()
        dY = pos_a.y() - pos_b.y()
        return dX, dY

    @property
    def is_right_mouse_button_surpressed(self):
        return self._is_right_mouse_button_surpressed

    @is_right_mouse_button_surpressed.setter
    def is_right_mouse_button_surpressed(self, value):
        self._is_right_mouse_button_surpressed = value

    @property
    def is_left_mouse_button_surpressed(self):
        return self._is_left_mouse_button_surpressed

    @is_left_mouse_button_surpressed.setter
    def is_left_mouse_button_surpressed(self, value):
        self._is_left_mouse_button_surpressed = value

    def _setupAnimation(self):
        self.animationTimer = QtCore.QTimer()
        self.animationTimer.setSingleShot(False)
        self.animationTimer.timeout.connect(self.animate)
        self.animationTimer.start(25)

    def mousePressEvent(self, event):
        self.point_on_mouse_press = event
        self.setFocus()

        button = event.button()
        modifiers = event.modifiers()

        if button == QtCore.Qt.RightButton:
            self.is_right_mouse_button_surpressed = True
        elif button == QtCore.Qt.LeftButton:
            self.is_left_mouse_button_surpressed = True

        if button == QtCore.Qt.RightButton and modifiers == QtCore.Qt.ShiftModifier:
            # ON_ZOOM_AREA
            self._drawbox = True

        elif button == QtCore.Qt.LeftButton and modifiers == QtCore.Qt.ShiftModifier:
            # ON_SELECT_AREA
            self._drawbox = True
            self._select_area = True

        self.is_right_mouse_button_surpressed = True

    def mouseReleaseEvent(self, event):
        button = event.button()
        modifiers = event.modifiers()

        if button == QtCore.Qt.RightButton:
            self.is_right_mouse_button_surpressed = False
            if modifiers == QtCore.Qt.ShiftModifier:
                self.current_action = ON_ZOOM_AREA

        if button == QtCore.Qt.LeftButton:
            self.is_left_mouse_button_surpressed = False

            if self._select_area:
                self.current_action = ON_SELECT_AREA
            elif modifiers == QtCore.Qt.ShiftModifier:
                self.current_action = ON_SHIFT_SELECT
            else:
                self.current_action = ON_SELECT

        self._drawbox = False
        self._select_area = False

        self.point_on_mouse_move = event
        self.update()

    def mouseMoveEvent(self, event):
        self.point_on_mouse_move = event

        buttons = int(event.buttons())
        modifiers = event.modifiers()

        # rotate
        if buttons == QtCore.Qt.LeftButton and not modifiers == QtCore.Qt.ShiftModifier:
            self.current_action = ON_DYN_ROT

        # dynamic zoom
        elif buttons == QtCore.Qt.RightButton and not modifiers == QtCore.Qt.ShiftModifier:
            self.current_action = ON_DYN_ZOOM

        # dynamic panning
        elif buttons == QtCore.Qt.MidButton:
            self.current_action = ON_DYN_PAN

        # zoom window, overpaints rectangle
        elif buttons == QtCore.Qt.RightButton and modifiers == QtCore.Qt.ShiftModifier:
            self.current_action = ON_ZOOM_AREA

        # select area
        elif buttons == QtCore.Qt.LeftButton and modifiers == QtCore.Qt.ShiftModifier:
            self.current_action = ON_SELECT_AREA

        self.update()

    def wheelEvent(self, event):

        if self._have_pyqt5:
            delta = event.angleDelta().y()
        else:
            delta = event.delta()

        if delta > 0:
            self.zoom_factor = 1.3
        else:
            self.zoom_factor = 0.7
        self.current_action = ON_ZOOM_FACTOR
        self.point_on_mouse_move = event

        self.update()

    def keyPressEvent(self, event):
        if event.key() == ord("F"):
            # fit all command, invokes repaint
            self.current_action = ON_ZOOM_FITALL
            self.update()
        else:
            super(GLWidget, self).keyPressEvent(event)

    def on_zoom_area(self):
        dx, dy = self.delta_mouse_event_pos

        tolerance = 2
        if abs(dx) <= tolerance and abs(dy) <= tolerance:
            # zooming at a near nil value can segfault the opengl viewer
            pass
        else:
            if not self.is_right_mouse_button_surpressed:
                coords = [self.point_on_mouse_press[0],
                          self.point_on_mouse_press[1],
                          self.point_on_mouse_move[0],
                          self.point_on_mouse_move[1]]
                self._display.ZoomArea(*coords)

    def on_zoom_factor(self):
        self._display.ZoomFactor(self.zoom_factor)

    def on_zoom_fitall(self):
        """ handle fitting the scene in the viewport

        invoked on pressing "f"

        """
        self._display.FitAll()

    def on_zoom(self):
        self._zoom_area = True

    def on_dyn_zoom(self):
        """ handle zooming of the viewport

        through the shift + right mouse button

        """
        self._display.DynamicZoom(self.point_on_mouse_press[0],
                                  self.point_on_mouse_press[1],
                                  self.point_on_mouse_move[0],
                                  self.point_on_mouse_move[1]
                                  )
        self.point_on_mouse_press = self._point_on_mouse_move

    def on_dyn_rot(self):
        """ handle rotation of the viewport

        """
        self._display.StartRotation(*self.point_on_mouse_press)
        self._display.Rotation(*self.point_on_mouse_move)
        self.point_on_mouse_press = self._point_on_mouse_move

    def on_dyn_pan(self):
        """ handle panning of the viewport

        """
        dx, dy = self.delta_mouse_event_pos
        self.point_on_mouse_press = self._point_on_mouse_move
        self._display.Pan(-dx, dy)

    def on_move_to(self):
        # Relays mouse position in pixels theXPix and theYPix to the
        # interactive context selectors
        # This is done by the view theView passing this position to the main
        # viewer and updating it
        # Functions in both Neutral Point and local contexts

        # TODO: 6.9.1 changes this, important...
        # If theToRedrawOnUpdate is set to false, callee should call
        # RedrawImmediate() to highlight detected object.
        print(" no specific action -> MoveTo")
        self._display.MoveTo(*self.point_on_mouse_move)

    def on_select(self):
        self._display.Select(*self.point_on_mouse_move)

    def on_shift_select(self):
        self._display.ShiftSelect(*self.point_on_mouse_move)

    def on_select_area(self):
        pass
        # TODO: not really implemented
        # self._display.SelectArea(Xmin, Ymin, Xmin+dx, Ymin+dy)

    def _dispatch_camera_command_actions(self):
        """ dispatches actions that involve zooming, panning or rotating
        the viewport. Any of these actions invokes redrawing the view.
        This is why its relevant that these are handled in a specific method

        This method is to be called **exclusisely** from the .paintEvent method
        since here it can be interwoven with the overpainting routines

        Returns
        -------

        perform_action : bool
            True if any actions were performed, and implicitly the viewport
            was redrawn
            False otherwise

        """
        perform_action = False

        if self.current_action:
            print("handling camera action:", self.current_action)

        try:
            if self.current_action is not None:
                action = getattr(self, self.current_action)
                action()

        except Exception:
            print("could not invoke camera command action {0}".format(
                    self.current_action))

        finally:
            self.current_action = None

        return perform_action

    def paintEvent(self, event):
        """ handles all actions that redraw the viewport

        Parameters
        ----------
        event : QPaintEvent

        See Also
        --------
        this method is also invoked through the self.update method, see the
        mouseMoveEvent method
        """

        if self._inited:
            # actions like panning, zooming and rotating the view invoke
            # redrawing it
            # therefore, these actions need to be performed in the paintEvent
            # method
            # this way, redrawing the view takes place synchronous with the
            # overpaint action
            # not respecting this order would lead to a jittering view
            if not self._dispatch_camera_command_actions():
                # if no camera actions took place, invoke a redraw of
                # the viewport
                self._display.View.Redraw()

            if self.context().isValid():
                # acquire the OpenGL context
                self.makeCurrent()
                painter = QtGui.QPainter(self)
                painter.setRenderHint(QtGui.QPainter.Antialiasing, True)
                # swap the buffer before overpainting it
                self.swapBuffers()
                # perform overpainting
                self._overpaint(event, painter)
                painter.end()
                # hand over the OpenGL context
                self.doneCurrent()
            else:
                print('invalid OpenGL context: Qt cannot overpaint viewer')

    def _overpaint(self, event, painter):
        """ overpaint the viewport

        the viewport is overpainted to render a rectangle selection
        or -more awesomely- to overpaint bubbles on top of the viewport
        in a background rendering thread

        Parameters
        ----------

        event:

        painter:

        """
        self.drawBubbles(event, painter)

        # draw instructions in half transparent rectangle on top of
        # the viewport
        self.drawInstructions(painter)

        if self._drawbox:
            # draw selection rectangle
            self.drawBox(painter)

    def showEvent(self, event):
        """ invoked when on first draw of the viewport

        """
        self.createBubbles(20 - len(self.bubbles))

    def sizeHint(self):
        return QtCore.QSize(800, 600)

    def createBubbles(self, number):
        """ instantiate a `number` of bubbles to be painted on top of
        the viewport
        """
        for _ in range(number):
            position = QtCore.QPointF(
                    self.width() * (0.1 + 0.8 * random.random()),
                    self.height() * (0.1 + 0.8 * random.random()))
            radius = min(self.width(), self.height()) * (
                0.0125 + 0.0875 * random.random())
            velocity = QtCore.QPointF(
                    self.width() * 0.0125 * (-0.5 + random.random()),
                    self.height() * 0.0125 * (-0.5 + random.random()))

            self.bubbles.append(Bubble(position, radius, velocity))

    def animate(self):
        """ update the position of the bubbles

        this method is invoked from the self.animationTimer method

        """
        for bubble in self.bubbles:
            bubble.move(self.rect())
        self.update()

    def drawBox(self, painter):
        """ overpaint a rectangle on top of the viewport, when selecting with
        Shift + right mouse button
        """
        painter.setPen(QtGui.QPen(QtGui.QColor(0, 0, 0), 1))
        tolerance = 2

        dx, dy = self.delta_mouse_event_pos

        if abs(dx) <= tolerance and abs(dy) <= tolerance:
            pass

        else:
            rect = QtCore.QRect(self.point_on_mouse_press[0],
                                self.point_on_mouse_press[1], -dx, -dy)
            painter.drawRect(rect)

    def drawBubbles(self, event, painter):
        """ overpaint soap like bubble on top of the viewport

        """
        for bubble in self.bubbles:
            bubble_rect = bubble.rect()
            if bubble_rect.intersects(QtCore.QRectF(event.rect())):
                pt = QtCore.QPointF(self._point_on_mouse_move)
                over_mouse = bubble_rect.contains(pt)
                bubble.drawBubble(painter, over_mouse)

    def drawInstructions(self, painter):
        """ overpaint a message with a gray transparent background

        """
        transparency = 80
        metrics = QtGui.QFontMetrics(self.font())
        border = max(4, metrics.leading())

        rect = metrics.boundingRect(0, 0, self.width() - 2 * border,
                                    int(self.height() * 0.125),
                                    QtCore.Qt.AlignCenter | QtCore.Qt.TextWordWrap,
                                    self.text)

        painter.setRenderHint(QtGui.QPainter.TextAntialiasing)

        painter.fillRect(
                QtCore.QRect(0, 0, self.width(), rect.height() + 2 * border),
                QtGui.QColor(0, 0, 0, transparency))

        painter.setPen(QtCore.Qt.white)

        painter.fillRect(
                QtCore.QRect(0, 0, self.width(), rect.height() + 2 * border),
                QtGui.QColor(0, 0, 0, transparency))

        painter.drawText((self.width() - rect.width()) / 2, border,
                         rect.width(),
                         rect.height(),
                         QtCore.Qt.AlignCenter | QtCore.Qt.TextWordWrap,
                         self.text)


if __name__ == '__main__':
    def TestOverPainting():
        class AppFrame(QtWidgets.QWidget):
            def __init__(self, parent=None):
                QtWidgets.QWidget.__init__(self, parent)
                self.setWindowTitle(self.tr("qtDisplay3d overpainting example"))
                self.resize(1280, 1024)
                self.canva = GLWidget(self)
                mainLayout = QtWidgets.QHBoxLayout()
                mainLayout.addWidget(self.canva)
                mainLayout.setContentsMargins(0, 0, 0, 0)
                self.setLayout(mainLayout)

            def runTests(self):
                self.canva._display.Test()

        app = QtWidgets.QApplication(sys.argv)
        frame = AppFrame()
        frame.show()
        frame.canva.InitDriver()
        frame.runTests()
        app.exec_()


    TestOverPainting()
