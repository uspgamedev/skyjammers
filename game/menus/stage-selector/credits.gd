extends Button

func _ready():
	pass



func _on_credits_pressed():
	var bg = get_node("Polygon2D")
	var image = get_node("CreditScreen")
	if bg.is_visible_in_tree():
		bg.hide()
		get_node("/root/Progress/AudioManager").playBGM("LevelSelect")
	else:
		bg.show()
		get_node("/root/Progress/AudioManager").playBGM("Credits")
	
	if image.is_visible_in_tree():
		image.hide()
	else:
		image.show()
