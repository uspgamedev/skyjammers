extends Node2D

var mult = 1
onready var cyclic = get_parent().cyclic
export (float) var speed = 1
export (bool) var override_parent_speed = false

func _ready():
	set_process(true)
	if not override_parent_speed:
		speed = get_parent().speed

func _process(delta):
	var curdelta = delta*mult*speed
	if not self.cyclic and (curdelta + self.unit_offset > 1 or curdelta + self.unit_offset < 0):
		mult *= -1
		curdelta *= -1
	self.unit_offset += curdelta
