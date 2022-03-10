extends Node2D

func _ready():
	pass

func _on_Aceptar_pressed():
	get_tree().change_scene("res://Escenas/Datos.tscn")
