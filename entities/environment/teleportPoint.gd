extends Node

signal entered_teleporter

export (String) var connectionName = null;
export var entities = []; 

func _on_teleportPoint_body_entered(body):
	if(entities.find(body) < 0):
		emit_signal("entered_teleporter", body, self)

func _on_teleportPoint_body_exited(body):
	var i = entities.find(body);
	if(i >= 0):
		entities.remove(i)
