extends CollisionShape2D

var is_active = false
var fix_size = 2

func _ready():
	pass

func _process(delta):
	if is_active:
		update()


func _draw():
	draw_rect(Rect2(fix_size*Vector2(-10,-5), fix_size*Vector2(20,10)), Color(0,0,0,.9), false)
	draw_rect(Rect2(fix_size*Vector2(-10,-5)*.8, fix_size*Vector2(20,10)*.8), Color(0,0,0,.8), false)
	draw_rect(Rect2(fix_size*Vector2(-10,-5)*.6, fix_size*Vector2(20,10)*.6), Color(0,0,0,.7), false)
	draw_rect(Rect2(fix_size*Vector2(-10,-5)*.4, fix_size*Vector2(20,10)*.4), Color(0,0,0,.6), false)
	draw_rect(Rect2(fix_size*Vector2(-10,-5)*.2, fix_size*Vector2(20,10)*.2), Color(0,0,0,.5), false)
