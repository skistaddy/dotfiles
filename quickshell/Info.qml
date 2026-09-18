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

	property string internet
	Process {
		id: internetProc
		command: ["/home/skistaddy/scripts/internet.sh"]
		running: true

		stdout: StdioCollector {
			onStreamFinished: self.internet = this.text.trim()
		}
	}

	property string volume
	Process {
		id: volumeProc
		command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
		running: true

		stdout: StdioCollector {
			// volume increments by 5% per press
			onStreamFinished: {
				let chars = Number(this.text.slice(8, 12).trim()) * 20
				self.volume = "#".repeat(chars) + " ".repeat(20 - chars)
			}
		}
	}

	Process {
		id: volumeSubscriber
		command: ["pactl", "subscribe"]
		running: true

		stdout: SplitParser {
			onRead: data => {
				//if(volumeProc.running) volumeProc.running = false
				volumeProc.running = true
			}
		}
	}

	Timer {
		interval: 1000
		running: true
		repeat: true
		onTriggered: {
			timeProc.running = true
			batteryProc.running = true
			internetProc.running = true
			volumeProc.running = true
		}
	}
}
