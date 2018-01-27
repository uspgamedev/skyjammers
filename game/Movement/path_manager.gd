extends Node2D

var mult = 1
onready var cyclic = get_parent().cyclic
onready var speed = get_parent().speed

func _ready():
	set_process(true)
	self.unit_offset = get_parent().cycle_starting_point

func _process(delta):
	var curdelta = delta*mult*speed
	if not self.cyclic and (curdelta + self.unit_offset > 1 or curdelta + self.unit_offset < 0):
		mult *= -1
		curdelta *= -1
	self.unit_offset += curdelta
