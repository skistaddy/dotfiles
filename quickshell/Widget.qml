import QtQuick

Text {
	property string blob
	font {
		family: "JetBrainsMono NFP"
		bold: true
	}
	text: "[" + blob + "]"
}
