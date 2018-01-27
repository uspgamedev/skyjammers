extends Node2D

var activeInstrument

func _ready():
	activeInstrument = get_child(0)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if not activeInstrument.hasSoundwave:
			activeInstrument.pulse()

func changeActive(body):
	activeInstrument = body