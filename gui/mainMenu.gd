extends Control

func _ready():
	var startBtn = $VBoxContainer/mainMenuButtons/startGameBtn
	var settingsBtn = $VBoxContainer/mainMenuButtons/settingsBtn
	var exitBtn = $VBoxContainer/mainMenuButtons/exitGameBtn
	startBtn.connect("pressed", self, "_set_start_map")
	settingsBtn.connect("pressed", self, "_show_settings")
	exitBtn.connect("pressed", self, "_exit_game")

func _set_start_map():
	get_parent().visible = false
	get_node("/root/globals").setMap("house")
	
	var inGameUI = get_node("/root/globals").gui.get_node("inGameUI")
	if inGameUI and !inGameUI.visible:
		inGameUI.visible = true

func _show_settings():
	visible = false
	get_parent().get_node("settings").visible = true

func _exit_game():
	get_tree().quit()