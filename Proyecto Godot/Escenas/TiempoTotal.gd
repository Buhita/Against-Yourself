extends Label

onready var perfilp = get_node("/root/Globales")

var tiempo_guardado = 0

func _format_segundos() -> String:
	var file = File.new()
	file.open("user://save_tiempo"+perfilp.perfil+".txt", file.READ)
	tiempo_guardado = file.get_line() as float
	file.close()
	var minutos : float = tiempo_guardado / 60
	var segundos := fmod(tiempo_guardado, 60)
	return "%02d:%02d" % [minutos, segundos]

func _ready():
	text = _format_segundos()
