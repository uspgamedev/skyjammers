extends KinematicBody2D

export(float) var growth = 10
export(float) var duration = 1
export(float) var frequency = 0 # if different than 0, outoplays in that frequency

onready var soundWave = load("res://SoundWave/SoundWave.tscn")
var hasSoundwave = false
var active = false
var stage


func pulse():
	var obj = get_node("TextureRect")
	var tween = get_node("TextureRect/Tween")
	tween.interpolate_property(obj, "rect_scale", obj.get_scale(), Vector2(growth,growth), self.duration, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	
	var sw = soundWave.instance()
	var shape = get_node("SoundWaveShape").duplicate()
	var rot = get_node("SoundWaveShape").get_rotation()
	
	if get_node("SoundWaveShape").has_node("Rotate"):
		rot = get_node("SoundWaveShape/Rotate").get_rotation()
	
	sw.growth = self.growth
	sw.duration = self.duration
	sw.set_position(get_global_position())
	sw.set_rotation(rot)
	sw.instrument = self
	sw.stage = self.stage
	shape.is_active = true
	self.hasSoundwave = true
	shape.show()
	sw.add_child(shape)
	stage.get_node("Instruments").add_child(sw)
	
	#play correspondent sfx
	get_node("SFX").play()


func _physics_process(delta):
	if get_node("SoundWaveShape").has_node("Rotate"):
		var rot = get_node("SoundWaveShape/Rotate").get_rotation()
		
		get_node("WavePreview").set_rotation(rot)
	else:
		get_node("WavePreview").set_rotation(get_node("SoundWaveShape").get_rotation())


func activate():
	active = true
	get_node('NoteParticles').show()
	get_node('NoteParticles2').show()
	get_node("WavePreview/AnimationPlayer").play("active")
	get_node("Sprite/AnimationPlayer").play("playing")
	get_node("Sprite2").show()
	set_physics_process(true)


func deactivate():
	active = false
	get_node("WavePreview/AnimationPlayer").play("off")
	get_node("Sprite/AnimationPlayer").stop()
	get_node("Sprite2").hide()
	set_physics_process(false)


func _on_Tween_tween_completed( object, key ):
	get_node("TextureRect").set_scale(Vector2(0,0))
