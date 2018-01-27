extends Node2D

export(NodePath) var initial_bard_path

var activeInstrument
var camera

func _ready():
	activeInstrument = get_node(initial_bard_path)
	for instrument in get_tree().get_nodes_in_group("bards"):
		instrument.stage = self

func changeActive(body):
	activeInstrument = body

func _on_Input_played():
	if not activeInstrument.hasSoundwave:
			activeInstrument.pulse()

func _process(delta):
	pass
