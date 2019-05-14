extends Control

onready var restart_button = $CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/RestartBtn
onready var menu_button = $CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/MenuBtn

func _ready():
	restart_button.connect("pressed", self, "restart_level")
	menu_button.connect("pressed", self, "back_to_menu")

func _input(event):
	if event.is_action_pressed("escape"):
		var pause_state = not get_tree().paused
		get_tree().paused = pause_state
		globals.gui.set_pause_screen_visibility(pause_state)

func restart_level():
	get_tree().paused = false
	globals.reset_map()
	globals.gui.show_game_ui()
	scoreManager.score = 0

func back_to_menu():
	get_tree().paused = false
	globals.gui.show_menu_screen()
