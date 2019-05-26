extends Node

var teleport = {}

func _ready():
	setUpTeleporters()

func setUpTeleporters():
	var teleporters = get_tree().get_nodes_in_group("teleport")
	for t in teleporters:
		if(!teleport.get(t.connectionName)):
			teleport[t.connectionName] = [t]
		else:
			teleport[t.connectionName].append(t)
			
		t.connect("entered_teleporter", self, "_on_teleport_body_entered")
	
func _on_teleport_body_entered(body, teleporter):
	if(body.name == "player"):
		for t in teleport[teleporter.connectionName]:
			if(t != teleporter):
				t.entities.append(body)
				body.position = t.position