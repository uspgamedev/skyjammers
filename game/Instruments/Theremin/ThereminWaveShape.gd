extends CollisionShape2D

var is_active = false
var fix_size = -1

func _ready():
	pass

func _process(delta):
	if is_active:
		update()

func draw_triangle(size, x, y, alpha):
	var p1 = Vector2(x, y-size*sqrt(3)/4)
	var p2 = Vector2(x-size/2, y+size*sqrt(3)/4)
	var p3 = Vector2(x+size/2, y+size*sqrt(3)/4)
	draw_line(p1, p2, Color(0,0,0,alpha), 1)
	draw_line(p2, p3, Color(0,0,0,alpha), 1)
	draw_line(p3, p1,  Color(0,0,0,alpha), 1)

func _draw():
	var size = 30/sqrt(3)
	draw_triangle(size, 0, fix_size, .9)
	draw_triangle(size*.9, 0, fix_size, .8)
	draw_triangle(size*.8, 0, fix_size, .7)
	draw_triangle(size*.7, 0, fix_size, .6)
	draw_triangle(size*.6, 0, fix_size, .5)
