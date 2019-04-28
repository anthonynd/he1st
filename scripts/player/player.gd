extends "../character.gd"

export var speed = 300
var screen_size

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.frame = 0
		$AnimatedSprite.stop()
	
	velocity = velocity.normalized() * (speed * delta)
	move_and_collide(velocity)
	
	if (velocity.x > 0):
		$AnimatedSprite.rotation_degrees = 90
	elif (velocity.x < 0):
		$AnimatedSprite.rotation_degrees = 270
	elif (velocity.y > 0):
		$AnimatedSprite.rotation_degrees = 180
	elif (velocity.y < 0):
		$AnimatedSprite.rotation_degrees = 0

