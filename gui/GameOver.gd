extends Control

onready var score = $CenterContainer/HBoxContainer/VBoxContainer/Score

func set_score(value: int):
	score.text = "Score: " + str(value)

func _on_RestartBtn_pressed():
	globals.reset_map()
	globals.gui.show_game_ui()
	scoreManager.score = 0

func _on_MenuBtn_pressed():
	globals.gui.show_menu_screen()
