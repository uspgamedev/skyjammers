extends Control

onready var audioManager = get_node("AudioManager")

func _ready():
	audioManager.playBGM("LevelSelect")

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
