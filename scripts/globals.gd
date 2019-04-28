extends Node

var debugMessages = [];

var currentScene = null
var mapNode = null
var currentMap = null
var gui = null

var player = null;

func _ready():
	currentScene = get_tree().root.get_child( get_tree().root.get_child_count() - 1)
	gui = currentScene.get_node("gui/main_gui")
	mapNode = currentScene.get_node("map")
	player = currentScene.get_node("player")
	pass # Replace with function body.

func printOnScreen(value):
	if(gui and gui.get_node("debug")):
		var debug_label = gui.get_node("debug")
		debugMessages.append(value);
		if(debugMessages.size() > 5):
			debugMessages.remove(0)
		debug_label.text = PoolStringArray(debugMessages).join("\n");
	pass
	
func setMap(mapName):
	if(!mapNode):
		return
	
	if(currentMap):
		currentMap.queue_free()
	var s = ResourceLoader.load("res://level/maps/"+mapName+".tscn")
	currentMap = s.instance()
	mapNode.add_child(currentMap)
	if(!player.visible):
		player.visible = true
	player.translate(currentMap.get_node("playerSpawn").transform.origin)