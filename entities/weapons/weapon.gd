extends Node2D

export (PackedScene) var Bullet

export var max_mag = 30
export var max_ammo = 30
export var spread = 2 # For variety if need (not used yet)
export var rate = 30 #RPM
export var damage_point = 50
export (bool) var single_fire = false
export var distance = 1000

var mag
var ammo
var rateat60fps
var timer

func _ready():
	mag = max_mag
	ammo = max_ammo

	visible = false
#	Gun_Ray.cast_to = Vector2(0, distance)
	
	rateat60fps = 1/(float(rate)/60)
	timer = Timer.new()
#	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = rateat60fps
	timer.one_shot = true
	add_child(timer)
	
	set_ui()
	set_physics_process(true)

func shoot():
	if mag > 0 and timer.time_left == 0:
#		$Tip.rotation = deg2rad((randi() % spread) - spread/2)
#		if Gun_Ray.is_colliding():
#			create_hit_partical(Gun_Ray.get_collision_point(), Gun_Ray.get_collision_normal().angle())
#			if Gun_Ray.get_collider() and Gun_Ray.get_collider().is_in_group("Damageable"):
#				print(Gun_Ray.get_collider())
#				Gun_Ray.get_collider().damage(damage_point)
#			trail(Gun_Ray.get_collision_point())
#		else:
#			trail()
		
		# Spawn bullet
		var dir = global_rotation
		var b = Bullet.instance()
		b.start($Muzzle.global_position, dir)
		get_tree().get_root().add_child(b)
		
		timer.start()
		mag -= 1
		set_ui()

func set_ui():
	var gui = get_node("/root/globals").gui
	if gui and gui.get_node("inGameUI"):
		gui.get_node("inGameUI").setGunAmmo(mag, ammo)
#	get_node("/root/globals").printOnScreen("%s/%s" % [mag, ammo])

func reload():
	if mag < max_mag and ammo > 0:
		var missing_ammo = max_mag - mag
		if ammo - missing_ammo < 0:
			mag += ammo
			ammo = 0
		else:
			mag += missing_ammo
			ammo -= missing_ammo
		set_ui()