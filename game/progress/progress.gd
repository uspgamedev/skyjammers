extends Node

const SAVEFILE = "user://progress.save"
const STAGE_SELECTOR_SCENE = preload("res://menus/stage-selector/main.tscn")

onready var total = 0

var last

func _ready():
	var progress = File.new()
	if !progress.file_exists(SAVEFILE):
		total = 0
		return
	progress.open(SAVEFILE, File.READ)
	total = progress.get_16()
	progress.close()

func get_total():
	return self.total

func stage_started(id):
	self.last = id

func stage_finished():
	self.total = max(self.total, self.last+1)

func go_to_stage_selector():
	var stage_selector = STAGE_SELECTOR_SCENE.instance()
	stage_selector.rect_position = Vector2(0, -8000)
	get_tree().get_root().add_child(stage_selector)

func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		print("saving?")
		var progress = File.new()
		progress.open(SAVEFILE, File.WRITE)
		progress.store_16(self.total)
		get_tree().quit()
