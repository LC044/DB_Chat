from PyQt5.QtCore import Qt, QRect
from PyQt5.QtGui import QPainter, QPen
from PyQt5.QtWidgets import QWidget, QApplication


class DrawRect(QWidget):
    def __init__(self, parent=None):
        super(DrawRect, self).__init__(parent)
        self.resize(600, 400)
        self.start_point = None
        self.end_point = None
        self.start = False
        self.drawing = False
        self.setCursor(Qt.CrossCursor)
        self.setMouseTracking(True)

    def paintEvent(self, event):
        super(DrawRect, self).paintEvent(event)
        if self.drawing:
            painter = QPainter()
            painter.begin(self)
            pen = QPen(Qt.red, 5)
            painter.setPen(pen)
            painter.drawRect(QRect(self.start_point, self.end_point))
            painter.end()

    def mousePressEvent(self, event):
        if not self.start:
            self.start_point = event.pos()
            self.start = True

    def mouseReleaseEvent(self, event):
        if self.drawing:
            self.drawing = False
            self.start = False

    def mouseMoveEvent(self, event):
        if self.start:
            self.end_point = event.pos()
            self.drawing = True
            self.update()


if __name__ == '__main__':
    app = QApplication([])
    demo = DrawRect()
    demo.show()
    app.exec_()
