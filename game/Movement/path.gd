extends Path2D

export (bool) var cyclic
export (float) var speed = 1

onready var points = get_curve().get_baked_points()

func _process(delta):
	update()

func _draw():
	for i in range(0,points.size()-1, 4):
		draw_line(points[i],points[i+1],Color(.2,.2,.6,.7), 5)