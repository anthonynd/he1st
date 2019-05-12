extends PhysicsBody2D

export var health = 100

func _ready():
	if !self.is_in_group("Distructable") :
		self.add_to_group("Distructable")
	self.set_collision_mask_bit(1, 2)

func damage(health_point):
	health -= health_point
	return health
