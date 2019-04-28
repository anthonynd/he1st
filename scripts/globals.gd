extends Node

var currentScene = null
var gui = null

var debugMessages = [];

func _ready():
	currentScene = get_tree().root.get_child( get_tree().root.get_child_count() - 1)
	gui = currentScene.get_node("gui/main_gui")
	pass # Replace with function body.

func printOnScreen(value):
	if(gui and gui.get_node("debug")):
		var debug_label = gui.get_node("debug")
		debugMessages.append(value);
		if(debugMessages.size() > 5):
			debugMessages.remove(0)
		debug_label.text = PoolStringArray(debugMessages).join("\n");
	pass