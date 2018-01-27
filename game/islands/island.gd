extends TileMap

const F = PI*2

onready var count = randf()*PI*2
onready var y0 = self.position.y

func _process(delta):
	count += delta
	count = fmod(count, 1)
	self.position.y = y0 + 6*sin(count*F)
