extends Control

onready var level_complete = $LevelComplete
onready var in_game_ui = $inGameUI
onready var main_menu = $mainMenu
onready var pause_menu = $PauseMenu

func show_game_ui():
	in_game_ui.visible = true
	level_complete.visible = false
	main_menu.visible = false
	pause_menu.visible = false

func show_level_complete():
	globals.unset_map() # TODO: Move out of gui script (use signal handler?)
	level_complete.set_score(scoreManager.score) # TODO: Remove (local score node instead of global)
	in_game_ui.visible = false
	level_complete.visible = true
	main_menu.visible = false
	pause_menu.visible = false

func show_menu_screen():
	globals.unset_map() # TODO: Move out of gui script (use signal handler?)
	in_game_ui.visible = false
	level_complete.visible = false
	main_menu.visible = true
	pause_menu.visible = false

func set_pause_screen_visibility(value):
	if not main_menu.visible:
		pause_menu.visible = value