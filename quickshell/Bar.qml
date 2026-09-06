import Quickshell
import QtQuick

PanelWindow {
	required property var modelData
	screen: modelData
	
	Row {
		anchors {
			centerIn: parent
		}
		spacing: 20
		Widget { blob: Info.time }
		Widget { blob: Info.battery + "%" }
	}

	exclusiveZone: 0
	color: "#00000000"
	height: 20
	aboveWindows: true
	anchors {
		top: true
		left: true
		right: true
	}
}
