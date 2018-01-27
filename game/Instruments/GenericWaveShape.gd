extends CollisionShape2D

var is_active
var speed

func _process(delta):
	if is_active:
		update()

func _draw():
	pass