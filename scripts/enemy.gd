extends "res://scripts/character.gd"

onready var parent = get_parent()

func _process(delta):
	if parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
	else:
		pass

func _on_DetectArea_body_entered(body):
	if body.name == "player":
		# TODO: REPLACE THIS LOGIC
		body.speed = body.speed / 3
	pass # Replace with function body.


func _on_DetectArea_body_exited(body):
	if body.name == "player":
		# TODO: REPLACE THIS LOGIC
		body.speed = body.speed * 3
	pass # Replace with function body.
