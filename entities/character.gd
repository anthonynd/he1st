extends KinematicBody2D

signal killed

export (PackedScene) var slot_1
export (PackedScene) var slot_2
export (PackedScene) var slot_3
export (PackedScene) var throwable

export var speed = 300
export var health = 100
export var armor = 0

var slots = []
var current_slot = 0

onready var Body = get_node("Body")

func _ready():
	if slot_1:
		slots.append(slot_1.instance())
		
	if slot_2:
		slots.append(slot_2.instance())
	
	if slot_3:
		slots.append(slot_3.instance())
	
	if throwable:
		slots.append(throwable.instance())
	
	if slots.size() > 0:
		for sl in slots:
			sl.position.x = 40
			if(!!Body):
				Body.add_child(sl)
			else:
				add_child(sl)
		
		slots[current_slot].visible = true
		#slots[current_slot].set_ui()
	
	pass

func set_slot(index):
	if(index != current_slot):
		slots[current_slot].visible = false
		current_slot = index
		slots[current_slot].visible = true
		#slots[current_slot].set_ui()

func damage(health_point):
	health -= health_point
	if health <= 0:
		die()
	return health

func is_dead() -> bool:
	return health <= 0

func die():
	emit_signal("killed")
