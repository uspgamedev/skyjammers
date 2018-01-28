extends Button

export(PackedScene) var stage_scene

func _on_select():
	var stage = stage_scene.instance()
	stage.get_node("Camera2D").position = Vector2(0, -1000)
	get_tree().get_root().add_child(stage)
	get_node("/root/StageSelector").queue_free()
	get_node("/root/Progress").stage_started(get_position_in_parent())
