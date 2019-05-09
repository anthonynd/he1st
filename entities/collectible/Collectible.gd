extends Area2D

signal picked_up

func _on_Collectible_body_entered(body):
	emit_signal("picked_up")
	queue_free()
