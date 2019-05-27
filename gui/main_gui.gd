extends "res://gui/guiController.gd"

onready var level_complete = $LevelComplete
onready var in_game_ui = $inGameUI
onready var main_menu = $mainMenu
onready var pause_menu = $PauseMenu
onready var game_over = $GameOver

func show_game_ui():
	setCurrentView(["inGameUI"])

func show_level_complete():
	globals.unset_map() # TODO: Move out of gui script (use signal handler?)
	level_complete.set_score(scoreManager.score) # TODO: Remove (local score node instead of global)
	setCurrentView(["LevelComplete"])

func show_menu_screen():
	globals.unset_map() # TODO: Move out of gui script (use signal handler?)
	setCurrentView(["mainMenu"])
	globals.setMap("mainMenu")

func show_game_over():
	game_over.set_score(scoreManager.score) # TODO: Remove (local score node instead of global)
	setCurrentView(["inGameUI", "GameOver"])
	
func set_pause_screen_visibility(value):
	pause_menu.visible = value

func _input(event):
	if (event.is_action_pressed("escape") 
		and not main_menu.visible
		and not level_complete.visible
		and not game_over.visible):
			var pause_state = not get_tree().paused
			get_tree().paused = pause_state
			pause_menu.visible = pause_state
