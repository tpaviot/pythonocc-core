"""

demonstrates overpainting of the OCC OpenGL viewer to share its OpenGL Context with Qt

this allows for interesting interfaces, where elements are drawn as an overlay

:ref:`Catia's structure browser` is a well known application of this idea

the example is extends Qt's :ref:`OpenGL overpainting example`

.. Catia's structure browser:: http://api.ning.com/files/baXVy107Waz1W6uzhBRSrhOaW6c2w8r-8560KbD2GBunh443xLrj2*jQWeecIWDpMtgaI2DeAVeJ2xKFYQyCH3DjdvxSfpWv/capture_061.jpg
.. OpenGL overpainting example:: https://github.com/Werkov/PyQt4/blob/master/examples/opengl/overpainting.py


"""

import random
import sys

from OCC.Display.qtDisplay import qtViewer3d, HAVE_PYQT4

if HAVE_PYQT4:
    from PyQt4 import QtCore, QtGui
else:
    from pyside import QtCore, QtGui

try:
    from OpenGL.GL import glViewport, glMatrixMode, glOrtho, glLoadIdentity, GL_PROJECTION, GL_MODELVIEW
except ImportError:
    msg = "for this example, the OpenGL module is required" \
          "why not run \"pip install PyOpenGL\"\?"
    sys.exit(status=1)


