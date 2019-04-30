extends Light2D

const RED = Color(1.0, 0, 0, 0.4)
const YELLOW = Color(1.0, 1.0, 0, 0.4)

func _ready():
	pass # Replace with function body.

func _draw():
	var player = get_node("./../..")
	
	var imageTexture = ImageTexture.new()
	var dynImage = Image.new()
	
	dynImage.create(256,256,false,Image.FORMAT_RGB8)
	dynImage.fill(Color(1,0,0,1))
	
	imageTexture.create_from_image(dynImage)
	self.texture = imageTexture
	imageTexture.resource_name = "Txture"
	
	var FOV = player.FOV
	var detect_radius = player.detect_radius
	var fov_color = YELLOW
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
	#$DetectionArea/CollisionPolygon2D.polygon = points_arc
	
	# Draw the polygon
	draw_polygon(points_arc, colors)