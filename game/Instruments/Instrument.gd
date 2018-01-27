extends KinematicBody2D

onready var soundWave = load("res://SoundWave/SoundWave.tscn")

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		pulse()

func pulse():
	var sw = soundWave.instance()
	sw.set_position(get_position())
	sw.instrument = self
	get_parent().add_child(sw)