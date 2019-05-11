extends Control

func _ready():
	var startBtn = $HBoxContainer/VBoxContainer/mainMenuButtons/startGameBtn
	var exitBtn = $HBoxContainer/VBoxContainer/mainMenuButtons/exitGameBtn
	startBtn.connect("pressed", self, "_set_start_map")
	exitBtn.connect("pressed", self, "_exit_game")
	pass # Replace with function body.

func _set_start_map():
	visible = false
	get_node("/root/globals").setMap("house")
	
func _exit_game():
	get_tree().quit()