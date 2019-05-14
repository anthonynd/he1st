extends Control

onready var level_complete = $LevelComplete
onready var in_game_ui = $inGameUI
onready var main_menu = $mainMenu
onready var pause_menu = $PauseMenu
onready var game_over = $GameOver

func show_game_ui():
	in_game_ui.visible = true
	level_complete.visible = false
	main_menu.visible = false
	pause_menu.visible = false
	game_over.visible = false

func show_level_complete():
	globals.unset_map() # TODO: Move out of gui script (use signal handler?)
	level_complete.set_score(scoreManager.score) # TODO: Remove (local score node instead of global)
	in_game_ui.visible = false
	level_complete.visible = true
	main_menu.visible = false
	pause_menu.visible = false
	game_over.visible = false

func show_menu_screen():
	globals.unset_map() # TODO: Move out of gui script (use signal handler?)
	in_game_ui.visible = false
	level_complete.visible = false
	main_menu.visible = true
	pause_menu.visible = false
	game_over.visible = false

func show_game_over():
	game_over.set_score(scoreManager.score) # TODO: Remove (local score node instead of global)
	in_game_ui.visible = true
	level_complete.visible = false
	main_menu.visible = false
	pause_menu.visible = false
	game_over.visible = true

func _input(event):
	if (event.is_action_pressed("escape") 
		and not main_menu.visible
		and not level_complete.visible
		and not game_over.visible):
			var pause_state = not get_tree().paused
			get_tree().paused = pause_state
			pause_menu.visible = pause_state
