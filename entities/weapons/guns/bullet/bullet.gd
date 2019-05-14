extends KinematicBody2D

export (int) var speed
export (int) var damage
export (float) var lifetime

var velocity = Vector2()

func start(pos, dir):
	position = pos
	rotation = dir
	$Lifetime.wait_time = lifetime
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.has_method("damage"):
			collision.collider.damage(damage)
			
		if collision.collider.has_method("bulletEffect"):
			collision.collider.bulletEffect(collision.position, collision.normal)
		explode()

func explode():
	queue_free()

func _on_lifetime_timeout():
	explode()
