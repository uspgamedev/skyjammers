extends KinematicBody2D

onready var soundWave = load("res://SoundWave/SoundWave.tscn")
var hasSoundwave = false

func pulse():
	var sw = soundWave.instance()
	sw.set_position(get_position())
	sw.instrument = self
	get_parent().add_child(sw)