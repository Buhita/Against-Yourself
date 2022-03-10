extends Node2D

onready var perfilp = get_node("/root/Globales")
onready var sonido_victoria = get_node("/root/SonidoVictoria")

func _on_Atras_pressed():
	get_tree().change_scene("res://Menu Principal.tscn")

func _ready():
	var file = File.new()
	file.open("user://terminado"+perfilp.perfil+".dat", File.WRITE)
	file.close()
	sonido_victoria.play()
	
