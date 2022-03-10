extends Node2D

onready var puerta = get_node("Puerta")
onready var perfilp = get_node("/root/Globales")

onready var body = get_parent().get_node("Jugador")
onready var enemy = get_parent().get_node("Enemigo1")
onready var sonido_disparo = get_node("/root/SonidoDisparo")

var Proyectil = preload("res://Escenas/Proyectil.tscn") #Para disparo
var Escudo = preload("res://Escenas/Escudo.tscn") #Para Escudo

func _on_Atras_pressed():
	get_tree().change_scene("res://Menu Principal.tscn")

func save_game():
	var ins = 3
	var file = File.new()
	file.open("user://save_"+perfilp.perfil+".dat", file.WRITE)
	file.store_var(ins)
	file.close()

func load_game():
	var file = File.new()
	if not file.file_exists("user://save_"+perfilp.perfil+".dat"):
		return
	file.open("user://save_"+perfilp.perfil+".dat", file.READ)
	var ins = file.get_var()
	file.close()
	
func _ready():
	save_game()
	
func _on_Jugador_shoot(proyectil, direction, location): #Para disparo
	var p = Proyectil.instance()
	add_child(p)
	p.rotation = direction
	p.position = location	
	sonido_disparo.play()

func _on_Jugador_protect(escudo, location):
	if Input.is_action_pressed("protegerse"):
		$Escudo.position = location
	else:
		$Escudo.die()

func _on_Jugador_noprotect(Escudo):
	$Escudo.die()
