import QtQuick 2.0

// Slide内のRectangle(プレゼン枠)
Rectangle {
	id: _root

	property real w: parent.width
	property real h: parent.height

	property real  rect_margin  : 20
	property real  rect_opacity : 0.4
	property color rect_color   : "Green"
	property real  rect_z_posi  : -1

	x: rect_margin * -1
	y: rect_margin * -1
	z: rect_z_posi

	width  : w + rect_margin * 2
	height : h + rect_margin * 2
	opacity: rect_opacity
	color  : rect_color

	visible: true
}

