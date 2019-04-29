extends "../character.gd"

func _process(delta):
	$Head.look_at(get_global_mouse_position())
	
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
		$Head.play()
	else:
		$Head.frame = 0
		$Head.stop()
	
	velocity = velocity.normalized() * (speed * delta)
	move_and_collide(velocity)
