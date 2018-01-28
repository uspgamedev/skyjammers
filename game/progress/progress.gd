extends Node

const SAVEFILE = "user://progress.save"
const STAGE_SELECTOR_SCENE = preload("res://menus/stage-selector/main.tscn")

onready var total = 0

var last
var current_stage_scene

func _ready():
	$AudioManager.playBGM("LevelSelect")
	var progress = File.new()
	if !progress.file_exists(SAVEFILE):
		total = 0
		last = 0
		return
	progress.open(SAVEFILE, File.READ)
	total = progress.get_16()
	last = total
	progress.close()

func get_total():
	return self.total

func get_last():
	return self.last

func stage_finished():
	self.total = max(self.total, self.last+1)
	save()

func restart_stage():
	var stage = current_stage_scene.instance()
	stage.get_node("Camera2D").position = Vector2(0, -1000)
	yield(get_tree(), 'physics_frame')
	get_tree().get_root().add_child(stage)

func start_stage(id, stage_scene):
	self.last = id
	self.current_stage_scene = stage_scene
	$AudioManager.stopBGM("LevelSelect")
	restart_stage()

func go_to_stage_selector():
	var stage_selector = STAGE_SELECTOR_SCENE.instance()
	stage_selector.rect_position = Vector2(0, -8000)
	get_tree().get_root().add_child(stage_selector)
	$AudioManager.playBGM("LevelSelect")

func save():
	var progress = File.new()
	progress.open(SAVEFILE, File.WRITE)
	progress.store_16(self.total)
	progress.close()

func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		save()
		get_tree().quit()
