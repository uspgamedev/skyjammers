extends KinematicBody2D

onready var soundWave = load("res://Scenes/SoundWave.tscn")

func _ready():
	pulse()

func pulse():
	var sw = soundWave.instance()
	var shape = get_node("CollisionShape2D").duplicate()
	sw.add_child(shape)
	add_child(sw)