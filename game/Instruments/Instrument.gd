extends KinematicBody2D

onready var soundWave = load("res://SoundWave/SoundWave.tscn")
var hasSoundwave = false
var stage

func pulse():
	var sw = soundWave.instance()
	
	sw.set_position(get_global_position())
	sw.instrument = self
	sw.stage = self.stage
	stage.get_node("Instruments").add_child(sw)