extends Node2D

export var angular_velocity = 4

func _physics_process(delta):
	set_rotation(get_rotation() + angular_velocity * delta)