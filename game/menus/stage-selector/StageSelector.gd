extends Control

onready var audioManager = get_node("AudioManager")

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
	$FadeInTween.interpolate_property(self, "rect_position", Vector2(0, -1000), Vector2(0,0), 1,
									  Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	$FadeInTween.start()
