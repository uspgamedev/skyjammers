extends Node2D

var activeInstrument

func _ready():
	activeInstrument = get_node("Instruments").get_child(0)

func changeActive(body):
	activeInstrument = body

func _on_Input_played():
	if not activeInstrument.hasSoundwave:
			activeInstrument.pulse()
