import QtQuick
import QtQuick.Controls

Button {
	property string blob
	property var chunk: null


	HoverHandler {
		id: hoverHandler
        cursorShape: chunk ? Qt.PointingHandCursor : Qt.ArrowCursor
    }

	font {
		family: "JetBrainsMono NFP"
		bold: true
	}
	text: "[" + blob + "]"
	width: contentItem.implicitWidth + leftPadding + rightPadding
	height: 15

	onClicked: {
			if(chunk) chunk()
	}
	background: Item {}
}
