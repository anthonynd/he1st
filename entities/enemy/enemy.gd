extends "res://entities/character.gd"

# TODO: Fix player detection through walls

onready var parent = get_parent()

export (int) var detect_radius
export (int) var FOV

const RED = Color(1.0, 0, 0, 0.4)
const YELLOW = Color(1.0, 1.0, 0, 0.4)
var fov_color = YELLOW

func _ready():
	add_to_group("enemies")

func _process(delta):
	if !is_dead() and parent is PathFollow2D:
		parent.set_offset(parent.get_offset() + speed * delta)
		parent.rotate = true
	else:
		pass

func _draw():
	draw_circle_arc_poly(Vector2(), detect_radius, -FOV/2, FOV/2, fov_color)

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

func die():
	.die()
	$Body.modulate = Color(0.7, 0.7, 0.7, 0.4)
	$CollisionShape2D.disabled = true

func _on_DetectionArea_body_entered(body):
	fov_color = RED
	update()

func _on_DetectionArea_body_exited(body):
	fov_color = YELLOW
	update()
