extends Node

const SAVEFILE = "user://progress.save"

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

func _notification(what):
	if (what == MainLoop.NOTIFICATION_WM_QUIT_REQUEST):
		print("saving?")
		var progress = File.new()
		progress.open(SAVEFILE, File.WRITE)
		progress.store_16(self.total)
		get_tree().quit()
