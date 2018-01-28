extends Node

export(PackedScene) var scene = null

func _ready():
	assert(scene != null)