class Bubble(object):
    def __init__(self, position, radius, velocity):
        self.position = position
        self.vel = velocity
        self.radius = radius

        self.innerColor = self.randomColor()
        self.outerColor = self.randomColor()
        self.updateBrush()

    def updateBrush(self):
        gradient = QtGui.QRadialGradient(QtCore.QPointF(self.radius, self.radius),
                                         self.radius, QtCore.QPointF(self.radius * 0.5, self.radius * 0.5))

        gradient.setColorAt(0, QtGui.QColor(255, 255, 255, 0))
        gradient.setColorAt(0.25, self.innerColor)
        gradient.setColorAt(1, self.outerColor)
        self.brush = QtGui.QBrush(gradient)

    def drawBubble(self, painter):
        painter.save()
        painter.translate(self.position.x() - self.radius,
                          self.position.y() - self.radius)
        painter.setBrush(self.brush)
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

        self._initialized = False

        midnight = QtCore.QTime(0, 0, 0)
        random.seed(midnight.secsTo(QtCore.QTime.currentTime()))

        self.object = 0
        self.xRot = 0
        self.yRot = 0
        self.zRot = 0
        self.image = QtGui.QImage()
        self.bubbles = []
        self.lastPos = QtCore.QPoint()

        self.trolltechGreen = QtGui.QColor.fromCmykF(0.40, 0.0, 1.0, 0.0)
        self.trolltechPurple = QtGui.QColor.fromCmykF(0.39, 0.39, 0.0, 0.0)

        self.animationTimer = QtCore.QTimer()
        self.animationTimer.setSingleShot(False)
        self.animationTimer.timeout.connect(self.animate)
        self.animationTimer.start(25)

        self.setAutoFillBackground(False)

        self.setMinimumSize(200, 200)
        self.setWindowTitle("Overpainting a Scene")

        # parameters for overpainting
        self.setAttribute(QtCore.Qt.WA_NoSystemBackground, 0)
        self.setAttribute(QtCore.Qt.WA_OpaquePaintEvent)

    def setXRotation(self, angle):
        if angle != self.xRot:
            self.xRot = angle

    def setYRotation(self, angle):
        if angle != self.yRot:
            self.yRot = angle

    def setZRotation(self, angle):
        if angle != self.zRot:
            self.zRot = angle

    def mousePressEvent(self, event):
        self.lastPos = event.pos()
        super(GLWidget, self).mousePressEvent(event)

    def mouseMoveEvent(self, event):
        dx = event.x() - self.lastPos.x()
        dy = event.y() - self.lastPos.y()

        if event.buttons() & QtCore.Qt.LeftButton:
            self.setXRotation(self.xRot + 8 * dy)
            self.setYRotation(self.yRot + 8 * dx)
        elif event.buttons() & QtCore.Qt.RightButton:
            self.setXRotation(self.xRot + 8 * dy)
            self.setZRotation(self.zRot + 8 * dx)

        self.lastPos = event.pos()
        super(GLWidget, self).mouseMoveEvent(event)

    def paintGL(self):
        if self._inited:
            self._display.Context.UpdateCurrentViewer()

    def paintEvent(self, event):
        if self._inited:

            self._display.Context.UpdateCurrentViewer()
            self.makeCurrent()
            painter = QtGui.QPainter(self)
            painter.setRenderHint(QtGui.QPainter.Antialiasing)

            if self.context().isValid():
                self.swapBuffers()

                if self._drawbox:
                    painter.setPen(QtGui.QPen(QtGui.QColor(0, 0, 0), 1))
                    rect = QtCore.QRect(*self._drawbox)
                    painter.drawRect(rect)

                for bubble in self.bubbles:
                    if bubble.rect().intersects(QtCore.QRectF(event.rect())):
                        bubble.drawBubble(painter)

                self.drawInstructions(painter)
                painter.end()
                self.doneCurrent()
            else:
                print 'invalid OpenGL context: Qt cannot overpaint viewer'

    def showEvent(self, event):
        self.createBubbles(20 - len(self.bubbles))

    def sizeHint(self):
        return QtCore.QSize(400, 400)

    def createBubbles(self, number):
        for i in range(number):
            position = QtCore.QPointF(self.width() * (0.1 + 0.8 * random.random()),
                                      self.height() * (0.1 + 0.8 * random.random()))
            radius = min(self.width(), self.height()) * (0.0125 + 0.0875 * random.random())
            velocity = QtCore.QPointF(self.width() * 0.0125 * (-0.5 + random.random()),
                                      self.height() * 0.0125 * (-0.5 + random.random()))

            self.bubbles.append(Bubble(position, radius, velocity))


    def animate(self):
        for bubble in self.bubbles:
            bubble.move(self.rect())
        self.update()

    def setupViewport(self, width, height):
        side = min(width, height)
        glViewport((width - side) // 2, (height - side) // 2, side, side)

        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        glOrtho(-0.5, +0.5, +0.5, -0.5, 4.0, 15.0)
        glMatrixMode(GL_MODELVIEW)

    def drawInstructions(self, painter):
        text = "Click and drag with the left mouse button to rotate the Qt " \
               "logo."
        metrics = QtGui.QFontMetrics(self.font())
        border = max(4, metrics.leading())

        rect = metrics.boundingRect(0, 0, self.width() - 2 * border,
                                    int(self.height() * 0.125),
                                    QtCore.Qt.AlignCenter | QtCore.Qt.TextWordWrap, text)
        painter.setRenderHint(QtGui.QPainter.TextAntialiasing)
        painter.fillRect(QtCore.QRect(0, 0, self.width(), rect.height() + 2 * border), QtGui.QColor(0, 0, 0, 127))
        painter.setPen(QtCore.Qt.white)
        painter.fillRect(QtCore.QRect(0, 0, self.width(), rect.height() + 2 * border), QtGui.QColor(0, 0, 0, 127))
        painter.drawText((self.width() - rect.width()) / 2, border, rect.width(),
                         rect.height(), QtCore.Qt.AlignCenter | QtCore.Qt.TextWordWrap,
                         text)


if __name__ == '__main__':
    def Test3d_bis():
        class AppFrame(QtGui.QWidget):
            def __init__(self, parent=None):
                QtGui.QWidget.__init__(self, parent)
                self.setWindowTitle(self.tr("qtDisplay3d sample"))
                self.resize(640, 480)
                self.canva = GLWidget(self)
                mainLayout = QtGui.QHBoxLayout()
                mainLayout.addWidget(self.canva)
                mainLayout.setMargin(0)
                self.setLayout(mainLayout)

            def runTests(self):
                self.canva._display.Test()

        app = QtGui.QApplication(sys.argv)
        frame = AppFrame()
        frame.show()
        frame.canva.InitDriver()
        frame.runTests()
        app.exec_()

    Test3d_bis()