import QtQuick

Text {
	property string blob
	font {
		family: "JetBrainsMonoNL NFM"
		bold: true
	}
	text: "[" + blob + "]"
}
