extends "res://Sentinels/Sentinel.gd"

onready var area = get_node('Area2D')

func _process(delta):
	for i in area.get_overlapping_bodies():
		if i.is_in_group("bards") and self.stage.activeInstrument == i:
			emit_signal("caught")
