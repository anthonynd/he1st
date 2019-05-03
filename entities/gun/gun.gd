extends Node2D

signal shoot

export (PackedScene) var Bullet
export (float) var fire_rate
export (int) var ammo

var can_shoot = true

func _ready():
	$GunTimer.wait_time = 1/fire_rate

func shoot():
	if can_shoot and ammo > 0:
		can_shoot = false
		ammo -= 1
		$GunTimer.start()
		
		# Spawn bullet
		var dir = global_rotation
		var b = Bullet.instance()
		b.start($Muzzle.global_position, dir)
		get_tree().get_root().add_child(b)

func _on_GunCooldown_timeout():
	can_shoot = true
