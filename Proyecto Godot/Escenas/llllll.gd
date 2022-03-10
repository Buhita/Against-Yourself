extends Label

onready var perfils = get_node("/root/Globales")

func _process(delta):
	if perfils.perfil == "1":
		var file = File.new()
		file.open("user://save_nombre1.txt", File.READ)
		var nombre = file.get_line()
		text = nombre
	if perfils.perfil == "2":
		var file = File.new()
		file.open("user://save_nombre2.txt", File.READ)
		var nombre = file.get_line()
		text = nombre
	if perfils.perfil == "3":
		var file = File.new()
		file.open("user://save_nombre3.txt", File.READ)
		var nombre = file.get_line()
		text = nombre

func _ready():
	pass
