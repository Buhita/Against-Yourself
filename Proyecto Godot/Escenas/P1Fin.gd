extends Label

func _ready():
	var file = File.new()
	if file.file_exists("user://terminado1.dat"):
		text = "Sí"
	elif file.file_exists("user://save_nombre1.txt"):
		text = "No"
	else:
		return
