extends Button

func _on_ResumeButton_pressed():
	get_tree().paused = false
	globals.gui.set_pause_screen_visibility(false)
