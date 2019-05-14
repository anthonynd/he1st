extends Node2D

signal level_complete

var collect_quest
var kill_quest
var escape_quest

func _ready():
	set_camera_limits()
	init_quests()
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
	collect_quest = questManager.add_quest("Collect the cash", 4)
	kill_quest = questManager.add_quest("Kill all enemies", 6, true)

func connect_enemies():
	var enemies = get_tree().get_nodes_in_group("enemies")
	for enemy in enemies:
		enemy.connect("killed", self, "_on_Enemy_killed")

func connect_collectibles():
	var collectibles = get_tree().get_nodes_in_group("collectibles")
	for collectible in collectibles:
		collectible.connect("picked_up", self, "_on_Collectible_picked_up")

func _on_Collectible_picked_up():
	questManager.progress_quest(collect_quest, 1)
	scoreManager.add_score(1000)
	if questManager.QuestList[collect_quest].isDone():
		add_escape_quest()

func _on_Enemy_killed():
	questManager.progress_quest(kill_quest, 1)

func add_escape_quest():
	escape_quest = questManager.add_quest("Escape the house", 1)
	$EscapeArea.set_collision_mask_bit(1, true)

func _on_EscapeArea_body_entered(body):
	globals.gui.show_level_complete()
