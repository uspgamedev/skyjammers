extends Node

signal played
signal pause
onready var stage = get_parent()

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action_pressed('ui_pause'):
		emit_signal('pause')
	elif event.is_action_pressed("action_play"):
		emit_signal("played")
