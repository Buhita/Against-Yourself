extends Node2D

func _ready():
	pass 

func _on_Volver_pressed():
	get_tree().change_scene("res://Escenas/SelecciónPerfil.tscn")

func _on_EliminarTodo_pressed():
	get_tree().change_scene("res://Escenas/BorrarPartidas.tscn")
