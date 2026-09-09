import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland

PanelWindow {
	required property var modelData
	screen: modelData
	readonly property HyprlandMonitor hyprMonitor: Hyprland.monitorFor(modelData)

	id: panel
	exclusiveZone: 0
	color: "transparent"
	height: 20
	aboveWindows: false

	readonly property bool hasActiveWindows: {
		return hyprMonitor.activeWorkspace.toplevels.values.length > 0;
	}

	anchors {
		top: true
		bottom: !panel.hasActiveWindows
		left: true
		right: true
	}

	Rectangle {
		color: "white"
		id: bg
		anchors {
			centerIn: parent
		}

		width: widgetRow.width
		height: widgetRow.height

		Row {
			id: widgetRow
			anchors {
				centerIn: parent
			}
			spacing: 10
			
			Widget { blob: Info.time }
			Widget { 
				blob: Info.internet
				chunk: () => {
					if(Info.internet === "󰖩"){
						Info.internet = "󰤭"
						Quickshell.execDetached(["nmcli", "networking", "off"])
					} else {
						Info.internet = "󰖩"
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
	}
}
