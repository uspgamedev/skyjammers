extends Node2D

export(NodePath) var initial_bard_path

export(int) var riff_set = 0

onready var activeInstrument = null
onready var camera = $Camera2D
onready var audioManager = get_node("AudioManager")
var win = false
var lose = false

func _ready():
	randomize()
	audioManager.setRiffSet(self.riff_set)
	activeInstrument = get_node(initial_bard_path)
	activeInstrument.get_node("Riff"+str(audioManager.getRiffSet())).play(audioManager.getRiffPos())
	activeInstrument.activate()
	for instrument in get_tree().get_nodes_in_group("bards"):
		instrument.stage = self
	for sentinel in get_tree().get_nodes_in_group("sentinels"):
		sentinel.connect("caught", self, "_failed")
		sentinel.stage = self
	audioManager.resetRiff()
	
	audioManager.playBGM("Ambience")
	
func changeActive(body):
	if activeInstrument.is_in_group("bards"):
		activeInstrument.deactivate()
	self.activeInstrument = body
	if activeInstrument.is_in_group("bards"):
		activeInstrument.activate()
		body.get_node("Riff"+str(audioManager.getRiffSet())).play(audioManager.getRiffPos())
		audioManager.playSFX("Transmission")
	
	if activeInstrument.is_in_group("sentinels"):
		_failed()
	elif activeInstrument.is_in_group("goal"):
		activeInstrument.get_node("AnimationPlayer").play("bloom")
		win = true

func _failed():
	get_tree().reload_current_scene()

func _on_Input_played():
	if not win and not activeInstrument.hasSoundwave:
		activeInstrument.pulse()
		camera_shake()
	elif win:
		get_tree().change_scene("res://menus/stage-selector/main.tscn")

func _process(delta):
	self.camera.position = self.activeInstrument.get_global_position()

func camera_shake():
	var camera = get_node("Camera2D")
	var timer = get_node("Camera2D/Timer")
	var intensity = 4
	
	timer.start()
	for i in range(3):
		var offset = Vector2(randi() % intensity - randi() % intensity, randi() % intensity - randi() % intensity)
		camera.set_offset(offset)
		yield(timer, "timeout")
	timer.stop()