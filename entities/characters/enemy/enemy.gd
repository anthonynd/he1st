extends "../character.gd"

# TODO: Fix player detection through walls

onready var parent = get_parent()

export (int) var detect_radius
export (int) var FOV

export (float) var totalWaitTimeInSeconds = 2.0 # Second

const RED = Color(1.0, 0, 0, 0.5)
const YELLOW = Color(1.0, 1.0, 0, 0.2)
const WHITE = Color(1, 1, 1, 0.2)

var fov_color = WHITE
var target
var hit_pos

enum State {IDLE, PATROL, DETECT, ATTACK, SHOT, DEAD}

var currentState = State.IDLE
var previousState = null

var timer

func _ready():
	add_to_group("enemies")
	set_slot(0)
	
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = totalWaitTimeInSeconds
	timer.one_shot = true
	timer.connect("timeout", self, "_on_timer_timeout")

func _physics_process(delta):
	$debug.text = "%s\n%s" % [State.keys()[currentState], timer.time_left]
	
	if currentState != State.DEAD:
		if timer.time_left == 0:
			if (currentState != State.DETECT and parent is PathFollow2D):
				setState(State.PATROL)
				rotation = 0
				parent.set_offset(parent.get_offset() + speed * delta)
				parent.rotate = true
		else:
			# TODO: LOOK AROUND
			pass
			
		if target:
			aim()

func aim():
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_ray(global_position, target.global_position, [self], collision_mask)
	if result:
		hit_pos = result.position
		update()
		if result.collider.name == "player":
			setState(State.DETECT)
			look_at(hit_pos)
			timer.start()
			
			if slots[current_slot]:
				slots[current_slot].shoot()
			fov_color = RED
		else:
			setState(State.PATROL)
	else:
		setState(previousState)

func _draw():
	draw_circle_arc_poly(Vector2(), detect_radius, -FOV/2, FOV/2, fov_color)
	
	if target and hit_pos:
		draw_circle(to_local(hit_pos), 5, RED)
		draw_line(Vector2(), to_local(hit_pos), RED)

func draw_circle_arc_poly(center, radius, angle_from, angle_to, color):
	var nb_points = 32
	var points_arc = PoolVector2Array()
	points_arc.push_back(center)
	var colors = PoolColorArray([color])
	
	for i in range(nb_points+1):
    	var angle_point = angle_from + i*(angle_to-angle_from)/nb_points
    	points_arc.push_back(center + Vector2( cos( deg2rad(angle_point) ), sin( deg2rad(angle_point) ) ) * radius)
	
	# Set detection area to the created polygon
	$DetectionArea/CollisionPolygon2D.polygon = points_arc
	
	# Draw the polygon
	# draw_polygon(points_arc, colors)

func setState(state: int):
	if(currentState != state):
		previousState = currentState
		currentState = state

func damage(health_point):
	setState(State.SHOT)
	if timer.time_left == 0:
		timer.start()
	return .damage(health_point)

func die():
	.die()
	$Body.modulate = Color(0.7, 0.7, 0.7, 0.4)
	$CollisionShape2D.disabled = true
	$DetectionArea/CollisionPolygon2D.disabled = true
	target = null
	setState(State.DEAD)

func _on_timer_timeout():
	if(currentState != State.DEAD):
		setState(previousState)

func _on_DetectionArea_body_entered(body):
	if not target:
		target = body
	fov_color = YELLOW
	update()

func _on_DetectionArea_body_exited(body):
	if body == target:
		target = null
	fov_color = WHITE
	update()
