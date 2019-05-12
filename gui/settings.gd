extends Control

var _settings = {
	"video": {
		"width": 1920,
		"height": 1080
	},
	"controls": {
		"up": "w",
		"down": "s",
		"left": "a",
		"right": "d",
	}
}

onready var settingsTabs = $settingsTabs

func _ready():
	_setButtons()
	
	for section in _settings:
		print(section)
		var sectionNode = settingsTabs.get_node(section)
		if(sectionNode):
			var settingsTree: Tree = sectionNode.get_node("settings")
			if(settingsTree):
				settingsTree.columns = 2
				
				settingsTree.set_column_title (0, "Settings")
				settingsTree.set_column_title (1, "Value")
				settingsTree.set_column_titles_visible(true)
				
				# Create Base Tree
				var root = settingsTree.create_item()
				settingsTree.set_hide_root(true)
				for key in _settings[section]:
					var child = settingsTree.create_item(root)
					child.set_text(0, key)
					child.set_text(1, "%s" % _settings[section][key])
					child.set_editable(1, true)
					

func _setButtons():
	$settingsButtons/saveBtn.connect("pressed", self, "_saveSettings")
	$settingsButtons/cancelBtn.connect("pressed", self, "_closeSettings")
	pass
	
func _saveSettings():
	#Save settings
	print("Should Save")
	_closeSettings()
	pass
	
func _closeSettings():
	visible = false
	get_parent().get_node("main").visible = true
	#Get previous settings
	pass