extends Button

export(PackedScene) var stage_scene

func _on_select():
	get_tree().change_scene_to(stage_scene)
	get_node("/root/Progress").stage_started(get_position_in_parent())
