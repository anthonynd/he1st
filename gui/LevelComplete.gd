extends Control

onready var score = $CenterContainer/HBoxContainer/VBoxContainer/Score
onready var restart_button = $CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/RestartBtn
onready var menu_button = $CenterContainer/HBoxContainer/VBoxContainer/HBoxContainer/MenuBtn

func _ready():
	restart_button.connect("pressed", self, "restart_level")
	menu_button.connect("pressed", self, "back_to_menu")

func set_score(value: int):
	score.text = "Score: " + str(value)

func restart_level():
	globals.reset_map()
	globals.gui.show_game_ui()
	scoreManager.score = 0

func back_to_menu():
	globals.gui.show_menu_screen()