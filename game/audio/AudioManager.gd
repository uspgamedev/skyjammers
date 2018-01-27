extends Node2D

#Example Riff so that every riffs plays in sync
var currentRiffSet = 0
var SyncRiffs = []

#Remember: 0 Db != zero volume :-)
var menos_muito = -100

func _ready():
	SyncRiffs.append(get_node("SyncRiff0"))
	SyncRiffs.append(get_node("SyncRiff1"))
	SyncRiffs[0].set_volume_db(menos_muito)
	SyncRiffs[1].set_volume_db(menos_muito)

func resetRiff():
	SyncRiffs[currentRiffSet].play()

func setRiffSet(idx):
	currentRiffSet = idx

func getRiffSet():
	return currentRiffSet

func getRiffPos():
	return SyncRiffs[currentRiffSet].get_playback_position()
	
func playSFX(sfx):
	get_node(sfx+"SFX").play()

#For debug
func print_position():
	print(SyncRiffs[currentRiffSet].get_playback_position())