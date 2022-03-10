extends Node2D

onready var perfilp = get_node("/root/Globales")

func save_name1():
	var file = File.new()
	file.open("user://save_nombre"+perfilp.perfil+".txt", file.WRITE)
	file.store_line(perfilp.nombre1)
	file.close()
	
func save_name2():
	var file = File.new()
	file.open("user://save_nombre"+perfilp.perfil+".txt", file.WRITE)
	file.store_line(perfilp.nombre2)
	file.close()
	
func save_name3():
	var file = File.new()
	file.open("user://save_nombre"+perfilp.perfil+".txt", file.WRITE)
	file.store_line(perfilp.nombre3)
	file.close()

func _ready():
	pass 

func _on_Volver_pressed():
	get_tree().change_scene("res://Escenas/SelecciónPerfil.tscn")

func _on_AceptarNombre_pressed():
	var file = File.new()
	
	if perfilp.perfil == "1":
		perfilp.nombre1 = $Nombre.text
		file.open("user://save_nombre1.txt", File.WRITE)
		file.store_line(perfilp.nombre1)
		file.close()

	if perfilp.perfil == "2":
		perfilp.nombre2 = $Nombre.text
		file.open("user://save_nombre2.txt", File.WRITE)
		file.store_line(perfilp.nombre2)
		file.close()

	if perfilp.perfil == "3":
		perfilp.nombre3 = $Nombre.text
		file.open("user://save_nombre3.txt", File.WRITE)
		file.store_line(perfilp.nombre3)
		file.close()

	get_tree().change_scene("res://Menu Principal.tscn")
