extends "./distructable.gd"

export (PackedScene) var AfterEffect
onready var GameNode = get_node("/root/game")

func damage(health_point):
	.damage(health_point)
	check_life()
	
func check_life():
	if health <= 0:
		if(AfterEffect):
			var ae = AfterEffect.instance()
			ae.position = self.position
			GameNode.add_child(ae)
			ae.emitting = true
		queue_free()