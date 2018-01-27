extends KinematicBody2D

onready var soundWave = load("res://SoundWave/SoundWave.tscn")
var hasSoundwave = false
var stage

export(float) var growth = 10
export(float) var duration = 1

func pulse():
	var sw = soundWave.instance()
	sw.growth = self.growth
	sw.duration = self.duration
	var shape = get_node("SoundWaveShape").duplicate()
	
	sw.set_position(get_global_position())
	sw.set_rotation(get_parent().get_rotation())
	sw.instrument = self
	sw.stage = self.stage
	shape.show()
	sw.add_child(shape)
	stage.get_node("Instruments").add_child(sw)