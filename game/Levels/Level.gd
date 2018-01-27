extends Node2D

var activeInstrument

func _ready():
	activeInstrument = get_child(0)
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if not activeInstrument.hasSoundwave:
			activeInstrument.pulse()

func changeActive(body):
	activeInstrument = body