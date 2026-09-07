import Quickshell
import QtQuick

PanelWindow {
	required property var modelData
	screen: modelData
	
	Row {
		anchors {
			centerIn: parent
		}
		spacing: 10
		Widget { blob: Info.time }
		Widget { 
			blob: Info.internet
			chunk: () => {
				if(Info.internet === "󰖩"){
					Quickshell.execDetached(["nmcli", "networking", "off"])
				} else {
					Quickshell.execDetached(["nmcli", "networking", "on"])
				}
			}
		}
		//Widget { blob: Info.volume }
		Widget { 
			blob: Info.battery + "%"
		}
		Widget { 
			blob: "⏻"
			chunk: () => {
				Quickshell.execDetached(["reboot"])
			}
		}
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
