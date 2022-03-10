extends Node2D

onready var perfilp = get_node("/root/Globales")
onready var musica = get_node("/root/Musica")

func _ready():
	var file = File.new()
	file.open("user://gu.dat", File.WRITE)
	file.store_line("gestor")
	file.close()
	file.open("user://gc.dat", File.WRITE)
	file.store_line("gestor")	
	musica.play()
	
func _on_Salir_pressed():
	get_tree().quit()

func _on_P1_pressed():
	perfilp.perfil = "1"
	var file = File.new()
	if file.file_exists("user://save_nombre1.txt"):
		get_tree().change_scene("res://Menu Principal.tscn")
	else:
		get_tree().change_scene("res://Escenas/IngresarNombre.tscn")

func _on_P2_pressed():
	perfilp.perfil = "2"
	var file = File.new()
	if file.file_exists("user://save_nombre2.txt"):
		get_tree().change_scene("res://Menu Principal.tscn")
	else:
		get_tree().change_scene("res://Escenas/IngresarNombre.tscn")

func _on_P3_pressed():
	perfilp.perfil = "3"
	var file = File.new()
	if file.file_exists("user://save_nombre3.txt"):
		get_tree().change_scene("res://Menu Principal.tscn")
	else:
		get_tree().change_scene("res://Escenas/IngresarNombre.tscn")

func _on_Gestion_pressed():
	get_tree().change_scene("res://Escenas/Gestión.tscn")
