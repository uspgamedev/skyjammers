extends Button

func set_stage_id(id):
	$Label.text = var2str(id)

func _hover():
	self.rect_scale = Vector2(1.15, 1.15)

func _unhover():
	self.rect_scale = Vector2(1, 1)
