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
 
var Proyectil = preload("res://Escenas/Proyectil.tscn") #Para disparo
var puede_disparar = true #Para disparo

var Escudo = preload("res://Escenas/Escudo.tscn") 

onready var rayCast = $RayCast2D

onready var ui = get_node("/root/Node2D/CanvasLayer/UI")
onready var sonido_danio = get_node("/root/SonidoPjD")

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
	ui.actualizar_barra_vida(vida, vidaMax)
	sonido_danio.play()
	if vida <= 0:
		die()

func die ():
	get_tree().reload_current_scene()
	
func _process (delta):
	look_at(get_global_mouse_position())

func try_interact ():
	rayCast.cast_to = facingDir * interactDist
	if rayCast.is_colliding():
		if rayCast.get_collider() is KinematicBody2D:
			rayCast.get_collider().take_damage(danio)
			magia = magia - 1
			ui.actualizar_barra_magia(magia, magiaMax)
		elif rayCast.get_collider().has_method("on_interact"):
			rayCast.get_collider().on_interact(self)

func _on_Puerta2_body_entered(body):
	if body.get_name() == "Jugador":
		get_tree().change_scene("res://Escenas/Instancia3.tscn")
		
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
