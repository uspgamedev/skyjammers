extends Node2D

export(NodePath) var initial_bard_path

onready var activeInstrument = null
onready var camera = $Camera2D
onready var audioManager = get_node("AudioManager")
var game_over = false

func _ready():
	activeInstrument = get_node(initial_bard_path)
	for instrument in get_tree().get_nodes_in_group("bards"):
		instrument.stage = self
	for sentinel in get_tree().get_nodes_in_group("sentinels"):
		sentinel.connect("caught", self, "_failed")
		sentinel.stage = self
	audioManager.resetRiff()

func changeActive(body):
	if activeInstrument.is_in_group("bards"):
		activeInstrument.active = false
	self.activeInstrument = body
	if activeInstrument.is_in_group("bards"):
		activeInstrument.active = true
		body.get_node("Riff").play(audioManager.getRiffPos())
		audioManager.playSFX("Transmission")
	
	if activeInstrument.is_in_group("sentinels"):
		_failed()
	elif activeInstrument.is_in_group("goal"):
		game_over = true
		OS.alert("very gud job", "so pretty")

func _failed():
	get_tree().reload_current_scene()
	#game_over = true
	#OS.alert("GAME OVER", "u suk")

func _on_Input_played():
	if not game_over and not activeInstrument.hasSoundwave and activeInstrument.frequency == 0:
			activeInstrument.pulse()

func _process(delta):
	self.camera.position = self.activeInstrument.get_global_position()
