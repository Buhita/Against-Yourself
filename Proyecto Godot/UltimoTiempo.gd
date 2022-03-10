extends Label

onready var perfilp = get_node("/root/Globales")

func _mostrar_tiempo():
	var file = File.new()
	file.open("user://save_tiempo"+perfilp.perfil+".txt", file.READ)
	var tiempo_guardado = file.get_line() as float
	file.close()
	var minutos : float = tiempo_guardado / 60
	var segundos := fmod(tiempo_guardado, 60)
	return "%02d:%02d" % [minutos, segundos]

func _ready():
	var file = File.new()
	if file.file_exists("user://terminado"+perfilp.perfil+".dat"):
		text = "Tu último tiempo: "+_mostrar_tiempo()
	else:
		text = ""
