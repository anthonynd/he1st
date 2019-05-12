extends Control

func _ready():
	var startBtn = $main/VBoxContainer/mainMenuButtons/startGameBtn
	var settingsBtn = $main/VBoxContainer/mainMenuButtons/settingsBtn
	var exitBtn = $main/VBoxContainer/mainMenuButtons/exitGameBtn
	startBtn.connect("pressed", self, "_set_start_map")
	settingsBtn.connect("pressed", self, "_show_settings")
	exitBtn.connect("pressed", self, "_exit_game")
	pass # Replace with function body.

func _set_start_map():
	visible = false
	get_node("/root/globals").setMap("house")
	
	var inGameUI = get_node("/root/globals").gui.get_node("inGameUI")
	if inGameUI and !inGameUI.visible:
		inGameUI.visible = true
	
func _show_settings():
	get_node("main").visible = false
	get_node("settings").visible = true

func _exit_game():
	get_tree().quit()