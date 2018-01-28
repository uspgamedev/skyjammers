extends Button

export(PackedScene) var stage_scene

func _on_select():
	get_node("/root/StageSelector").queue_free()
	get_node("/root/Progress").start_stage(get_position_in_parent(), stage_scene)
