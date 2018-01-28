extends Control

onready var audioManager = get_node("AudioManager")

func _set_offset(y):
	self.rect_position.y = y
	var h = get_viewport_rect().size.y #OS.window_size.y
	$Panel.material.set_shader_param("offset", y/h)

func _ready():
	audioManager.playBGM("LevelSelect")
	var total = get_tree().get_root().get_node("Progress").get_total() + 1
	var count = 0
	for button in $Panel/GridContainer.get_children():
		if count < total:
			button.show()
		else:
			button.hide()
		count += 1
	$FadeInTween.interpolate_method(self, "_set_offset", -1000, 0, 1,
									  Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$FadeInTween.start()
