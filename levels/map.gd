extends Node

signal level_complete

var teleport = {}

func _ready():
	set_camera_limits()
	init_quests()
	setUpTeleporters()
	
func setUpTeleporters():
	var teleporters = get_tree().get_nodes_in_group("teleport")
	for t in teleporters:
		if(!teleport.get(t.connectionName)):
			teleport[t.connectionName] = [t]
		else:
			teleport[t.connectionName].append(t)
			
		t.connect("entered_teleporter", self, "_on_teleport_body_entered")

func set_camera_limits():
	var map_limits = $middleLayer.get_used_rect()
	var map_cellsize = $middleLayer.cell_size
	$player/mainCam.limit_left = map_limits.position.x * map_cellsize.x
	$player/mainCam.limit_right = map_limits.end.x * map_cellsize.x
	$player/mainCam.limit_top = map_limits.position.y * map_cellsize.y
	$player/mainCam.limit_bottom = map_limits.end.y * map_cellsize.y

func init_quests():
	pass

func _on_teleport_body_entered(body, teleporter):
	if(body.name == "player"):
		for t in teleport[teleporter.connectionName]:
			if(t != teleporter):
				t.entities.append(body)
				body.position = t.position