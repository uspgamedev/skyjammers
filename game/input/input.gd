extends Node

signal played
onready var stage = get_parent()

func _ready():
	set_process_unhandled_input(true)

func _unhandled_input(event):
	if event.is_action_pressed("action_play"):
		if stage.lose:
			get_tree().set_pause(false)
			get_tree().reload_current_scene()
		else:
			emit_signal("played")
