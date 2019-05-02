extends "../character.gd"

export (int) var detect_radius = 150
export (int) var FOV = 50

func _process(delta):
	$Body.look_at(get_global_mouse_position())
	
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
	if Input.is_action_just_pressed("click"):
		# TODO: When slots are working, change to shoot whatever is in the "active" slot
		$Body/Gun.shoot()
	
	move_and_slide(velocity)
