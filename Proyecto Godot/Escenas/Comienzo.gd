extends Node2D

onready var puerta = get_node("Puerta")

onready var body = get_parent().get_node("Jugador")
onready var enemy = get_parent().get_node("Enemigo1")
onready var perfilp = get_node("/root/Globales")
onready var sonido_disparo = get_node("/root/SonidoDisparo")

onready var timer = Timer.new()

var Proyectil = preload("res://Escenas/Proyectil.tscn") #Para disparo
var Escudo = preload("res://Escenas/Escudo.tscn") #Para Escudo

func _on_Atras_pressed():
	
	get_tree().change_scene("res://Menu Principal.tscn")

func load_game():
	var file = File.new()
	if not file.file_exists("user://save_"+perfilp.perfil+".dat"):
		return
	file.open("user://save_"+perfilp.perfil+".dat", file.READ)
	var ins = file.get_var()
	file.close()
	
func save_game():
	var ins = null
	var file = File.new()
	file.open("user://save_"+perfilp.perfil+".dat", file.WRITE)
	file.store_var(ins)
	file.close()
	
func escudo_timer():
	timer.set_wait_time(5.0)
	timer.set_one_shot(true)
	timer.start()
	if timer.get_time_left() == 0:
		$Escudo.position = Vector2(-267.27,131.853)

func _on_No_pressed():
	get_tree().change_scene("res://Menu Principal.tscn")

func _on_Si_pressed():
	var dir = Directory.new()
	dir.remove("user://save_"+perfilp.perfil+".dat")
	dir.remove("user://save_nombre"+perfilp.perfil+".txt")
	dir.remove("user://save_"+perfilp.perfil+".txt")
	dir.remove("user://save_tiempo"+perfilp.perfil+".txt")
	if perfilp.perfil ==  "1":
		dir.remove("user://terminado1.dat")
	elif perfilp.perfil ==  "2":
		dir.remove("user://terminado2.dat")
	elif perfilp.perfil ==  "3":
		dir.remove("user://terminado3.dat")
	get_tree().change_scene("res://Escenas/PartidaEliminada.tscn")

func _on_Jugador_shoot(proyectil, direction, location):
	var p = Proyectil.instance()
	add_child(p)
	p.rotation = direction
	p.position = location
	sonido_disparo.play()

func _on_Jugador_protect(escudo, location):
	if Input.is_action_pressed("protegerse"):
		$Escudo.position = location
	#	timer.set_wait_time(5.0)
	#	timer.set_one_shot(true)
	#	timer.start()
	#	if timer.get_time_left() == 0:
	#		$Escudo.position = Vector2(-267.27,131.853)
			#escudo_timer()
	else:
		$Escudo.die()

