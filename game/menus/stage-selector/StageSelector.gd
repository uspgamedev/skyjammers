extends Control

onready var audioManager = get_node("AudioManager")

func _set_offset(y):
	self.rect_position.y = y
	var h = get_viewport_rect().size.y #OS.window_size.y
	$Panel.material.set_shader_param("offset", y/h)

func _ready():
	audioManager.playBGM("LevelSelect")
	load_buttons(0)

func load_buttons(page):
	var total = get_node("/root/Progress").get_total() + 1
	var count = 0 + 8*page
	for button in $Panel/Container.get_children():
		button.set_stage_id(count)
		if count < $Stages.get_child_count() and count < total:
			button.show()
			button.connect("pressed", self, "_on_selected", [count])
		else:
			button.disabled = true
			button.modulate = Color(1,1,1,0.2)
		count += 1
	$FadeInTween.interpolate_method(self, "_set_offset", -1000, 0, 1,
									  Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$FadeInTween.start()

func _on_selected(stage_id):
	get_node("/root/StageSelector").queue_free()
	var stage_scene = $Stages.get_child(stage_id).scene
	get_node("/root/Progress").start_stage(stage_id, stage_scene)
