extends Node2D

onready var BassRiff = get_node("BassRiff")
onready var GameboyRiff = get_node("GameboyRiff")
onready var ThereminRiff = get_node("ThereminRiff")
onready var XylophoneRiff = get_node("XylophoneRiff")

#Remember: 0 Db != zero volume :-)
var menos_muito = -100

func _ready():
	pass

func resetRiffs():
	BassRiff.set_volume_db(menos_muito)
	GameboyRiff.set_volume_db(menos_muito)
	ThereminRiff.set_volume_db(menos_muito)
	XylophoneRiff.set_volume_db(menos_muito)
	BassRiff.play()
	GameboyRiff.play()
	ThereminRiff.play()
	XylophoneRiff.play()
	
func activateRiff(riff):
	var vol = -7
	if riff == "Bass":
		BassRiff.set_volume_db(vol)
	elif riff == "Gameboy":
		GameboyRiff.set_volume_db(vol)
	elif riff == "Theremin":
		ThereminRiff.set_volume_db(vol)
	elif riff == "Xylophone":
		XylophoneRiff.set_volume_db(vol)
	
func playSFX(sfx):
	if sfx == "Bass":
		get_node("BassSFX").play()
	elif sfx == "Gameboy":
		get_node("GameboySFX").play()
	elif sfx == "Theremin":
		get_node("ThereminSFX").play()
	elif sfx == "Xylophone":
		get_node("XylophoneSFX").play()
	elif sfx == "Transmission":
		get_node("TransmissionSFX").play()

#For debug
func print_positions():
	print(BassRiff.get_playback_position(), " ", GameboyRiff.get_playback_position(), " ", ThereminRiff.get_playback_position(), " ", XylophoneRiff.get_playback_position())