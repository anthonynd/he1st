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
		slots[current_slot].shoot()
	
	if Input.is_action_just_pressed("slot_1"):
		.set_slot(0)
	if Input.is_action_just_pressed("slot_2"):
		.set_slot(1)
	if Input.is_action_just_pressed("slot_3"):
		.set_slot(2)
	if Input.is_action_just_pressed("throwable"):
		.set_slot(3)
	
	move_and_slide(velocity)
