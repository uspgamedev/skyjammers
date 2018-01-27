extends CollisionShape2D

var is_active = false
var speed = 10
var radius = 10

func _ready():
	pass

func _process(delta):
	if is_active:
		radius = get_shape().get_radius()/1.4
		update()

func draw_line_circle(circle_center, circle_radius, color, resolution):
	var draw_counter = 1
	var line_width = 1
	var line_origin = Vector2()
	var line_end = Vector2()
	line_origin = circle_radius + circle_center

	while draw_counter <= 360:
		line_end = circle_radius.rotated(deg2rad(draw_counter)) + circle_center
		draw_line(line_origin, line_end, color, line_width)
		draw_counter += 1 / resolution
		line_origin = line_end

	line_end = circle_radius.rotated(deg2rad(360)) + circle_center
	draw_line(line_origin, line_end, color, line_width)

func _draw():
	draw_line_circle(Vector2(0,0), Vector2(radius,radius), Color(0,0,0,1), .3)
	draw_line_circle(Vector2(0,0), Vector2(radius*.9,radius*.9), Color(0,0,0,1), .3)
	draw_line_circle(Vector2(0,0), Vector2(radius*.8,radius*.8), Color(0,0,0,1), .3)
	draw_line_circle(Vector2(0,0), Vector2(radius*.7,radius*.7), Color(0,0,0,1), .3)
	draw_line_circle(Vector2(0,0), Vector2(radius*.6,radius*.6), Color(0,0,0,1), .3)