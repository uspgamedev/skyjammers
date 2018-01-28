extends Control

onready var audioManager = get_node("AudioManager")

var current_page

func _set_offset(y):
	self.rect_position.y = y
	var h = get_viewport_rect().size.y #OS.window_size.y
	$Panel.material.set_shader_param("offset", y/h)

func _ready():
	audioManager.playBGM("LevelSelect")
	$FadeInTween.interpolate_method(self, "_set_offset", -1000, 0, 1,
									Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$FadeInTween.start()
	#yield($FadeInTween, "tween_completed")
	load_buttons(int(get_node("/root/Progress").get_last()/8))

func load_buttons(page):
	self.current_page = page
	var total = get_node("/root/Progress").get_total() + 1
	var count = 0 + 8*page
	for button in $Panel/Container.get_children():
		button.set_stage_id(count)
		if count < $Stages.get_child_count() and count < total:
			button.disabled = false
			if button.is_connected("pressed", self, "_on_selected"):
				button.disconnect("pressed", self, "_on_selected")
			button.connect("pressed", self, "_on_selected", [count])
			button.modulate = Color(1,1,1,1)
		else:
			button.disabled = true
			button.modulate = Color(1,1,1,0.2)
		count += 1
	var p0 = $Panel/Container.rect_position
	$LoadButtonsTween.interpolate_property($Panel/Container, "rect_position",
										   Vector2(2000, p0.y), p0, 1, Tween.TRANS_QUAD,
										   Tween.EASE_OUT)
	$LoadButtonsTween.start()
	if total < (page+1)*8:
		$Panel/NextButton.disabled = true
		$Panel/NextButton/Arrow.modulate = Color(1,1,1,0.2)
	else:
		$Panel/NextButton.disabled = false
		$Panel/NextButton/Arrow.modulate = Color(1,1,1,1)
	if page == 0:
		$Panel/PreviousButton.disabled = true
		$Panel/PreviousButton/Arrow.modulate = Color(1,1,1,0.2)
	else:
		$Panel/PreviousButton.disabled = false
		$Panel/PreviousButton/Arrow.modulate = Color(1,1,1,1)

func _next_page():
	load_buttons(self.current_page+1)

func _previous_page():
	load_buttons(self.current_page-1)


func _on_selected(stage_id):
	get_node("/root/StageSelector").queue_free()
	var stage_scene = $Stages.get_child(stage_id).scene
	get_node("/root/Progress").start_stage(stage_id, stage_scene)
