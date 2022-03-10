extends Label

func _ready():
	var file = File.new()
	if file.file_exists("user://terminado3.dat"):
		text = "Sí"
	elif file.file_exists("user://save_nombre3.txt"):
		text = "No"
	else:
		return
