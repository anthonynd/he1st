extends Control

func _ready():
	var startBtn = $VBoxContainer/mainMenuButtons/startGameBtn
	var settingsBtn = $VBoxContainer/mainMenuButtons/settingsBtn
	var aboutBtn = $VBoxContainer/mainMenuButtons/aboutBtn
	var exitBtn = $VBoxContainer/mainMenuButtons/exitGameBtn
	
	startBtn.connect("pressed", self, "_set_start_map")
	settingsBtn.connect("pressed", self, "_show_settings")
	aboutBtn.connect("pressed", self, "_show_about")
	exitBtn.connect("pressed", self, "_exit_game")

func _set_start_map():
	get_parent().visible = false
	get_node("/root/globals").setMapWithLevel("house", "house_1")
	
	var inGameUI = get_node("/root/globals").gui.get_node("inGameUI")
	if inGameUI and !inGameUI.visible:
		inGameUI.visible = true

func _show_settings():
	get_parent().setCurrentView(["settings"])
	
func _show_about():
	get_parent().setCurrentView(["about"])

func _exit_game():
	get_tree().quit()