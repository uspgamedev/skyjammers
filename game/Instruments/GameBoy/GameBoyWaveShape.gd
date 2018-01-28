extends CollisionShape2D

var is_active = false
var fix_size = 2
var ratio = .38
var size = 5

func _ready():
	pass

func _process(delta):
	if is_active:
		update()

func draw_star(radius, alpha):
	var aux
	var outer = Vector2(0, -radius)
	var inner = (outer * ratio).rotated(PI/size)
	
	for i in range (1, size+1):
		draw_line(outer, inner, Color(.5, .2, .2, alpha))
		outer = outer.rotated(2*PI/size)
		draw_line(inner, outer, Color(.5, .2, .2, alpha))
		inner = inner.rotated(2*PI/size)
	
func _draw():
	draw_star(10, .9)
	draw_star(8, .8)
	draw_star(6, .7)
	draw_star(4, .6)
	draw_star(2, .5)
