extends CollisionShape2D

var is_active = false
var fix_size = 2
var cor = Color(.5, .2, .2, .6)

func _ready():
	pass

func _process(delta):
	if is_active:
		update()


func _draw():
	draw_rect(Rect2(fix_size*Vector2(-10,-5), fix_size*Vector2(20,10)), cor, false)
	draw_rect(Rect2(fix_size*Vector2(-10,-5)*.8, fix_size*Vector2(20,10)*.8), cor, false)
	draw_rect(Rect2(fix_size*Vector2(-10,-5)*.6, fix_size*Vector2(20,10)*.6), cor, false)
	draw_rect(Rect2(fix_size*Vector2(-10,-5)*.4, fix_size*Vector2(20,10)*.4), cor, false)
	draw_rect(Rect2(fix_size*Vector2(-10,-5)*.2, fix_size*Vector2(20,10)*.2), cor, false)
