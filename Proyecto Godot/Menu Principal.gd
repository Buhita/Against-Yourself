extends Control

onready var perfilp = get_node("/root/Globales")

var puntero = load("res://Recursos/Cursores/select.png")

func load_game():
	var file = File.new()
	if not file.file_exists("user://save_"+perfilp.perfil+".dat"):
		return
	file.open("user://save_"+perfilp.perfil+".dat", file.READ)
	var ins = file.get_var() as int
	return ins
	file.close()

func _on_Nueva_Partida_pressed():
	var dir = Directory.new()
	dir.remove("user://terminado"+perfilp.perfil+".dat")
	dir.remove("user://save_tiempo"+perfilp.perfil+".txt")
	dir.remove("user://save_"+perfilp.perfil+".dat")
	if perfilp.perfil == "1":
		perfilp.tiempo1 = "0"
	elif perfilp.perfil == "2":
		perfilp.tiempo2 = "0"
	elif perfilp.perfil == "3":
		perfilp.tiempo3 = "0"
	get_tree().change_scene("res://Escenas/Comienzo.tscn")

func _on_Salir_pressed():
	get_tree().quit()

func _on_Cargar_Partida_pressed():
	var ins = load_game()
	if ins == 0:
		get_tree().change_scene("res://Escenas/Comienzo2.tscn")
	if ins == 1:
		get_tree().change_scene("res://Escenas/Instancia1.tscn")
	if ins == 2:
		get_tree().change_scene("res://Escenas/Instancia2.tscn")
	if ins == 3:
		get_tree().change_scene("res://Escenas/Instancia3.tscn")
	if ins == 4:
		get_tree().change_scene("res://Escenas/Instancia3a.tscn")

func _on_Configuracin_pressed():
	get_tree().change_scene("res://Escenas/Configuración.tscn")

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_ESCAPE:
			get_tree().quit()

func _on_Borrar_Partida_pressed():
	get_tree().change_scene("res://Escenas/BorrarPartida.tscn")

func _ready():
	var ins = load_game()
	var file = File.new()
	if ins == null:
		get_node("VBoxBotones/Cargar Partida").disabled = true
	if not file.file_exists("user://save_nombre"+perfilp.perfil+".txt"):
		get_node("VBoxBotones/Borrar Partida").disabled = true
	Input.set_custom_mouse_cursor(puntero)

func _on_Perfiles_pressed():
	get_tree().change_scene("res://Escenas/SelecciónPerfil.tscn")
