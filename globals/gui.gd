extends Node

onready var level_complete = globals.gui.get_node("LevelComplete")
onready var in_game_ui = globals.gui.get_node("inGameUI")
onready var main_menu = globals.gui.get_node("mainMenu")

func show_level_complete():
	globals.currentMap.queue_free()
	globals.currentMap = null
	level_complete.set_score(scoreManager.score)
	in_game_ui.visible = false
	level_complete.visible = true

func show_menu_screen():
	main_menu.visible = true
	level_complete.visible = false
	in_game_ui.visible = false