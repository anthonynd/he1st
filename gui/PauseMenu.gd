extends Control

func _on_ResumeBtn_pressed():
	get_tree().paused = false
	globals.gui.set_pause_screen_visibility(false)

func _on_RestartBtn_pressed():
	get_tree().paused = false
	globals.reset_map()
	globals.gui.show_game_ui()
	scoreManager.score = 0

func _on_MenuBtn_pressed():
	get_tree().paused = false
	globals.gui.show_menu_screen()
