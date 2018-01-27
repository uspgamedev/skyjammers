extends "res://Sentinels/Sentinel.gd"

func _on_body_entered( body ):
	if body.is_in_group("bards") and self.stage.activeInstrument == body:
		emit_signal("caught")
