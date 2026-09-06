pragma Singleton

import Quickshell
import QtQuick
import Quickshell.Io

Singleton {
	id: self

	property string time
	Process {
		id: timeProc
		command: ["date", "+%r"]
		running: true

		stdout: StdioCollector {
			onStreamFinished: self.time = this.text.trim()
		}
	}
	
	property string battery
	Process {
		id: batteryProc
		command: ["cat", "/sys/class/power_supply/BAT1/capacity"]
		running: true

		stdout: StdioCollector {
			onStreamFinished: self.battery = this.text.trim()
		}
	}

	Timer {
		interval: 1000
		running: true
		repeat: true
		onTriggered: {
			timeProc.running = true
			batteryProc.running = true
		}
	}
}
