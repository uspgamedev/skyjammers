extends Node2D

export(NodePath) var initial_bard_path

export(int) var riff_set = 0

onready var activeInstrument = null
onready var camera = $Camera2D
onready var audioManager = get_node("AudioManager")
onready var overlayAnimation = get_node("CanvasLayer/overlay/AnimationPlayer")
onready var win = false
onready var lose = false

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
	
	get_node("ParallaxBackground/ParallaxLayer/Cloud").set_position(Vector2(randi() % 2000 - 999, 0))
	get_node("CanvasLayer/Cloud").set_position(Vector2(randi() % 2000 - 999, 0))
	
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
		# flash here
		overlayAnimation.play("flash")
		activeInstrument.get_node("AnimationPlayer").play("bloom")
		audioManager.playSFX("LevelClear")
		win = true

func _failed():
	audioManager.playSFX('GameOver')
	get_node("CanvasLayer2/grayscaleShader").material.set_shader_param("grayscale", true)
	self.get_node("CanvasLayer2").get_node("tween_factor").interpolate_property(get_node("CanvasLayer2/grayscaleShader").material, "shader_param/factor", .1, 30, 3, Tween.TRANS_QUAD, Tween.EASE_OUT, 0)#Does some tween in the shader inside the canvaslayer onto the texture applying some grayscale shader. Read shader info here:https://docs.google.com/spreadsheets/d/1hBpkNor5-WUTKuiEP3Myo4wzleCWvqPqn1OLgOwFsmU/edit#gid=1880657918. Inspired by gta famous "WASTED" gameover screen.
	var t = self.get_node("CanvasLayer2").get_node("tween_factor")
	t.start()
	get_tree().set_pause(true)
	lose = true

func _on_Input_played():
	if lose:
		get_tree().set_pause(false)
		get_node("CanvasLayer2/grayscaleShader").material.set_shader_param("grayscale", false)
		queue_free()
		get_node("/root/Progress").restart_stage()
	elif not win and not activeInstrument.hasSoundwave:
		activeInstrument.pulse()
		camera_shake()
	elif win:
		get_node("/root/Progress").stage_finished()
		get_node("/root/Progress").go_to_stage_selector()
		queue_free()

func _process(delta):
	var bg = get_node("ParallaxBackground/ParallaxLayer/Cloud")
	var fg = get_node("CanvasLayer/Cloud")
	
	self.camera.position = self.activeInstrument.get_global_position()
	bg.set_position(Vector2(bg.get_position().x + 0.4, 0))
	if bg.get_position().x > 1000:
		bg.set_position(Vector2(-1000, 0))
	fg.set_position(Vector2(fg.get_position().x - 0.6, 0))
	if fg.get_position().x < -1000:
		fg.set_position(Vector2(1000, 0))
	

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