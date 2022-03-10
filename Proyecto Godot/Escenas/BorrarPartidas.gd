extends Node2D

func _ready():
	pass 

func _on_Si_pressed():
	var dir = Directory.new()
	dir.remove("user://save_1.dat")
	dir.remove("user://save_nombre1.txt")
	dir.remove("user://save_1.txt")
	dir.remove("user://save_tiempo1.txt")
	dir.remove("user://terminado1.dat")
	
	dir.remove("user://save_2.dat")
	dir.remove("user://save_nombre2.txt")
	dir.remove("user://save_2.txt")
	dir.remove("user://save_tiempo2.txt")
	dir.remove("user://terminado2.dat")
	
	dir.remove("user://save_3.dat")
	dir.remove("user://save_nombre3.txt")
	dir.remove("user://save_3.txt")
	dir.remove("user://save_tiempo3.txt")
	dir.remove("user://terminado3.dat")
	
	get_tree().change_scene("res://Escenas/PartidasEliminadas.tscn")

func _on_No_pressed():
	get_tree().change_scene("res://Escenas/Datos.tscn")
