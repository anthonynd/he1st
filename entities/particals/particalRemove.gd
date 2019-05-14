extends Particles2D

export var remove_item_time = 1.0

func _ready():
	yield(get_tree().create_timer(remove_item_time), "timeout")
	queue_free()