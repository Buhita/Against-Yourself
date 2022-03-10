extends Label

func _ready():
	var file = File.new()
	if file.file_exists("user://terminado2.dat"):
		text = "Sí"
	elif file.file_exists("user://save_nombre2.txt"):
		text = "No"
	else:
		return
