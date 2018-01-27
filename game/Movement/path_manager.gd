extends Node2D

var mult = 1

func _ready():
	set_process(true)

func _process(delta):
	var curdelta = delta*mult
	if (curdelta + unit_offset > 1 or curdelta + unit_offset < 0):
		mult *= -1
		curdelta *= -1
	unit_offset += curdelta
