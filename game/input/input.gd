extends Node

signal played
onready var stage = get_parent()

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("action_play"):
		emit_signal("played")
