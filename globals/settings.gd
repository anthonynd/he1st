extends Node

enum Types {
	TEXT,
	INT,
	BOOLEAN,
	OPTIONS,
	KEY
}

const SAVE_FILE = "res://config.cfg"

var config = ConfigFile.new()

var _settings = {
	"video": {
		"width": {
			"value": 1920,
			"type": Types.INT,
			"location": "OS.window_size.x"
		},
		"height": {
			"value": 1080,
			"type": Types.INT,
			"location": "OS.window_size.y"
		},
		"fullscreen": {
			"value": false,
			"type": Types.BOOLEAN,
			"location": "OS.window_fullscreen"
		}
	},
	"controls": {
		"up": {
			"value": "w",
			"type": Types.KEY
		},
		"down": {
			"value": "s",
			"type": Types.KEY
		},
		"left": {
			"value": "a",
			"type": Types.KEY
		},
		"right": {
			"value": "d",
			"type": Types.KEY
		}
	}
}

func _ready():
	#print(InputMap.get_actions()) #Has all the input settings for controls
	#print(OS.get_video_driver_name(OS.get_current_video_driver()))  #Has all the window settings
	#print(OS.get_audio_driver_name(0) )  #Has all the audio settings
	
	saveSettings()
	pass

func saveSettings():
	for section in _settings:
		for key in _settings[section]:
			config.set_value(section, key, _settings[section][key].value)
	
	config.save(SAVE_FILE)


func getSetting(category, key):
	return _settings[category][key].value

func setSetting(category, key, value):
	_settings[category][key].value = value