extends Label

onready var perfilp = get_node("/root/Globales")

var time_elapsed := 0.0
var tiempo_guardado : float = 0

func load_time(time):
	var file = File.new()
	if not file.file_exists("user://save_tiempo"+perfilp.perfil+".txt"):
		return
	file.open("user://save_tiempo"+perfilp.perfil+".txt", file.READ)
	time = file.get_var()
	return time
	file.close

onready var countdown := $Timer

func _format_segundos(time : float, use_milisegundos : bool) -> String:
	var tiempo_total = time

	var minutos : float = tiempo_total / 60
	var segundos := fmod(tiempo_total, 60)

	if not use_milisegundos:
		return "%02d:%02d" % [minutos, segundos]

	var milisegundos := fmod(time, 1) * 100
	var time_string := "%02d:%02d:%02d" % [minutos, segundos, milisegundos]
	return "%02d:%02d:%02d" % [minutos, segundos, milisegundos]
	
func _process(_delta: float) -> void:
	time_elapsed += _delta
	
	if perfilp.perfil == "1":
		var ttime = time_elapsed + perfilp.tiempo1
		text = _format_segundos(ttime, false)
	if perfilp.perfil == "2":
		var ttime = time_elapsed + perfilp.tiempo2
		text = _format_segundos(ttime, false)
	if perfilp.perfil == "3":
		var ttime = time_elapsed + perfilp.tiempo3
		text = _format_segundos(ttime, false)

func _ready():
	pass

func toggle_visibility() -> void:
		visible = not visible

func save_time():
	var save_file = File.new()
	if perfilp.perfil == "1":
		perfilp.tiempo1 = perfilp.tiempo1 + time_elapsed
		save_file.open("user://save_tiempo1.txt", File.WRITE)
		save_file.store_line((perfilp.tiempo1) as String)
	if perfilp.perfil == "2":
		perfilp.tiempo2 = perfilp.tiempo2 + time_elapsed
		save_file.open("user://save_tiempo2.txt", File.WRITE)
		save_file.store_line((perfilp.tiempo2) as String)
	if perfilp.perfil == "3":
		perfilp.tiempo3 = perfilp.tiempo3 + time_elapsed
		save_file.open("user://save_tiempo3.txt", File.WRITE)
		save_file.store_line((perfilp.tiempo3) as String)
	save_file.close()
