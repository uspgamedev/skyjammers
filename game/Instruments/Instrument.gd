extends KinematicBody2D

export(float) var growth = 10
export(float) var duration = 1
export var frequency = 0 # if different than 0, outoplays in that frequency

onready var soundWave = load("res://SoundWave/SoundWave.tscn")
var hasSoundwave = false
var active = false
var stage


func _ready():
	if frequency != 0:
		get_node("Timer").set_wait_time(1 / frequency)
		get_node("Timer").start()


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


func _on_Timer_timeout():
	if active:
		pulse()
