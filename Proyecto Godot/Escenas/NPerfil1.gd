extends Label

onready var perfils = get_node("/root/Globales")

func _process(delta):
	var file = File.new()
	if file.file_exists("user://save_nombre1.txt"):
		file.open("user://save_nombre1.txt", File.READ)
		var nombre = file.get_line()
		text = nombre

func _ready():
	pass
