extends KinematicBody2D

var vida : float = 10
var vidaMax: int = 10
var magia: int = 10
var magiaMax: int =10
var velocidad : int = 400
var danio : int = 1
 
var nivel : int = 0
 
var interactDist : int = 70
 
var vel = Vector2()
var facingDir = Vector2()

var Proyectil = preload("res://Escenas/Proyectil.tscn")
var puede_disparar = true

var Escudo = preload("res://Escenas/Escudo.tscn") 

export var proyectil_vel = 1000
export var rate_disparo = 0.2
 
onready var rayCast = $RayCast2D

onready var ui = get_node("/root/Node2D/CanvasLayer/UI")
onready var sonido_danio = get_node("/root/SonidoPjD")
onready var sonido_muere = get_node("/root/SonidoMuerePj")

func _physics_process (delta):
	vel = Vector2()
	if Input.is_action_pressed("mover_arriba"):
		vel.y -= 1
		facingDir = Vector2(0, -1)
	if Input.is_action_pressed("mover_abajo"):
		vel.y += 1
		facingDir = Vector2(0, 1)
	if Input.is_action_pressed("mover_izquierda"):
		vel.x -= 1
		facingDir = Vector2(-1, 0)
	if Input.is_action_pressed("mover_derecha"):
		vel.x += 1
		facingDir = Vector2(1, 0)
	if Input.is_action_pressed("protegerse") and magia >= 1:
			emit_signal("protect", Escudo, position)
			magia = magia - 1
			ui.actualizar_barra_magia(magia, magiaMax)
	if Input.is_action_just_released("protegerse"):
			emit_signal("noprotect")
	vel = vel.normalized()
	
	move_and_slide(vel * velocidad, Vector2.ZERO)
	manage_animations()

onready var anim = $AnimatedSprite

func manage_animations ():
	if vel.x > 0:
		play_animation("MoverDerecha")
	elif vel.x < 0:
		play_animation("MoverIzquierda")
	elif vel.y < 0:
		play_animation("MoverArriba")
	elif vel.y > 0:
		play_animation("MoverAbajo")
	elif facingDir.x == 1:
		play_animation("IdleDerecha")
	elif facingDir.x == -1:
		play_animation("IdleIzquierda")
	elif facingDir.y == -1:
		play_animation("IdleArriba")
	elif facingDir.y == 1:
		play_animation("IdleAbajo")

func play_animation (anim_name):
	if anim.animation != anim_name:
		anim.play(anim_name)

func _ready ():
	ui.actualizar_barra_vida(vida, vidaMax)
	ui.actualizar_barra_magia(magia, magiaMax)
   
func _on_Puerta_body_entered(body):
	if body.get_name() == "Jugador":
		get_tree().change_scene("res://Escenas/Instancia1.tscn")
	
func take_damage (dmgToTake):
	vida -= dmgToTake
	$AnimationPlayer.play("Danio")
	sonido_danio.play()
	ui.actualizar_barra_vida(vida, vidaMax)
	if vida <= 0:
		sonido_muere.play()
		die()

func sust_magic ():
	magia = magia - 1
	ui.actualizar_barra_magia(magia, magiaMax)
 
func die ():
	get_tree().reload_current_scene()
	
func _process (delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_released("protegerse"):
			emit_signal("noprotect", Escudo)

func _on_Area2D_body_entered(body):
	if body.get_name() == "Jugador":
		get_tree().change_scene("res://Escenas/Comienzo2.tscn")

func _on_Puerta1_body_entered(body):
	if body.get_name() == "Jugador":
		get_tree().change_scene("res://Escenas/Instancia2.tscn")

func _on_PuertaFin_body_entered(body):
	if body.get_name() == "Jugador":
		get_tree().change_scene("res://Escenas/Fin.tscn")

signal shoot(proyectil, direction, location) #Para disparo
signal protect(escudo, location)
signal noprotect()

func _input(event): #Para disparo
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed and magia >= 1:
			emit_signal("shoot", Proyectil, rotation, position)
			magia = magia - 1
			ui.actualizar_barra_magia(magia, magiaMax)
		if event.button_index == BUTTON_RIGHT and Input.is_action_just_released("protegerse"):
			Escudo.instance().die()

func _on_Timer_timeout():
	if magia < 10:
		magia = magia + 1
		ui.actualizar_barra_magia(magia, magiaMax)
	if vida < 10:
		vida = vida + 0.2
		ui.actualizar_barra_vida(vida, vidaMax)
