extends Button

func _on_RestartButton_pressed():
	get_tree().paused = false
	globals.reset_map()
	globals.gui.show_game_ui()
	scoreManager.score = 0
