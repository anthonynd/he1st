extends Node2D

var collect_quest
var kill_quest

func _ready():
	set_camera_limits()
	init_quests()
	questManager.print_quests()
	connect_enemies()
	connect_collectibles()

func set_camera_limits():
	var map_limits = $middleLayer.get_used_rect()
	var map_cellsize = $middleLayer.cell_size
	$player/mainCam.limit_left = map_limits.position.x * map_cellsize.x
	$player/mainCam.limit_right = map_limits.end.x * map_cellsize.x
	$player/mainCam.limit_top = map_limits.position.y * map_cellsize.y
	$player/mainCam.limit_bottom = map_limits.end.y * map_cellsize.y

func init_quests():
	questManager.clear_quests()
	collect_quest = questManager.add_quest("Collect the flash drive", 1)
	kill_quest = questManager.add_quest("Kill 2 enemies", 2, true)

func connect_enemies():
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.connect("killed", self, "_on_Enemy_killed")

func connect_collectibles():
	$Collectible.connect("picked_up", self, "_on_Collectible_picked_up")

func _on_Collectible_picked_up():
	questManager.progress_quest(collect_quest, 1)
	questManager.print_quests()

func _on_Enemy_killed():
	questManager.progress_quest(kill_quest, 1)
	questManager.print_quests()