import QtQuick 2.1
import QtQuick.Controls 1.0

//top-level application window
ApplicationWindow {
	id : _root

	width     : 1024
	height    : 768

	// プレゼン中身
	Presen {
		id: _presen
		width     : _root.width
		height    : _root.height
	}	//Presen
}	//ApplicationWindow
