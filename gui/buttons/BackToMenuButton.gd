extends Button

func _on_BackToMenuButton_pressed():
	get_tree().paused = false
	globals.gui.show_menu_screen()
