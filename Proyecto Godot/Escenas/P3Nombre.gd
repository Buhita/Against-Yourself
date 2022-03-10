extends Label

func _ready():
	var file = File.new()
	if file.file_exists("user://save_nombre3.txt"):
		file.open("user://save_nombre3.txt", File.READ)
		text = file.get_line()
	else:
		return
