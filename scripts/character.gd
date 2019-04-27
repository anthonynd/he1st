extends KinematicBody2D

export (PackedScene) var slot_1
export (PackedScene) var slot_2
export (PackedScene) var slot_3
export (PackedScene) var throwable

export var health = 100
export var armor = 0

var slots = []
var current_slot = 0

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
			sl.position.y = -25
#			sl.position.x = 5
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
	return health
