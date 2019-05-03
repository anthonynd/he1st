extends Node2D

func _ready():
	set_camera_limits()
	
func set_camera_limits():
	var map_limits = $middleLayer.get_used_rect()
	var map_cellsize = $middleLayer.cell_size
	$player/mainCam.limit_left = map_limits.position.x * map_cellsize.x
	$player/mainCam.limit_right = map_limits.end.x * map_cellsize.x
	$player/mainCam.limit_top = map_limits.position.y * map_cellsize.y
	$player/mainCam.limit_bottom = map_limits.end.y * map_cellsize.y