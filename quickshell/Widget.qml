import QtQuick
import QtQuick.Controls

Button {
	property string blob
	property var chunk: null

	background: Item {}

	HoverHandler {
		id: hoverHandler
        cursorShape: chunk ? Qt.PointingHandCursor : Qt.ArrowCursor
    }

	font {
		family: "JetBrainsMono NFP"
		bold: true
	}
	text: "[" + blob + "]"

	onClicked: {
			if(chunk) chunk()
	}
}
