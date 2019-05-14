extends "../character.gd"

export (int) var detect_radius = 150
export (int) var FOV = 50

onready var gui = get_node("/root/globals").gui

func _ready():
	set_slot(0)

func _process(delta):
	if not is_dead():
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
		
		if Input.is_action_just_pressed("reload"):
			slots[current_slot].reload()
		
		if Input.is_action_just_pressed("click"):
			slots[current_slot].shoot()
		
		if Input.is_action_just_pressed("slot_1"):
			set_slot(0)
		if Input.is_action_just_pressed("slot_2"):
			set_slot(1)
		if Input.is_action_just_pressed("slot_3"):
			set_slot(2)
		if Input.is_action_just_pressed("throwable"):
			set_slot(3)
		
		move_and_slide(velocity)

func damage(health_point):
	var currentHealth = .damage(health_point)
	if gui and gui.get_node("inGameUI"):
		gui.get_node("inGameUI").playerHealth(currentHealth, totalHealth)
	return currentHealth

func set_slot(index: int):
	.set_slot(index)
	var gui = get_node("/root/globals").gui
	if gui and gui.get_node("inGameUI"):
		gui.get_node("inGameUI").setGunName(slots[current_slot].name)

func die():
	.die()
	$Body.modulate = Color(0.7, 0.7, 0.7, 0.4)
	globals.gui.show_game_over()
	$CollisionShape2D.disabled = true