extends Area2D

var instrument


func _ready():
	pulse()


func pulse():
	var tween = get_node("Tween")
	
	instrument.hasSoundwave = true
	tween.interpolate_property(self, "scale", get_scale(), get_scale() * 30, 5, Tween.TRANS_LINEAR, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_completed")
	selfDestruct()


func _on_SoundWave_body_entered( body ):
	if body != instrument:
		get_parent().get_parent().changeActive(body)
		selfDestruct()


func selfDestruct():
	instrument.hasSoundwave = false
	queue_free()