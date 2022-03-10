extends Label

onready var perfilp = get_node("/root/Globales")

var tiempo_guardado = 0

func _format_segundos() -> String:
	var file = File.new()
	file.open("user://save_tiempo"+perfilp.perfil+".txt", file.READ)
	tiempo_guardado = file.get_line() as float
	if perfilp.perfil == "1":
		perfilp.tiempo1 = tiempo_guardado as String
	elif perfilp.perfil == "2":
		perfilp.tiempo2 = tiempo_guardado as String
	elif perfilp.perfil == "3":
		perfilp.tiempo3 = tiempo_guardado as String
	file.close()

	var minutos : float = tiempo_guardado / 60
	var segundos := fmod(tiempo_guardado, 60)
	return "%02d:%02d" % [minutos, segundos]

func _ready():
	text = _format_segundos()

func save_time2():
	var save_file = File.new()
	save_file.open("user://save_tiempo"+perfilp.perfil+".txt", File.WRITE)
	if perfilp.perfil == "1":
		save_file.store_line((perfilp.tiempo1) as String)
	if perfilp.perfil == "2":
		save_file.store_line((perfilp.tiempo2) as String)
	if perfilp.perfil == "3":
		save_file.store_line((perfilp.tiempo3) as String)
	save_file.close()
