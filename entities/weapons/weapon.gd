extends Node2D

export (PackedScene) var Bullet

export var max_mag = 30
export var max_ammo = 30
export (float, 0, 3.14) var spread = 2 # For variety if need (not used yet)
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
	
	rateat60fps = 1/(float(rate)/60)
	timer = Timer.new()
	timer.wait_time = rateat60fps
	timer.one_shot = true
	add_child(timer)
	
	set_ui()
	set_physics_process(true)

func hasAmmo() -> bool:
	return mag + ammo > 0

func shoot():
	if mag > 0 and timer.time_left == 0:
		# Spawn bullet
		var dir = global_rotation + (randf() * spread - spread/2)
		var b = Bullet.instance()
		b.damage = damage_point
		b.start($Muzzle.global_position, dir)
		get_tree().get_root().add_child(b)
		
		timer.start()
		mag -= 1
		set_ui()

func set_ui():
	var gui = get_node("/root/globals").gui
	if gui and gui.get_node("inGameUI"):
		gui.get_node("inGameUI").setGunAmmo(mag, ammo)

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