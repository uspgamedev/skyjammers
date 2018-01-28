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
