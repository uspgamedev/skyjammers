extends Area2D

func _ready():
	get_node("Tween").interpolate_property(self, "scale", get_scale(), get_scale() * 3, .5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	get_node("Tween").start()
	yield(get_node("Tween"), "tween_completed")
	queue_free()