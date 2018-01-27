extends Node2D

#Example Riff so that every riffs plays in sync
var SyncRiff

#Remember: 0 Db != zero volume :-)
var menos_muito = -100

func _ready():
	SyncRiff = get_node("SyncRiff")
	SyncRiff.set_volume_db(menos_muito)

func resetRiff():
	SyncRiff.play()

func getRiffPos():
	return SyncRiff.get_playback_position()
	
func playSFX(sfx):
	get_node(sfx+"SFX").play()

#For debug
func print_position():
	print(SyncRiff.get_playback_position())